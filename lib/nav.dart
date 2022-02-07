import 'package:flutter/material.dart';

import 'driver/screens/login.dart' as driver;
import 'customer/screens/login.dart' as customer;

class Nav extends StatelessWidget {
  static const routeName = '/nav';

  const Nav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, driver.Login.routeName),
              child: const Text(
                '我是司机',
                style: TextStyle(
                  fontSize: 20,
                )
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(100, 20, 100, 20))
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, customer.Login.routeName),
              child: const Text(
                '我是客户',
                style: TextStyle(
                  fontSize: 20,
                )
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(100, 20, 100, 20)),
                backgroundColor: MaterialStateProperty.all(Colors.green[800])
              ),
            ),
          ],
        )
      ),
    );
  }
}