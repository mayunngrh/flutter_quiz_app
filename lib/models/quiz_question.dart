class QuizQuestion {
  const QuizQuestion(this.question, this.answer);

  final String question;
  final List<String> answer;

  List<String> getShuffleAnswer() {
    List<String> shuffledAnswer = List.of(answer); // ✅ Create a copy to avoid modifying the original
    shuffledAnswer.shuffle();
    return shuffledAnswer;
  }
}
