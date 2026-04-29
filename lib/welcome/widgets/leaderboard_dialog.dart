import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../data/test_results_repository.dart';
import '../../strings.dart';

class LeaderboardDialog extends StatefulWidget {
  const LeaderboardDialog({
    super.key,
    this.repository = const TestResultsRepository(),
    this.currentUserId,
  });

  final TestResultsRepository repository;
  final String? currentUserId;

  @override
  State<LeaderboardDialog> createState() => _LeaderboardDialogState();
}

class _LeaderboardDialogState extends State<LeaderboardDialog> {
  late Future<List<LeaderboardEntry>> _future;

  @override
  void initState() {
    super.initState();
    _future = widget.repository.fetchTop10();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ForestSpacing.spaceX3,
        vertical: ForestSpacing.spaceY3,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.emoji_events_rounded,
                color: ForestColors.aspenYellow,
                size: 28,
              ),
              Flexible(
                child: ForestText.textBodyLBold(
                  label: Strings.leaderboardTitle.toUpperCase(),
                  fontFamily: 'Mohr',
                  textAlign: TextAlign.center,
                  color: ForestColors.darkestForest,
                ),
              ),
              const SizedBox(width: 28),
            ],
          ),
          const SizedBox(height: ForestSpacing.spaceY3),
          FutureBuilder<List<LeaderboardEntry>>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: ForestColors.darkForest,
                    ),
                  ),
                );
              }
              final rows = snapshot.data ?? const <LeaderboardEntry>[];
              if (rows.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: ForestText.textBodyM(
                    label: Strings.leaderboardEmpty,
                    textAlign: TextAlign.center,
                    color: ForestColors.mildBlack,
                  ),
                );
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var i = 0; i < rows.length; i++)
                    _LeaderboardRow(
                      rank: i + 1,
                      entry: rows[i],
                      isCurrentUser: rows[i].userId == widget.currentUserId,
                    ),
                ],
              );
            },
          ),
          const SizedBox(height: ForestSpacing.spaceY3),
          ForestButton.light(
            size: ForestButtonSize.lg,
            label: Strings.leaderboardClose,
            expanded: true,
            elevated: false,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      ),
    );
  }
}

class _LeaderboardRow extends StatelessWidget {
  const _LeaderboardRow({
    required this.rank,
    required this.entry,
    required this.isCurrentUser,
  });

  final int rank;
  final LeaderboardEntry entry;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: ForestSpacing.spaceY1),
      padding: const EdgeInsets.symmetric(
        horizontal: ForestSpacing.spaceX2,
        vertical: ForestSpacing.spaceY1,
      ),
      decoration: BoxDecoration(
        color: ForestColors.white,
        border: Border.all(
          color: isCurrentUser
              ? ForestColors.darkForest
              : ForestColors.darkestForest.withValues(alpha: 0.12),
          width: isCurrentUser ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(ForestBorder.radiusM),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 28,
            child: ForestText.textBodyLBold(
              label: '$rank',
              fontFamily: 'Mohr',
              color: ForestColors.darkestForest,
            ),
          ),
          const SizedBox(width: ForestSpacing.spaceX1),
          Expanded(
            child: ForestText.textBodyM(
              label: entry.name,
              color: ForestColors.darkestForest,
              textOverflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(width: ForestSpacing.spaceX1),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: ForestSpacing.spaceX1,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              color: entry.passed
                  ? ForestColors.lightForest
                  : ForestColors.softMappleRed,
              borderRadius: BorderRadius.circular(999),
            ),
            child: ForestText.textBodyS(
              label: entry.passed
                  ? Strings.welcomePassed
                  : Strings.welcomeFailed,
              color: entry.passed
                  ? ForestColors.darkForest
                  : ForestColors.mappleRed,
            ),
          ),
          const SizedBox(width: ForestSpacing.spaceX1),
          ForestText.textBodyMBold(
            label: Strings.reactionTimeMs(entry.reactionTimeMs),
            color: ForestColors.darkestForest,
          ),
        ],
      ),
    );
  }
}
