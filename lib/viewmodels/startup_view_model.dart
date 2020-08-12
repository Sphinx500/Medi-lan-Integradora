import 'package:medi_lan3/constants/route_names.dart';
import 'package:medi_lan3/locator.dart';
import 'package:medi_lan3/services/authentication_service.dart';
import 'package:medi_lan3/services/navigation_service.dart';
import 'package:medi_lan3/ui/views/login_view.dart';
import 'package:medi_lan3/viewmodels/base_model.dart';
import 'package:medi_lan3/main.dart';

class StartUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

    if (hasLoggedInUser) {
      _navigationService.navigateTo(LoginViewRoute);
    } else {
      _navigationService.navigateTo(LoginViewRoute);
    }
  }
}