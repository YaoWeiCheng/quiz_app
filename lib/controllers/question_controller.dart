import 'dart:ffi';

/// * question_controller
/// * quiz_app
///
/// * create by chengyaowei on 1/26/21.

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/qustion.dart';
import 'package:quiz_app/screens/score/score_screen.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController _animationController;
  Animation _animation;

  Animation get animation => this._animation;

  List<Question> _questions = sample_data
      .map((question) => Question(
          id: question['id'],
          question: question['question'],
          answer: question['answer_index'],
          options: question['options']))
      .toList();

  List<Question> get questions => this._questions;

  PageController _pageController;
  PageController get pageController => _pageController;

  /// 是否答案
  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  /// 修正的答案
  int _correctAns;
  int get correctAns => this._correctAns;

  /// 选中的索引
  int _selectedAns;
  int get selectedAns => this._selectedAns;

  /// 当前问题页数，返回一个以[this]`int`为初始值的`RxInt`。
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  /// 测验正确的页数
  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  @override
  void onInit() {
    // TODO: implement onInit

    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });

    _animationController.forward().whenComplete(() => nextQuestion());

    _pageController = PageController();

    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {

    _isAnswered = true;
    print(question.answer);
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    /// 答对后将将数据++
    if (_correctAns == _selectedAns) _numOfCorrectAns++;
    
    
    _animationController.stop();
    update();

    Future.delayed(Duration(seconds: 1), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    // 当前页数< 总问题数时 继续下一页
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);
      // 重置动画
      _animationController.reset();

      _animationController.forward().whenComplete(() => nextQuestion());
    } else {
      Get.to(ScoreScreen());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
