import 'screens/order.dart';
import 'screens/home.dart';
import 'screens/login.dart';
import 'screens/profile.dart';
import 'screens/captcha.dart';
import 'screens/wallet.dart';

class Customer {
  static final routes = {
    Login.routeName: (context) =>  Login(),
    Home.routeName: (context) => const Home(),
    Profile.routeName: (context) => const Profile(),
    Order.routeName: (context) => const Order(),
    Wallet.routeName: (context) => const Wallet(),
    Captcha.routeName: (context) =>  Captcha(),
  };
}