import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/modules/auth/register/controllers/register_controller.dart';
import 'package:todo_app/modules/auth/register/models/register_response.dart';
import 'package:todo_app/modules/core/core.dart';
import 'package:todo_app/shared/components/app_default_button.dart';
import 'package:todo_app/shared/components/app_input_field.dart';
import 'package:todo_app/shared/components/app_loading_icon.dart';
import 'package:todo_app/shared/components/app_logo.dart';
import 'package:validatorless/validatorless.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  final registerController = RegisterController();

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);

    return Container(
      height: sizes.safeHeight,
      padding: EdgeInsets.symmetric(horizontal: sizes.displayWidth * 0.15),
      child: Form(
        key: registerController.formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              const AppLogo(),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Registar-se",
                  style: AppTextStyles.bodyText1(context)?.copyWith(
                    fontSize: 24,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              AppInputField(
                label: "Nome",
                controller: registerController.nameController,
                textInputAction: TextInputAction.next,
                validator: Validatorless.multiple([
                  Validatorless.required("Digite um nome válido"),
                ]),
              ),
              const SizedBox(height: 20),
              AppInputField(
                label: "E-mail",
                controller: registerController.emailController,
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: Validatorless.multiple([
                  Validatorless.required("Digite seu e-mail"),
                  Validatorless.email("Digite um e-mail válido"),
                ]),
              ),
              const SizedBox(height: 20),
              AppInputField(
                controller: registerController.passwordController,
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
                  registerController.register();
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Modular.to.pop(
                          RegisterResponse(
                            shouldAdjustControllers: false,
                          ),
                        );
                      },
                      child: const Text("voltar"),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: AppDefaultButton(
                      onPressed: () {
                        registerController.register();
                      },
                      child: ValueListenableBuilder<PageState>(
                        valueListenable: registerController.pageStateNotifier,
                        builder: (context, state, _) {
                          switch (state) {
                            case PageState.loading:
                              return const AppLoadingIcon(
                                valueColor: AppColors.white,
                                size: 18,
                              );
                            case PageState.notLoading:
                              return const Text("Salvar");
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
