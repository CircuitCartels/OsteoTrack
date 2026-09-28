class Symptoms {
  final List<int> answers; // 5 values, each 0..3
  const Symptoms(this.answers);
  int get total => answers.fold(0, (a, b) => a + b); // 0..15
}
