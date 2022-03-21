import 'package:flutter/material.dart';
import 'package:login_ui_app/shared/format/custom_mask.dart';
import 'package:login_ui_app/shared/theme/app_colors.dart';
import 'package:login_ui_app/shared/widgets/custom_input.dart';
import 'package:login_ui_app/shared/widgets/privacy_policy_widgets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _nome = TextEditingController();
  final _cpf = TextEditingController();
  final _phone = TextEditingController();
  final _birthday = TextEditingController();
  bool seePass = true;
  bool checkPrivacy = false;

  void _onSubmit(BuildContext context) async {
    if (_form.currentState!.validate()) {
      if (!checkPrivacy) {
        //showMessageError();
        return;
      }
      //Signup methods..
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //Privacy policy
            PrivacyPolicyWidget(
              checkedPrivacy: (bool value) {
                setState(() => checkPrivacy = value);
              },
            ),
            const SizedBox(height: 16),
            //Button
            SizedBox(
              width: double.maxFinite,
              height: 80,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                  primary: AppColors.laranjaClaro,
                ),
                onPressed: () => _onSubmit(context),
                child: const Text(
                  "Criar conta",
                  style: TextStyle(
                    fontFamily: 'Metropolis',
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Form(
        key: _form,
        child: SizedBox(
          height: double.maxFinite,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 280,
                    child: Center(
                      child: Text(
                        "Criação de conta",
                        style: TextStyle(
                          fontFamily: 'Metropolis',
                          fontSize: 28,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  //Email
                  CustomInput(
                    hintText: 'E-mail',
                    keyboardType: TextInputType.emailAddress,
                    labelText: 'E-mail',
                    controller: _email,
                    autoCorrect: false,
                    icon: Icons.email_outlined,
                    validator: (String? value) {
                      if (value != null) {
                        if (!value.contains("@")) {
                          return 'Digite um email valido';
                        }
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  //Senha
                  CustomInput(
                    obscureText: true,
                    hintText: 'Senha',
                    labelText: 'Senha',
                    controller: _pass,
                    autoCorrect: false,
                    icon: Icons.lock_outline_rounded,
                    validator: (value) {
                      if (value!.length < 7) {
                        return "A senha deve conter no minimo 7 caracteres";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  //Nome
                  CustomInput(
                    hintText: 'Nome',
                    labelText: 'Nome',
                    autoCorrect: true,
                    controller: _nome,
                    icon: Icons.person_outline_rounded,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Digite um nome valido";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  //CPF
                  CustomInput(
                    keyboardType: TextInputType.number,
                    mask: [maskCpf],
                    hintText: 'xxx.xxx.xxx.xx',
                    labelText: 'CPF',
                    controller: _cpf,
                    autoCorrect: false,
                    icon: Icons.person_outline_rounded,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Difite um cpf válido";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  //Celular
                  CustomInput(
                    keyboardType: TextInputType.phone,
                    mask: [maskPhone],
                    hintText: '(xx)xxxxx-xxxx',
                    labelText: 'Celular',
                    controller: _phone,
                    autoCorrect: false,
                    icon: Icons.phone_android_rounded,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Digite um número valido";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  //birthday
                  CustomInput(
                    keyboardType: TextInputType.number,
                    mask: [maskBirthday],
                    hintText: 'xx/xx/xxxx',
                    labelText: 'Data de nascimento',
                    controller: _birthday,
                    autoCorrect: false,
                    icon: Icons.cake_outlined,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Digite uma data válida";
                      } else {
                        return null;
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
