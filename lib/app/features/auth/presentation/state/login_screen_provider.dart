import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ILoginScreenProvider {
  void googleLogin();
}

final loginScreenProvider = Provider<ILoginScreenProvider>((ref) => LoginScreenProvider());

class LoginScreenProvider implements ILoginScreenProvider {
  @override
  void googleLogin() {
    // TODO: implement googleLogin
  }
}
