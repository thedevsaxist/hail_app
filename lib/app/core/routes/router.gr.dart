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
import 'package:flutter_intl_phone_field/countries.dart' as _i7;
import 'package:hail/app/core/shared/phone_number_input_field.dart' as _i1;
import 'package:hail/app/features/auth/presentation/screens/login_screen.dart'
    as _i3;
import 'package:hail/app/features/auth/presentation/screens/sign_up_screen.dart'
    as _i4;
import 'package:hail/app/features/get_started/presentation/get_started_screen.dart'
    as _i2;

/// generated route for
/// [_i1.CountrySelectionPage]
class CountrySelectionRoute
    extends _i5.PageRouteInfo<CountrySelectionRouteArgs> {
  CountrySelectionRoute({
    _i6.Key? key,
    required _i7.Country selectedCountry,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         CountrySelectionRoute.name,
         args: CountrySelectionRouteArgs(
           key: key,
           selectedCountry: selectedCountry,
         ),
         initialChildren: children,
       );

  static const String name = 'CountrySelectionRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CountrySelectionRouteArgs>();
      return _i1.CountrySelectionPage(
        key: args.key,
        selectedCountry: args.selectedCountry,
      );
    },
  );
}

class CountrySelectionRouteArgs {
  const CountrySelectionRouteArgs({this.key, required this.selectedCountry});

  final _i6.Key? key;

  final _i7.Country selectedCountry;

  @override
  String toString() {
    return 'CountrySelectionRouteArgs{key: $key, selectedCountry: $selectedCountry}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CountrySelectionRouteArgs) return false;
    return key == other.key && selectedCountry == other.selectedCountry;
  }

  @override
  int get hashCode => key.hashCode ^ selectedCountry.hashCode;
}

/// generated route for
/// [_i2.GetStartedScreen]
class GetStartedRoute extends _i5.PageRouteInfo<void> {
  const GetStartedRoute({List<_i5.PageRouteInfo>? children})
    : super(GetStartedRoute.name, initialChildren: children);

  static const String name = 'GetStartedRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.GetStartedScreen();
    },
  );
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i5.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    void Function()? onPressed,
    _i6.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         LoginRoute.name,
         args: LoginRouteArgs(onPressed: onPressed, key: key),
         initialChildren: children,
       );

  static const String name = 'LoginRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return _i3.LoginScreen(onPressed: args.onPressed, key: args.key);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.onPressed, this.key});

  final void Function()? onPressed;

  final _i6.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{onPressed: $onPressed, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LoginRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i4.SignUpScreen]
class SignUpRoute extends _i5.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    void Function()? onPressed,
    _i6.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         SignUpRoute.name,
         args: SignUpRouteArgs(onPressed: onPressed, key: key),
         initialChildren: children,
       );

  static const String name = 'SignUpRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignUpRouteArgs>(
        orElse: () => const SignUpRouteArgs(),
      );
      return _i4.SignUpScreen(onPressed: args.onPressed, key: args.key);
    },
  );
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.onPressed, this.key});

  final void Function()? onPressed;

  final _i6.Key? key;

  @override
  String toString() {
    return 'SignUpRouteArgs{onPressed: $onPressed, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SignUpRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}
