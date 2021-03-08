import 'package:flutter/cupertino.dart';
/// * welcome_screen
/// * quiz_app
///
/// * create by chengyaowei on 1/26/21.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:quiz_app/constants.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg",
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                children: [
                  Spacer(
                    flex: 2,
                  ), // 2/6
                  Text(
                    "让我们来测验吧",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text("在下面输入您的信息"),
                  Spacer(), // 1/6
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF1C2341),
                        hintText: "请输入全名",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        )),
                  ),
                  Spacer(), // 1/6
                  InkWell(
                    onTap: () {
                      if (_controller.text.length != 0) {
                          Get.to(QuizScreen());
                      } else {
                        showCupertinoDialog(context: context, builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text('提示'),
                            content: Text('请先输入名称'),
                            actions: [
                              CupertinoActionSheetAction(onPressed: () {
                                Navigator.of(context).pop("ok");
                              }, child: Text("好的")),
                            ],
                          );
                        });
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75),
                      // 15
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "开始",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ), // 2/6
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
