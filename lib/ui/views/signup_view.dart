import 'package:medi_lan3/ui/shared/ui_helpers.dart';
import 'package:medi_lan3/ui/widgets/busy_button.dart';
import 'package:medi_lan3/ui/widgets/expansion_list.dart';
import 'package:medi_lan3/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:medi_lan3/viewmodels/signup_view_model.dart';

class SignUpView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final lastName2Controller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 38,
                ),
              ),
              verticalSpaceLarge,
              InputField(
                placeholder: 'Nombre',
                controller: fullNameController,
              ),
              InputField(
                placeholder: 'Primer Apellido',
                controller: lastNameController,
              ),
              InputField(
                placeholder: 'Segundo Apellido',
                controller: lastName2Controller,
              ),
              InputField(
                placeholder: 'Email',
                controller: emailController,
              ),
              verticalSpaceSmall,
              InputField(
                placeholder: 'Password',
                password: true,
                controller: passwordController,
                additionalNote: 'Password has to be a minimum of 6 characters.',
              ),
              verticalSpaceSmall,
              ExpansionList<String>(
                  items: ['Doctor', 'Paciente'],
                  title: model.selectedRole,
                  onItemSelected: model.setSelectedRole
                ),
              verticalSpaceMedium,
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BusyButton(
                    title: 'Sign Up',
                    busy: model.busy,
                    onPressed: () {
                      model.signUp(
                        email: emailController.text,
                        password: passwordController.text,
                        fullName: fullNameController.text,
                        lastName: lastNameController.text,
                        lastName2: lastName2Controller.text,

                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),
        ),
      ),
    );
  }
}