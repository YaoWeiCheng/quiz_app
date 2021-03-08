/// * quetions_card
/// * quiz_app
///
/// * create by chengyaowei on 1/26/21.

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/models/qustion.dart';
import 'package:quiz_app/screens/quiz/components/option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key key,
    @required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(QuestionController());
    print(questionController.questions.first.answer);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.white),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: kBlackColor),
          ),
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                children: List.generate(
                  question.options.length,
                      (index) => Option(
                    index: index,
                    text: question.options[index],
                    press: () => questionController.checkAns(question, index),
                  ),
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
