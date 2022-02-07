import 'package:flutter/material.dart';
import 'package:oil/model/model.dart';
import 'package:oil/model/theme.dart' as theme;
import 'package:provider/provider.dart';


class OrderButton extends StatefulWidget {
  const OrderButton({Key? key}) : super(key: key);

  @override
  _OrderButton createState() => _OrderButton();
}

class _OrderButton extends State<OrderButton>{
  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, model, child) => SizedBox(
        width: 100,
        height: 30,
        child: ElevatedButton(
          onPressed: () {
            model.toggleActive();
          },
          child: Text(model.isActive ? "停止接单" : "开始接单"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(model.isActive ? theme.Color.red : theme.Color.green),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
          ),
        ),
      )
    );
  }
}