import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  final void Function()? onPressed;
  const LoginScreen({this.onPressed, super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login up page".toUpperCase()),
            ElevatedButton(
              onPressed: () => context.router.replacePath('/signup'),
              child: Text("To Sign Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
