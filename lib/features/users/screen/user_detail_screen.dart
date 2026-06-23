import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:swim_success_dev/app/app_shell.dart';
import 'package:swim_success_dev/core/extensions/l10n_extension.dart';
import 'package:swim_success_dev/domain/models/user.dart';

@RoutePage()
class UserDetailScreen extends StatelessWidget {
  final User user;

  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: kFloatingNavBarHeight + MediaQuery.of(context).padding.bottom,
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 32),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.cyanAccent.withOpacity(0.22),
                    Colors.blue.shade400.withOpacity(0.30),
                    Colors.cyan.shade800.withOpacity(0.40),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: theme.colorScheme.primary,
                    child: Text(
                      user.name[0].toUpperCase(),
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    user.name,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  Text(
                    '@${user.username}',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer
                          .withAlpha(180),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SectionHeader(label: context.l10n.detailContact),
                  const SizedBox(height: 12),
                  _DetailRow(
                    icon: Icons.email_outlined,
                    label: context.l10n.detailEmail,
                    value: user.email,
                  ),
                  const Divider(height: 24),
                  _DetailRow(
                    icon: Icons.phone_outlined,
                    label: context.l10n.detailPhone,
                    value: user.phone,
                  ),
                  const Divider(height: 24),
                  _DetailRow(
                    icon: Icons.language_outlined,
                    label: context.l10n.detailWebsite,
                    value: user.website,
                  ),
                  const SizedBox(height: 24),
                  _SectionHeader(label: context.l10n.detailAddress),
                  const SizedBox(height: 12),
                  _DetailRow(
                    icon: Icons.location_on_outlined,
                    label: context.l10n.detailCity,
                    value:
                        '${user.address.suite}, ${user.address.street}\n${user.address.city}, ${user.address.zipcode}',
                  ),
                  const SizedBox(height: 24),
                  _SectionHeader(label: context.l10n.detailCompany),
                  const SizedBox(height: 12),
                  _DetailRow(
                    icon: Icons.business_outlined,
                    label: context.l10n.detailCompanyName,
                    value: user.company.name,
                  ),
                  const Divider(height: 24),
                  _DetailRow(
                    icon: Icons.format_quote_outlined,
                    label: context.l10n.detailCatchPhrase,
                    value: user.company.catchPhrase,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String label;
  const _SectionHeader({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.8,
          ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: theme.colorScheme.primary, size: 20),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withAlpha(150),
                ),
              ),
              Text(
                value,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
