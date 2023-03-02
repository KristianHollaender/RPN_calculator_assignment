abstract class Command {
  num execute();
}

class Addition extends Command {
  num number1;
  num number2;

  Addition(this.number1, this.number2);

  @override
  num execute() {
    return number1 + number2;
  }
}

class Subtraction extends Command {
  num number1;
  num number2;

  Subtraction(this.number1, this.number2);

  @override
  num execute() {
    return number1 - number2;
  }
}

class Division extends Command {
  num number1;
  num number2;

  Division(this.number1, this.number2);

  @override
  num execute() {
    return number1 / number2;
  }
}

class Multiply extends Command {
  num number1;
  num number2;

  Multiply(this.number1, this.number2);

  @override
  num execute() {
    return number1 * number2;
  }
}
