import 'package:flutter/material.dart';
import 'package:oil/driver/screens/home.dart';
import 'package:oil/model/session.dart';
import 'package:oil/utils/http.dart';

class Login extends StatefulWidget {
  static const routeName = '/driver/login';

  const Login({Key? key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  //获取Key用来获取Form表单组件
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  late String username;
  late String password;
  String _errorText = '';
  bool isShowPassWord = false;

  Future<void> login(BuildContext context) async {
    //读取当前的Form状态
    var loginForm = loginKey.currentState;
    //验证Form表单
    if(loginForm!.validate()){
      loginForm.save();
      var response = await Http.post(Api.driverLogin, data: {'username': username, 'password': password});
      var errorText = response['success'] ? '' : response['message'];
      setState(() {
        _errorText = errorText;
      });
      if (response['success']) {
        Session.setToken(response['data']['token']);
        Navigator.pushNamed(context, Home.routeName);
      }
    }
  }

  void showPassWord() {
    setState(() {
      isShowPassWord = !isShowPassWord;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 50.0, bottom: 10.0),
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(10),
                  child: ClipRRect (
                    child: Image.asset(
                      "assets/images/avatar.png",
                      width: 100,
                      height: 100,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                
                const Text(
                  '司机端登录',
                  style: TextStyle(
                    color: Color.fromARGB(255, 53, 53, 53),
                    fontSize: 20.0
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: loginKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                      decoration: const InputDecoration(
                        labelText: '登录账号',
                        labelStyle: TextStyle( fontSize: 15.0, color: Color.fromARGB(255, 197, 197, 197))
                      ),
                      keyboardType: TextInputType.phone,
                      onSaved: (value) {
                        username = value!;
                      },
                      onFieldSubmitted: (value) {
                      }, 
                  ),
                  
                    TextFormField(
                      decoration:  InputDecoration(
                        labelText: '登录密码',
                        labelStyle: const TextStyle( fontSize: 15.0, color: Color.fromARGB(255, 197, 197, 197)),
                        errorText: _errorText.isEmpty ? null : _errorText,
                        suffixIcon: IconButton(
                          icon: Icon(
                            isShowPassWord ? Icons.visibility : Icons.visibility_off,
                            color: const Color.fromARGB(255, 197, 197, 197), 
                          ),
                          onPressed: showPassWord,
                        )
                      ),
                      obscureText: !isShowPassWord,
                      onSaved: (value) {
                        password = value!;
                      },
                  ), 
                  Container(
                    height: 45.0,
                    margin: const EdgeInsets.only(top: 40.0),
                    child: SizedBox.expand(   
                      child: ElevatedButton(
                        onPressed: () => login(context),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 212, 89, 74)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
                        ),
                        child: const Text(
                          '立即登录',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color.fromARGB(255, 255, 255, 255)
                          ),
                        ),
                      ), 
                    ),  
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30.0),
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          '登录有问题？',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Color.fromARGB(255, 212, 89, 74)
                          ),
                        ),
                      ],
                    ) ,
                  ),
                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
