import 'calculator_action.dart';

class CalculatorState {
  final String firstNumber;
  final String secondNumber;
  final String action;
  final CalculatorAction? calculatorAction;
  final bool? hasAction;
  final String historyNumber;
  final List<String> historyList;

  CalculatorState(
      {required this.firstNumber,
      required this.secondNumber,
      required this.action,
      required this.calculatorAction,
      required this.hasAction,
      required this.historyNumber,
      required this.historyList});

  CalculatorState copyWith({
    String? firstNumber,
    String? secondNumber,
    String? action,
    CalculatorAction? calculatorAction,
    bool? hasAction,
    String? historyNumber,
    List<String>? historyList,
  }) {
    return CalculatorState(
      firstNumber: firstNumber ?? this.firstNumber,
      secondNumber: secondNumber ?? this.secondNumber,
      action: action ?? this.action,
      calculatorAction: calculatorAction ?? this.calculatorAction,
      hasAction: hasAction ?? this.hasAction,
      historyNumber: historyNumber ?? this.historyNumber,
      historyList: historyList ?? this.historyList,
    );
  }
}
