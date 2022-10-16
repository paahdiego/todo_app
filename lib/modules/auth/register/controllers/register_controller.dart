import 'package:flutter/material.dart';

class RegisterController {
  final pageStateNotifier = ValueNotifier<PageState>(PageState.notLoading);

  set pageState(PageState state) => pageStateNotifier.value = state;
  PageState get pageState => pageStateNotifier.value;

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> register(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      pageState = PageState.loading;

      await Future.delayed(const Duration(seconds: 2));

      // final mockedUser = UserModel(
      //   id: "123",
      //   email: 'user@mocked.com',
      //   name: "Usuário mockado",
      //   avatarUrl:
      //       "https://todosnegrosdomundo.com.br/wp-content/uploads/2020/05/denzel-696x388.jpeg",
      // );

      // await AuthController.authenticate(user: mockedUser);

      // ignore: use_build_context_synchronously
      // Navigator.pushReplacement(context, SplashPage.pageRoute(context));

      pageState = PageState.notLoading;
    }
  }
}

enum PageState {
  loading,
  notLoading,
}
