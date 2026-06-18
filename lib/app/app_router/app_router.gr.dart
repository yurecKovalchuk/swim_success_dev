// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:swim_success_dev/app/app_shell.dart' as _i1;
import 'package:swim_success_dev/domain/models/user.dart' as _i7;
import 'package:swim_success_dev/features/pace_selector/screen/pace_selector_screen.dart'
    as _i2;
import 'package:swim_success_dev/features/users/screen/user_detail_screen.dart'
    as _i3;
import 'package:swim_success_dev/features/users/screen/users_list_screen.dart'
    as _i4;

/// generated route for
/// [_i1.AppShellScreen]
class AppShellRoute extends _i5.PageRouteInfo<void> {
  const AppShellRoute({List<_i5.PageRouteInfo>? children})
    : super(AppShellRoute.name, initialChildren: children);

  static const String name = 'AppShellRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.AppShellScreen();
    },
  );
}

/// generated route for
/// [_i2.PaceSelectorScreen]
class PaceSelectorRoute extends _i5.PageRouteInfo<void> {
  const PaceSelectorRoute({List<_i5.PageRouteInfo>? children})
    : super(PaceSelectorRoute.name, initialChildren: children);

  static const String name = 'PaceSelectorRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.PaceSelectorScreen();
    },
  );
}

/// generated route for
/// [_i3.UserDetailScreen]
class UserDetailRoute extends _i5.PageRouteInfo<UserDetailRouteArgs> {
  UserDetailRoute({
    _i6.Key? key,
    required _i7.User user,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         UserDetailRoute.name,
         args: UserDetailRouteArgs(key: key, user: user),
         initialChildren: children,
       );

  static const String name = 'UserDetailRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UserDetailRouteArgs>();
      return _i3.UserDetailScreen(key: args.key, user: args.user);
    },
  );
}

class UserDetailRouteArgs {
  const UserDetailRouteArgs({this.key, required this.user});

  final _i6.Key? key;

  final _i7.User user;

  @override
  String toString() {
    return 'UserDetailRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i4.UsersListScreen]
class UsersListRoute extends _i5.PageRouteInfo<void> {
  const UsersListRoute({List<_i5.PageRouteInfo>? children})
    : super(UsersListRoute.name, initialChildren: children);

  static const String name = 'UsersListRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.UsersListScreen();
    },
  );
}
