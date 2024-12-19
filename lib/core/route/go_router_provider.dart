
import 'package:cleanarch/core/route/route_name.dart';
import 'package:cleanarch/features/login/presentation/ui/widget/login_screen.dart';
import 'package:cleanarch/features/signup/presentation/ui/widget/signup_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: loginRoute,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        name: signupRoute,
        builder: (context, state) => const SignupScreen(),
      ),
    ],
  );
});
