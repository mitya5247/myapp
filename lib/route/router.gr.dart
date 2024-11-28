// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:myapp/screen/create_post.dart' as _i1;
import 'package:myapp/screen/main_screen.dart' as _i2;
import 'package:myapp/screen/physics_action.dart' as _i3;
import 'package:myapp/screen/post.dart' as _i4;

/// generated route for
/// [_i1.CreatePost]
class CreatePost extends _i5.PageRouteInfo<void> {
  const CreatePost({List<_i5.PageRouteInfo>? children})
      : super(
          CreatePost.name,
          initialChildren: children,
        );

  static const String name = 'CreatePost';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.CreatePost();
    },
  );
}

/// generated route for
/// [_i2.MyHomePage]
class MyHomeRoute extends _i5.PageRouteInfo<void> {
  const MyHomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          MyHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyHomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.MyHomePage();
    },
  );
}

/// generated route for
/// [_i3.PhysicsAction]
class PhysicsAction extends _i5.PageRouteInfo<void> {
  const PhysicsAction({List<_i5.PageRouteInfo>? children})
      : super(
          PhysicsAction.name,
          initialChildren: children,
        );

  static const String name = 'PhysicsAction';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.PhysicsAction();
    },
  );
}

/// generated route for
/// [_i4.Post]
class Post extends _i5.PageRouteInfo<PostArgs> {
  Post({
    required String title,
    required String subtitle,
    _i6.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          Post.name,
          args: PostArgs(
            title: title,
            subtitle: subtitle,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'Post';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PostArgs>();
      return _i4.Post(
        args.title,
        args.subtitle,
        key: args.key,
      );
    },
  );
}

class PostArgs {
  const PostArgs({
    required this.title,
    required this.subtitle,
    this.key,
  });

  final String title;

  final String subtitle;

  final _i6.Key? key;

  @override
  String toString() {
    return 'PostArgs{title: $title, subtitle: $subtitle, key: $key}';
  }
}
