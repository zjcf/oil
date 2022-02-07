import 'package:oil/driver/screens/income.dart';

import 'screens/login.dart';
import 'screens/home.dart';

class Driver {
  static final routes = {
    Login.routeName: (context) => const Login(),
    Home.routeName: (context) => const Home(),
    Income.routeName: (context) => const Income()
  };
}