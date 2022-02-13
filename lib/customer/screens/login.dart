import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  static const routeName = '/customer/login';

  //获取Key用来获取Form表单组件
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  Login({Key? key}) : super(key: key);

  String cellphone = '';

    Future<void> login(BuildContext context) async {
    //读取当前的Form状态
    var loginForm = loginKey.currentState;
    //验证Form表单
    if(loginForm!.validate()){
      loginForm.save();
      // TODO 跳转验证码页面
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xffffffff),
        child: ListView(
          children: [
            Container(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
            child: Column(
              children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: ClipRRect (
                      child: Image.asset(
                        "assets/images/avatar.png",
                        width: 50,
                        height: 50,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: const Text(
                '手机验证登录',
                style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0, left: 20.0),
              child:  const Text(
                '未注册绑定的手机号登录后将自动绑定',
                style: TextStyle(
                  color: Color(0xff999999),
                  fontSize: 12,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: loginKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        decoration: const InputDecoration(
                          labelText: '手机号',
                          labelStyle: TextStyle( fontSize: 15.0, color: Color.fromARGB(255, 197, 197, 197))
                        ),
                        keyboardType: TextInputType.phone,
                        onSaved: (value) {
                          cellphone = value!;
                        },
                        onFieldSubmitted: (value) {
                        }, 
                    ),

                    Container(
                      margin: const EdgeInsets.only(top: 20.0, left: 0.0),
                      child: const Text(
                        "我以阅读并接受《用户隐私政策》和《用户许可协议》",
                        style: TextStyle(
                          color: Color(0xff999999),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    
                    Container(
                      height: 45.0,
                      margin: const EdgeInsets.only(top: 20.0),
                      child: SizedBox.expand(   
                        child: ElevatedButton(
                          onPressed: () => login(context),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 212, 89, 74)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
                          ),
                          child: const Text(
                            '获取验证码',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 255, 255, 255)
                            ),
                          ),
                        ), 
                      ),  
                    ),
                  ]
                )
              )
            )
          ],
        ),
      )
    );
  }
}