import '../app_config.dart';
import 'supabase_config.dart';

class TestResult {
  const TestResult({
    required this.reactionTimeMs,
    required this.createdAt,
  });

  factory TestResult.fromJson(Map<String, dynamic> json) => TestResult(
        reactionTimeMs: (json['reaction_time_ms'] as num).toInt(),
        createdAt: DateTime.parse(json['created_at'] as String),
      );

  final int reactionTimeMs;
  final DateTime createdAt;

  bool get passed => AppConfig.isPassed(reactionTimeMs);
}

class LeaderboardEntry {
  const LeaderboardEntry({
    required this.userId,
    required this.name,
    required this.reactionTimeMs,
  });

  factory LeaderboardEntry.fromJson(Map<String, dynamic> json) =>
      LeaderboardEntry(
        userId: json['user_id'] as String,
        name: json['name'] as String,
        reactionTimeMs: (json['reaction_time_ms'] as num).toInt(),
      );

  final String userId;
  final String name;
  final int reactionTimeMs;

  bool get passed => AppConfig.isPassed(reactionTimeMs);
}

class TestResultsRepository {
  const TestResultsRepository();

  Future<void> ensureUser({required String id, required String name}) async {
    if (!SupabaseConfig.isConfigured) return;
    await SupabaseConfig.client
        .from('app_users')
        .upsert({'id': id, 'name': name}, onConflict: 'id');
  }

  Future<void> insertResult({
    required String userId,
    required int reactionTimeMs,
  }) async {
    if (!SupabaseConfig.isConfigured) return;
    await SupabaseConfig.client.from('test_results').insert({
      'user_id': userId,
      'reaction_time_ms': reactionTimeMs,
    });
  }

  Future<TestResult?> fetchLatest(String userId) async {
    if (!SupabaseConfig.isConfigured) return null;
    final rows = await SupabaseConfig.client
        .from('test_results')
        .select('reaction_time_ms, created_at')
        .eq('user_id', userId)
        .order('created_at', ascending: false)
        .limit(1);
    if (rows.isEmpty) return null;
    return TestResult.fromJson(rows.first);
  }

  Future<TestResult?> fetchPersonalBest(String userId) async {
    if (!SupabaseConfig.isConfigured) return null;
    final rows = await SupabaseConfig.client
        .from('test_results')
        .select('reaction_time_ms, created_at')
        .eq('user_id', userId)
        .order('reaction_time_ms', ascending: true)
        .order('created_at', ascending: true)
        .limit(1);
    if (rows.isEmpty) return null;
    return TestResult.fromJson(rows.first);
  }

  Future<int?> fetchRankForTime(int reactionTimeMs) async {
    if (!SupabaseConfig.isConfigured) return null;
    final result = await SupabaseConfig.client
        .rpc('rank_for_time', params: {'target_ms': reactionTimeMs});
    if (result is int) return result;
    if (result is num) return result.toInt();
    return null;
  }

  Future<List<LeaderboardEntry>> fetchTop10() async {
    if (!SupabaseConfig.isConfigured) return const [];
    final rows = await SupabaseConfig.client
        .from('leaderboard_top10')
        .select('user_id, name, reaction_time_ms');
    return rows
        .map((row) => LeaderboardEntry.fromJson(row))
        .toList(growable: false);
  }
}
