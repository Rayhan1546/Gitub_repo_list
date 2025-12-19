abstract class CounterIntent {
  const CounterIntent();
}

class IncrementIntent extends CounterIntent {
  const IncrementIntent();
}

class DecrementIntent extends CounterIntent {
  const DecrementIntent();
}

class ResetIntent extends CounterIntent {
  const ResetIntent();
}

class CustomIncrementIntent extends CounterIntent {
  final int incrementNumber;

  const CustomIncrementIntent({required this.incrementNumber});
}
