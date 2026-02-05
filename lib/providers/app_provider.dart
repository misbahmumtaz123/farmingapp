import 'package:farmingapp/Views/auth/Login/login_provider.dart';
import 'package:farmingapp/Views/auth/Signup/signup_provider.dart';
import 'package:farmingapp/Views/onboarding/onboarding_provider.dart';
import 'package:farmingapp/Views/splash/splash_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../Controllers/product_provider.dart';

class AllProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => SplashProvider()),
    ChangeNotifierProvider(create: (_) => OnboardingProvider()),
    ChangeNotifierProvider(create: (_) => LoginProvider()),
    ChangeNotifierProvider(create: (_) => SignupProvider()),
    ChangeNotifierProvider(create: (_) => ProductProvider()),
  ];
}
