class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;
  List<String> getShuffledAnswers() {
    // chaining -- this is a getter
    // This getter returns a shuffled version of the answers list
    // It creates a copy of the answers list, shuffles it, and returns the shuffled list
    // This way, the original answers list is not modified
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
