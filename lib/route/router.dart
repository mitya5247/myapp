import 'package:auto_route/auto_route.dart';
import 'package:myapp/route/router.gr.dart';


@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter   {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MyHomeRoute.page, path: "/", initial: true),
    AutoRoute(page: PhysicsAction.page, path: "/physic"),
    AutoRoute(page: Post.page),
    AutoRoute(page: CreatePost.page, path: '/new-post'),
  ];

}