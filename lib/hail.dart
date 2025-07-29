import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hail/app/core/routes/router.dart';
import 'package:hail/app/core/theme/theme.dart';

class Hail extends ConsumerStatefulWidget {
  const Hail({super.key});

  @override
  ConsumerState<Hail> createState() => _HailState();
}

class _HailState extends ConsumerState<Hail> {
  @override
  Widget build(BuildContext context) {
    final router = ref.read(routerProvider);

    
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
      routeInformationProvider: router.routeInfoProvider(),
      title: 'Hail',
      theme: AppTheme.standard,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
    );
  }
}
