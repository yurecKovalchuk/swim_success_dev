import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swim_success_dev/app/app_router/app_router.gr.dart';
import 'package:swim_success_dev/features/users/bloc/users_cubit.dart';
import 'package:swim_success_dev/features/users/bloc/users_state.dart';
import 'package:swim_success_dev/features/users/widgets/user_list_tile.dart';

@RoutePage()
class UsersListScreen extends StatefulWidget {
  const UsersListScreen({super.key});

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UsersCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<UsersCubit>();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Users'),
              centerTitle: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: BlocBuilder<UsersCubit, UsersState>(
                    buildWhen: (prev, curr) =>
                        prev.searchQuery != curr.searchQuery,
                    builder: (context, state) => SearchBar(
                      controller: _searchController,
                      hintText: 'Search by name or email…',
                      leading: const Icon(Icons.search),
                      trailing: [
                        if (state.searchQuery.isNotEmpty)
                          IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                              cubit.setSearchQuery('');
                            },
                          ),
                      ],
                      onChanged: cubit.setSearchQuery,
                    ),
                  ),
                ),
              ),
            ),
            body: BlocBuilder<UsersCubit, UsersState>(
              builder: (context, state) => switch (state.status) {
                UsersStatus.initial ||
                UsersStatus.loading =>
                  const Center(child: CircularProgressIndicator()),
                UsersStatus.failure => _ErrorView(
                    message: state.errorMessage,
                    onRetry: cubit.fetchUsers,
                  ),
                UsersStatus.success => _UsersList(state: state, cubit: cubit),
              },
            ),
          );
        },
      ),
    );
  }
}

class _UsersList extends StatelessWidget {
  final UsersState state;
  final UsersCubit cubit;

  const _UsersList({required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
    final users = state.filteredUsers;

    if (users.isEmpty) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search_off, size: 48),
            SizedBox(height: 12),
            Text('No users found'),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: cubit.fetchUsers,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: users.length,
        separatorBuilder: (_, _) => const Divider(height: 1),
        itemBuilder: (context, index) => UserListTile(
          user: users[index],
          onTap: () => context.router.push(UserDetailRoute(user: users[index])),
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String? message;
  final VoidCallback onRetry;

  const _ErrorView({this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline,
              size: 48, color: Theme.of(context).colorScheme.error),
          const SizedBox(height: 12),
          const Text('Failed to load users'),
          const SizedBox(height: 16),
          FilledButton.tonal(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}
