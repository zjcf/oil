import 'package:flutter/material.dart';
import 'package:oil/driver/widgets/month_piacker.dart';
import 'package:oil/driver/widgets/order_button.dart';
import 'package:oil/model/theme.dart' as theme;

import 'home.dart';

class Income extends StatefulWidget
{
  static const routeName = '/driver/income';

  const Income({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Income();
}

class _Income extends State<Income>{
  String currentDate = "2021-12";
  double income = 1000.00;
  double outlay = 500.00;

  _changeDate (value) {
    setState(() {
      currentDate = value;
    });
  }

  List<Map> list = [
    {
      "type": "order",
      "amount": 1000,
      "time": "2022年1月1日 12:00"
    },
    {
      "type": "cash",
      "amount": 800,
      "time": "2022年1月2日 12:00"
    },
  ];

  String _buildDate () {
    List<String> date = currentDate.split('-');
    return date[0] + "年" + date[1] + "月";
  }

  Widget _buildList () {
    return ListView.builder(
      itemCount: list.length * 2,
      itemBuilder: (context, i) {
        int isOdd = i % 2;
        i = i ~/ 2;

        if (isOdd == 0 ) {
          Map item = list[i];
          return ListTile(
            leading: Container(
              padding: const EdgeInsets.all(10),
              child: Icon(item['type'] == 'order' ? Icons.shopping_cart_outlined : Icons.attach_money),
            ),
            title: Text(item['type'] == 'order' ? '完成订单' : '提取现金'),
            subtitle: Text(item['time']),
            trailing: Text((item['amount'] as double).toStringAsFixed(2)),
            tileColor: Colors.white,
          );
        } else {
          return const Divider(
            height: 1,
          );
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Listener(
                    onPointerDown: (e) => Navigator.pop(context),
                    child: Row(
                      children: const <Widget>[
                        Icon(Icons.keyboard_arrow_left_outlined),
                        Text("收支明细")
                      ]
                    ),
                  ),
                  flex: 1,
                ),
                const OrderButton()
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Theme(
              data: ThemeData(
                textTheme: const TextTheme(
                  bodyText2: TextStyle(
                    color: theme.Color.gray
                  )
                )
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Listener(
                      child: Row(
                        children: [
                          Text(
                            _buildDate(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          const Icon(Icons.keyboard_arrow_down_rounded)
                        ]
                      ),
                      onPointerDown: (e) {
                        showModalBottomSheet<void>(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          builder: (BuildContext context) {
                            DateTime now = DateTime.now();
                            return DatePicker(
                              endYear: now.year,
                              selectedDate: now.year.toString() + '-' + now.month.toString().padLeft(2, '0'),
                              onSelectedDate: (String date) {
                                Navigator.pop(context);
                                _changeDate(date);
                              },
                            );
                          });
                      }
                    ),
                      
                    flex: 1,
                  ),
                  Text(
                    "收入：" + income.toStringAsFixed(2) + " 支出：" + outlay.toStringAsFixed(2)
                  )
                ],
              )

            )
          ),
          Expanded(
            flex: 1,
            child: _buildList(),
          )
          // _buildList()
        ],
      )
    );
  }
}