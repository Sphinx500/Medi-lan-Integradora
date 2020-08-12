import 'package:medi_lan3/constants/route_names.dart';
import 'package:medi_lan3/locator.dart';
import 'package:medi_lan3/services/authentication_service.dart';
import 'package:medi_lan3/services/dialog_service.dart';
import 'package:medi_lan3/services/navigation_service.dart';
import 'package:flutter/foundation.dart';

import 'base_model.dart';

class SignUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  //TODO: cambiar a ingles
  dynamic _selectedRole = 'Seleccione el Rol';
  dynamic get selectedRole => _selectedRole;

  void setSelectedRole(dynamic role) {
    _selectedRole = role;
    notifyListeners();
  }

  Future signUp({
    @required String email,
    @required String password,
    @required String fullName,
    @required String lastName,
    @required String lastName2,
  }) async {
    setBusy(true);

    var result = await _authenticationService.signUpWithEmail(
      email: email,
      password: password,
      fullName: fullName,
      lastName: lastName,
      lastName2: lastName2,
      role: _selectedRole
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(HomeViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: 'General sign up failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Sign Up Failure',
        description: result,
      );
    }
  }
}