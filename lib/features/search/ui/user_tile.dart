
// ============================================================
// lib/features/search/ui/user_tile.dart
// ============================================================

import 'package:flutter/material.dart';
import '../data/user_model.dart';

class UserTile extends StatelessWidget {
  const UserTile({required this.user, super.key});

  final GitHubUser user;

  @override
  Widget build(BuildContext context) {
    return Card(
      key: Key('user_tile_${user.id}'),
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user.avatarUrl),
          onBackgroundImageError: (_, __) {},
        ),
        title: Text(user.username),
        subtitle: Text('${user.repoCount} repos'),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}