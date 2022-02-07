import 'package:flutter/material.dart';
import 'package:oil/driver/screens/income.dart';
import 'package:oil/driver/widgets/order_button.dart';
import 'package:oil/utils/http.dart';
import 'package:oil/model/theme.dart' as theme;

class Profile extends StatefulWidget {
  static const routeName = '/driver/profile';

  const Profile({Key? key}) : super(key: key);

  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  double balance = 1000.00;

  @override
  void initState () {
    super.initState();

    fetchData();
  }

  Future<void> fetchData () async {
    var data = await Http.get(Api.driverProfile);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: Row(
            children: const <Widget>[
              Expanded(
                child: Text("金海湖石化·司机端"),
                flex: 1,
              ),
              OrderButton()
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: 
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "¥" + balance.toStringAsFixed(2),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const Text(
                      "钱包余额",
                      style: TextStyle(
                        color: theme.Color.gray
                      ),
                    )
                  ],
                ),
                flex: 1,
              ),
              Listener(
                child: Row(
                  children: const <Widget>[
                    Text(
                      "收支明细",
                      style: TextStyle(
                        color: theme.Color.gray
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: theme.Color.gray,
                    )
                  ],
                ),
                onPointerDown: (evnet) => Navigator.pushNamed(context, Income.routeName),
              )
            ],
          )
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 10),
          color: Colors.white,
          child: const Center(
            child: Text(
              "退出登录",
              style: TextStyle(
                color: theme.Color.red
              ),
              ),
          )
        )
      ],
    );
  }
}
