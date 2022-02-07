import 'package:flutter/material.dart';
import 'package:oil/model/model.dart';
import 'package:provider/provider.dart';

import 'nav.dart';
import 'customer/app.dart';
import 'driver/app.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (context) => Model(),
    child: const MyApp()
  )
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var routes = {
      ...Driver.routes,
      ...Customer.routes,
      Nav.routeName: (context) => const Nav(),
    };

    return MaterialApp(
        title: '金海湖石化',
        onGenerateRoute:(RouteSettings settings){
	        return MaterialPageRoute(builder: (context) {
		        String routeName = settings.name ?? Nav.routeName;
            var route = routes[routeName] ?? routes[Nav.routeName];
            return route!(context);
          }
        );
      }
    );
  }
}