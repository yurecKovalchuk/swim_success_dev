import 'package:flutter/material.dart';
import 'package:swim_success_dev/domain/models/user.dart';

class UserListTile extends StatelessWidget {
  final User user;
  final VoidCallback onTap;

  const UserListTile({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(
        radius: 22,
        backgroundColor: theme.colorScheme.primaryContainer,
        child: Text(
          user.name[0].toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
      ),
      title: Text(
        user.name,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.email,
            style: TextStyle(
                color: theme.colorScheme.onSurface.withAlpha(150)),
          ),
          Text(
            user.phone,
            style: TextStyle(
                color: theme.colorScheme.onSurface.withAlpha(130)),
          ),
        ],
      ),
      isThreeLine: true,
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
