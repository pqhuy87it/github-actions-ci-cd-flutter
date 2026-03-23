import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/search_providers.dart';
import 'user_tile.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSearch(String value) {
    ref.read(searchQueryProvider.notifier).update(value);
  }

  void _onSubmit(String value) {
    if (value.isNotEmpty) {
      ref.read(searchHistoryProvider.notifier).add(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchAsync = ref.watch(searchResultsProvider);
    final history = ref.watch(searchHistoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('GitHub Search')),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              key: const Key('search_field'),
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Search GitHub users...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                  key: const Key('clear_button'),
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                    _onSearch('');
                  },
                )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: _onSearch,
              onSubmitted: _onSubmit,
            ),
          ),

          // Results
          Expanded(
            child: searchAsync.when(
              loading: () => const Center(
                key: Key('loading_indicator'),
                child: CircularProgressIndicator(),
              ),
              error: (error, _) => Center(
                key: const Key('error_view'),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error_outline, size: 48),
                    const SizedBox(height: 8),
                    Text('Error: $error'),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      key: const Key('retry_button'),
                      onPressed: () =>
                          ref.invalidate(searchResultsProvider),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
              data: (result) {
                if (result.users.isEmpty &&
                    ref.read(searchQueryProvider).isNotEmpty) {
                  return const Center(
                    key: Key('empty_view'),
                    child: Text('No users found'),
                  );
                }

                if (result.users.isEmpty) {
                  // Show search history
                  return _buildHistory(history);
                }

                return ListView.builder(
                  key: const Key('results_list'),
                  itemCount: result.users.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (_, index) =>
                      UserTile(user: result.users[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistory(List<String> history) {
    if (history.isEmpty) {
      return const Center(
        key: Key('initial_view'),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search, size: 64, color: Colors.grey),
            SizedBox(height: 8),
            Text('Search for GitHub users'),
          ],
        ),
      );
    }

    return ListView(
      key: const Key('history_list'),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Recent Searches',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextButton(
              key: const Key('clear_history_button'),
              onPressed: () =>
                  ref.read(searchHistoryProvider.notifier).clear(),
              child: const Text('Clear'),
            ),
          ],
        ),
        ...history.map(
              (query) => ListTile(
            leading: const Icon(Icons.history),
            title: Text(query),
            onTap: () {
              _controller.text = query;
              _onSearch(query);
            },
          ),
        ),
      ],
    );
  }
}