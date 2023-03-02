abstract class IStack {
  void pop(num number);

  void push(num number);

  void clear();

  List<num> peek();
}

class NumberStack extends IStack {
  List<num> numbers = [];

  @override
  peek() {
    return numbers;
  }

  @override
  pop(num number) {
    numbers.remove(number);
  }

  @override
  push(num number) {
    numbers.add(number);
  }

  @override
  void clear() {
    numbers.clear();
  }
}
