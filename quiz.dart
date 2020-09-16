class QnA {
  String question;
  bool answer;
  QnA(this.question, this.answer);
}

class QuizFriend {
  int _qnumb = 0;

  List<QnA> _questionBank = [
    QnA("Phoebe wrote the song 'Smelly cat'", true),
    QnA("Chandeler had a doctorate degree ", false),
    QnA("Joey mugged Ross in the past?", false),
  ];

  void nextquestion() {
    if (_qnumb < _questionBank.length - 1) {
      _qnumb++;
    }
  }

  bool isFinished() {
    if (_qnumb >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  String getQuestion() {
    return _questionBank[_qnumb].question;
  }

  bool getAnswer() {
    return _questionBank[_qnumb].answer;
  }

  void reset() {
    _qnumb = 0;
  }
}
