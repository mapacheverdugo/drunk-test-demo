import 'dart:developer';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uuid/uuid.dart';

import '../app_config.dart';
import '../data/test_results_repository.dart';
import '../data/user_session_storage.dart';
import '../drunk_test/drunk_test_explanatory_page.dart';
import '../drunk_test/widgets/forest_dialog_base.dart';
import '../strings.dart';
import 'widgets/clear_name_dialog.dart';
import 'widgets/leaderboard_dialog.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    super.key,
    this.repository = const TestResultsRepository(),
  });

  final TestResultsRepository repository;

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  static const _minNameLength = 3;

  final TextEditingController _nameController = TextEditingController();
  UserSession? _session;
  bool _initializing = true;
  bool _busy = false;

  TestResult? _lastResult;
  TestResult? _personalBest;
  int? _lastRank;
  int? _personalBestRank;

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _bootstrap() async {
    final session = await UserSessionStorage.load();
    if (!mounted) return;
    setState(() {
      _session = session;
      if (session != null) {
        _nameController.text = session.name;
      }
      _initializing = false;
    });
    if (session != null) {
      await _refreshResults(session.id);
    }
  }

  Future<void> _refreshResults(String userId) async {
    try {
      final results = await Future.wait([
        widget.repository.fetchLatest(userId),
        widget.repository.fetchPersonalBest(userId),
      ]);
      final last = results[0];
      final best = results[1];
      final ranks = await Future.wait([
        last == null
            ? Future<int?>.value(null)
            : widget.repository.fetchRankForTime(last.reactionTimeMs),
        best == null
            ? Future<int?>.value(null)
            : widget.repository.fetchRankForTime(best.reactionTimeMs),
      ]);
      if (!mounted) return;
      setState(() {
        _lastResult = last;
        _personalBest = best;
        _lastRank = ranks[0];
        _personalBestRank = ranks[1];
      });
    } catch (e, st) {
      log('Failed to load welcome results', error: e, stackTrace: st);
    }
  }

  bool get _canStart {
    final name = _nameController.text.trim();
    return name.length >= _minNameLength && !_busy;
  }

  Future<void> _onStartPressed() async {
    final name = _nameController.text.trim();
    if (name.length < _minNameLength) return;

    setState(() => _busy = true);
    var session = _session;
    try {
      if (session == null) {
        final id = const Uuid().v4();
        session = UserSession(id: id, name: name);
        await UserSessionStorage.save(session);
        try {
          await widget.repository.ensureUser(id: id, name: name);
        } catch (e, st) {
          log('Failed to register user in Supabase',
              error: e, stackTrace: st);
        }
        if (!mounted) return;
        setState(() => _session = session);
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }

    if (!mounted) return;
    final activeId = session.id;

    await Navigator.of(context).push<bool?>(
      MaterialPageRoute<bool?>(
        builder: (_) => DrunkTestExplanatoryPage(
          blockedByTimeInSeconds: AppConfig.blockedByTimeInSeconds,
          maxReactionTimeInMilliseconds: AppConfig.passThresholdMs,
          loadingTimeInSeconds: AppConfig.loadingTimeInSeconds,
          maxAttempts: AppConfig.maxAttempts,
          userId: activeId,
        ),
      ),
    );

    if (!mounted) return;
    await _refreshResults(activeId);
  }

  Future<void> _onClearNamePressed() async {
    final confirmed = await showDialog<bool>(
      context: context,
      useSafeArea: false,
      barrierDismissible: false,
      builder: (_) => const ForestDialogBase(child: ClearNameDialog()),
    );
    if (confirmed != true || !mounted) return;
    await UserSessionStorage.clear();
    if (!mounted) return;
    setState(() {
      _session = null;
      _nameController.clear();
      _lastResult = null;
      _personalBest = null;
      _lastRank = null;
      _personalBestRank = null;
    });
  }

  Future<void> _openLeaderboard() async {
    await showDialog<void>(
      context: context,
      useSafeArea: false,
      barrierDismissible: true,
      builder: (_) => ForestDialogBase(
        child: LeaderboardDialog(
          key: UniqueKey(),
          currentUserId: _session?.id,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasSession = _session != null;

    return Scaffold(
      backgroundColor: ForestColors.iceCream,
      body: Stack(
        children: [
          if (_initializing)
            const Center(
              child: CircularProgressIndicator(
                color: ForestColors.darkForest,
              ),
            )
          else
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: SafeArea(
                      bottom: false,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: ForestSpacing.spaceX3,
                          vertical: ForestSpacing.spaceY3,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: ForestSpacing.spaceY7),
                            Center(
                              child: SvgPicture.asset(
                                'assets/svg/traffic_light_both.svg',
                                height: 140,
                              ),
                            ),
                            const SizedBox(height: ForestSpacing.spaceY5),
                            ForestText.textHeadingL(
                              label: Strings.landingTitle.toUpperCase(),
                              fontFamily: 'Mohr',
                              textAlign: TextAlign.center,
                              color: ForestColors.darkestForest,
                            ),
                            const SizedBox(height: ForestSpacing.spaceY1),
                            ForestText.textBodyM(
                              label: Strings.landingSubtitle,
                              textAlign: TextAlign.center,
                              color: ForestColors.mildBlack,
                            ),
                            const SizedBox(height: ForestSpacing.spaceY5),
                            _NameField(
                              controller: _nameController,
                              locked: hasSession,
                              onChanged: (_) => setState(() {}),
                              onClearPressed:
                                  hasSession ? _onClearNamePressed : null,
                            ),
                            if (hasSession) ...[
                              const SizedBox(height: ForestSpacing.spaceY3),
                              _ResultRow(
                                label: Strings.welcomeLastResultLabel,
                                result: _lastResult,
                                rank: _lastRank,
                              ),
                              const SizedBox(height: ForestSpacing.spaceY1),
                              _ResultRow(
                                label: Strings.welcomePersonalRecordLabel,
                                result: _personalBest,
                                rank: _personalBestRank,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      ForestSpacing.spaceX3,
                      ForestSpacing.spaceY3,
                      ForestSpacing.spaceX3,
                      ForestSpacing.spaceY3,
                    ),
                    child: ForestButton.primary(
                      size: ForestButtonSize.lg,
                      label: Strings.landingButton,
                      expanded: true,
                      enabled: _canStart,
                      isLoading: _busy,
                      onPressed: _canStart ? _onStartPressed : null,
                    ),
                  ),
                ),
              ],
            ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: ForestSpacing.spaceY1,
                  right: ForestSpacing.spaceX1,
                ),
                child: IconButton(
                  onPressed: _openLeaderboard,
                  tooltip: Strings.leaderboardTitle,
                  icon: const Icon(
                    Icons.emoji_events_rounded,
                    color: ForestColors.darkestForest,
                    size: 28,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField({
    required this.controller,
    required this.locked,
    required this.onChanged,
    required this.onClearPressed,
  });

  final TextEditingController controller;
  final bool locked;
  final ValueChanged<String> onChanged;
  final VoidCallback? onClearPressed;

  @override
  Widget build(BuildContext context) {
    return ForestTextField(
      isValid: true,
      labelText: Strings.welcomeNameLabel,
      hintText: Strings.welcomeNameHint,
      textEditingController: controller,
      readOnly: locked,
      onChanged: onChanged,
      textCapitalization: TextCapitalization.words,
      maxLength: 40,
      suffixIcon: locked
          ? Padding(
              padding: const EdgeInsets.only(right: ForestSpacing.spaceX1),
              child: IconButton(
                onPressed: onClearPressed,
                icon: const Icon(
                  Icons.close_rounded,
                  color: ForestColors.darkestForest,
                ),
              ),
            )
          : null,
    );
  }
}

class _ResultRow extends StatelessWidget {
  const _ResultRow({
    required this.label,
    required this.result,
    required this.rank,
  });

  final String label;
  final TestResult? result;
  final int? rank;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: ForestSpacing.spaceX2,
        vertical: ForestSpacing.spaceY1,
      ),
      decoration: BoxDecoration(
        color: ForestColors.white,
        border: Border.all(
          color: ForestColors.darkestForest.withValues(alpha: 0.12),
        ),
        borderRadius: BorderRadius.circular(ForestBorder.radiusM),
      ),
      child: Row(
        children: [
          Expanded(
            child: ForestText.textBodyM(
              label: label,
              color: ForestColors.mildBlack,
            ),
          ),
          if (result == null)
            ForestText.textBodyM(
              label: Strings.welcomeNoResultsYet,
              color: ForestColors.mildBlack,
            )
          else ...[
            if (rank != null) ...[
              ForestText.textBodyMBold(
                label: '#${rank!}',
                color: ForestColors.darkestForest,
              ),
              const SizedBox(width: ForestSpacing.spaceX1),
            ],
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: ForestSpacing.spaceX1,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: result!.passed
                    ? ForestColors.lightForest
                    : ForestColors.softMappleRed,
                borderRadius: BorderRadius.circular(999),
              ),
              child: ForestText.textBodyS(
                label: result!.passed
                    ? Strings.welcomePassed
                    : Strings.welcomeFailed,
                color: result!.passed
                    ? ForestColors.darkForest
                    : ForestColors.mappleRed,
              ),
            ),
            const SizedBox(width: ForestSpacing.spaceX1),
            ForestText.textBodyMBold(
              label: Strings.reactionTimeMs(result!.reactionTimeMs),
              color: ForestColors.darkestForest,
            ),
          ],
        ],
      ),
    );
  }
}
