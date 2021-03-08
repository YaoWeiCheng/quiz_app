/// * quiz_screen
/// * quiz_app
///
/// * create by chengyaowei on 1/26/21.

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/screens/quiz/components/body.dart';


class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FlatButton(
            onPressed: _questionController.nextQuestion,
            child: Text(
              "跳过",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Body(),
    );
  }
}


