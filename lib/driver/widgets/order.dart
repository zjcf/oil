import 'package:flutter/material.dart';
import 'package:oil/driver/widgets/order_button.dart';
import 'package:oil/utils/http.dart';
import 'package:oil/model/theme.dart' as theme;

class Order extends StatefulWidget {
  static const routeName = '/driver/home';

  const Order({Key? key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Order> {
  List<Map> orders = [
    {
      "id": 1,
      "order_no": "202201051031518900",
      "fc_customer_id": 1,
      "fc_driver_id": 1,
      "customer_mobile": "18810541532",
      "driver_mobile": "18812341233",
      "destination_latitude": "11.11",
      "destination_longitude": "22.22",
      "destination_address": "成都市海淀区11号",
      "demand_amount": "200.00",
      "driver_income": "180.00",
      "status": 2,
      "created_at": "2022-01-05T10:31:51.000000Z",
      "updated_at": "2022-01-05T12:45:02.000000Z",
      "amount": "1600.00",
    },
  ];

  @override
  void initState () {
    super.initState();

    fetchData();
  }

  Future<void> fetchData () async {
    var data = await Http.get(Api.driverProfile);
  }

  _buildOrderCards () {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (BuildContext context, index) {
        return Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text(
                        "前往去加油",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    
                    RichText(
                      text: const TextSpan(
                        text: "本单预估收入",
                        style: TextStyle(
                          color: theme.Color.gray
                        ),
                        children: [
                          TextSpan(
                            text: "99.99",
                            style: TextStyle(
                              color: theme.Color.red
                            )
                          ),
                          TextSpan(
                            text: "元"
                          )
                        ]
                      )
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              text: "\u2022",
                              style: TextStyle(
                                color: theme.Color.red
                              ),
                              children: [
                                TextSpan(
                                  text: "目的地",
                                  style: TextStyle(
                                    color: theme.Color.gray
                                  ),
                                ),
                              ]
                            ),
                          ),
                          
                          const Text(
                            "北京市海淀区西土城北京邮电大学"
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(width: 1, color: theme.Color.gray)
                      ),
                      child: const Icon(
                        Icons.near_me
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              text: "\u2022",
                              style: TextStyle(
                                color: theme.Color.red
                              ),
                              children: [
                                TextSpan(
                                  text: "联系电话",
                                  style: TextStyle(
                                    color: theme.Color.gray
                                  ),
                                ),
                              ]
                            ),
                          ),
                          const Text(
                            "13312341234"
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(width: 1, color: theme.Color.gray)
                      ),
                      child: const Icon(
                        Icons.call
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              text: "\u2022",
                              style: TextStyle(
                                color: theme.Color.red
                              ),
                              children: [
                                TextSpan(
                                  text: "目的地",
                                  style: TextStyle(
                                    color: theme.Color.gray
                                  ),
                                ),
                              ]
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text("100升 汽油")
                  ],
                ),
              ),
              SizedBox(
                height: 40,
                child: SizedBox.expand(   
                  child: ElevatedButton(
                    onPressed: () => {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(theme.Color.red),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
                    ),
                    child: const Text(
                      '结束订单',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color.fromARGB(255, 255, 255, 255)
                      ),
                    ),
                  ), 
                ),
              ),
            ],
          ),
        );
      }
    );
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
          padding: const EdgeInsets.all(10),
          color: Colors.white,
          child: 
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: const [
                    Text(
                      "20",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "今日订单",
                      style: TextStyle(
                        color: theme.Color.gray
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: const [
                    Text(
                      "999.99",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "预估收入",
                      style: TextStyle(
                        color: theme.Color.gray
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ),

        // order cards
        Expanded(
          flex: 1,
          child: _buildOrderCards(),
        ),
      ],
    );
  }
}
