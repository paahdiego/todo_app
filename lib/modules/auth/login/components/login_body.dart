import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app_routes.dart';
import 'package:todo_app/modules/auth/register/models/register_response.dart';
import 'package:todo_app/modules/core/core.dart';
import 'package:todo_app/modules/auth/login/controllers/login_controller.dart';
import 'package:todo_app/shared/components/app_default_button.dart';
import 'package:todo_app/shared/components/app_input_field.dart';
import 'package:todo_app/shared/components/app_loading_icon.dart';
import 'package:todo_app/shared/components/app_logo.dart';
import 'package:validatorless/validatorless.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);

    return Container(
      height: sizes.safeHeight,
      padding: EdgeInsets.symmetric(horizontal: sizes.displayWidth * 0.15),
      child: Form(
        key: loginController.formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              const AppLogo(),
              const SizedBox(height: 40),
              AppInputField(
                label: "E-mail",
                controller: loginController.emailController,
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: Validatorless.multiple([
                  Validatorless.required("Digite seu e-mail"),
                  Validatorless.email("Digite um e-mail válido"),
                ]),
              ),
              const SizedBox(height: 20),
              AppInputField(
                controller: loginController.passwordController,
                label: "Senha",
                textInputType: TextInputType.visiblePassword,
                obscureText: true,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.visibility_off),
                  onPressed: () {},
                ),
                validator: Validatorless.multiple([
                  Validatorless.required("Digite sua senha"),
                ]),
                onFieldSubmitted: (String value) {
                  loginController.login();
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: AppDefaultButton(
                      onPressed: () {
                        Modular.to.pushNamed(AppRoutes.register).then(
                          (value) {
                            if (value.runtimeType == RegisterResponse) {
                              final response = value as RegisterResponse;
                              if (response.shouldAdjustControllers &&
                                  response.user != null) {
                                loginController.emailController.text =
                                    response.user!.email;
                              }
                            }
                          },
                        );
                      },
                      backgroundColor: AppColors.secondary,
                      child: const Text("inscrever-se"),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: AppDefaultButton(
                      onPressed: () {
                        loginController.login();
                      },
                      child: ValueListenableBuilder<PageState>(
                        valueListenable: loginController.pageStateNotifier,
                        builder: (context, state, _) {
                          switch (state) {
                            case PageState.loading:
                              return const AppLoadingIcon(
                                valueColor: AppColors.white,
                                size: 18,
                              );
                            case PageState.notLoading:
                              return const Text("entrar");
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
