class Task {
  final String name;

  bool isDone;
  bool slide;
  Task({
    this.name = '',
    this.isDone = false,
    this.slide = false,
  });

  void toggleDone() {
    slide = !slide;
    isDone = !isDone;
  
  }
  
}
  