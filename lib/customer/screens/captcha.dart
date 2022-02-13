import 'package:flutter/material.dart';
import 'package:oil/customer/widgets/code_input.dart';

class Captcha extends StatelessWidget {
  static const routeName = '/customer/captcha';

  Captcha({Key? key}) : super(key: key);

  String cellphone = '181 2615 0288';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("验证码"),
      ),
      body: Container(
        color: const Color(0xffffffff),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40.0, left: 32.0),
              child: const Text(
                '请输入验证码',
                style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0, left: 32.0),
              child:  Text(
                '短信验证码已发送至' + cellphone,
                style: const TextStyle(
                  color: Color(0xff999999),
                  fontSize: 12,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 32.0, top: 24.0, right: 32.0),
              child: CodeInputTextField(
                codeLength: 6,
                autoFocus: true,
                textInputAction: TextInputAction.go,
                onSubmit: (code) {
                  print('submit code:$code');
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}