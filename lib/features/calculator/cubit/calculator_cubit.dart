import 'package:calculator_bloc/features/calculator/cubit/calculator_action.dart';
import 'package:calculator_bloc/features/calculator/cubit/calculator_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit()
      : super(
          CalculatorState(
            firstNumber: '0',
            secondNumber: '',
            action: '',
            calculatorAction: null,
            hasAction: false,
            historyNumber: '',
            historyList: [],
          ),
        );

  void increment() {
    if (state.hasAction == true) {
      makeAction();
    }
    emit(
      state.copyWith(
        calculatorAction: CalculatorAction.increment,
        action: '-',
        hasAction: true,
      ),
    );
  }

  void reduce() {
    if (state.hasAction == true) {
      makeAction();
    }
    emit(
      state.copyWith(
        calculatorAction: CalculatorAction.reduce,
        action: '-',
        hasAction: true,
      ),
    );
  }

  void multiple() {
    if (state.hasAction == true) {
      makeAction();
    }
    emit(
      state.copyWith(
        calculatorAction: CalculatorAction.multiple,
        action: '*',
        hasAction: true,
      ),
    );
  }

  void divide() {
    if (state.hasAction == true) {
      makeAction();
    }
    emit(
      state.copyWith(
          calculatorAction: CalculatorAction.divide,
          action: ':',
          hasAction: true),
    );
  }

  void makeAction() {
    if (state.secondNumber != '') {
      double firstNum = double.tryParse(state.firstNumber) ?? 0;
      double secondNum = double.tryParse(state.secondNumber) ?? 0;
      double result = switch (state.calculatorAction) {
        CalculatorAction.increment => firstNum + secondNum,
        CalculatorAction.reduce => firstNum - secondNum,
        CalculatorAction.multiple => firstNum * secondNum,
        CalculatorAction.divide => firstNum / secondNum,
        null => firstNum,
      };
      String firstStr = result.toStringAsFixed(2);
      if (result % 1 == 0.0 && result != 0.0) {
        firstStr = result.toStringAsFixed(0);
      }
      emit(
        state.copyWith(
          firstNumber: firstStr,
          secondNumber: '',
          action: '',
          calculatorAction: null,
          hasAction: true,
          historyNumber: state.firstNumber + state.action + state.secondNumber,
          historyList: state.historyList +
              [state.firstNumber + state.action + state.secondNumber],
        ),
      );
    }
  }

  void getPercent() {
    double number;
    if (state.secondNumber == '' || state.secondNumber == '0') {
      number = double.tryParse(state.firstNumber) ?? 0;
      number = number / 100;
      emit(
        state.copyWith(
          firstNumber: number.toStringAsFixed(2),
        ),
      );
      if (number % 1 == 0.0) {
        emit(
          state.copyWith(
            firstNumber: number.toStringAsFixed(0),
          ),
        );
      } else if (number % 0.1 == 0.0) {
        emit(
          state.copyWith(
            firstNumber: number.toStringAsFixed(1),
          ),
        );
      }
    } else {
      number = double.tryParse(state.secondNumber) ?? 0;
      number = number / 100;
      emit(
        state.copyWith(
          secondNumber: number.toStringAsFixed(2),
        ),
      );
      if (number % 1 == 0.0) {
        emit(
          state.copyWith(
            secondNumber: number.toStringAsFixed(0),
          ),
        );
      } else if (number % 0.1 == 0.0) {
        emit(
          state.copyWith(
            secondNumber: number.toStringAsFixed(1),
          ),
        );
      }
    }
  }

  void removeAll() {
    emit(
      state.copyWith(
        firstNumber: '0',
        secondNumber: '',
        action: '',
        hasAction: false,
        historyList: [],
      ),
    );
  }

  void remove() {
    if (state.secondNumber.isNotEmpty) {
      emit(
        state.copyWith(
          secondNumber:
              state.secondNumber.substring(0, state.secondNumber.length - 1),
        ),
      );
      if (state.firstNumber == '') {
        emit(
          state.copyWith(firstNumber: '0'),
        );
      } else if (state.action.isNotEmpty) {
        emit(
          state.copyWith(action: '', hasAction: false),
        );
      } else if (state.firstNumber.isNotEmpty) {
        emit(
          state.copyWith(
            firstNumber:
                state.firstNumber.substring(0, state.firstNumber.length - 1),
          ),
        );
        if (state.firstNumber == '') {
          emit(
            state.copyWith(
              firstNumber: '0',
            ),
          );
        }
      }
    }
  }

  void getFractionalNumber() {
    if (state.hasAction == false) {
      if (state.firstNumber.isNotEmpty) {
        if (state.firstNumber.contains('.') == false) {
          emit(
            state.copyWith(
              firstNumber: '${state.firstNumber}.',
            ),
          );
        }
      }
    } else {
      if (state.secondNumber.isNotEmpty) {
        if (state.secondNumber.contains('.') == false) {
          emit(
            state.copyWith(
              secondNumber: '${state.secondNumber}.',
            ),
          );
        }
      }
    }
  }

  void equal() {
    if (state.firstNumber.lastIndexOf('.') == state.firstNumber.length) {
      emit(
        state.copyWith(
          firstNumber:
              state.firstNumber.substring(0, state.firstNumber.length - 1),
        ),
      );
    }
    if (state.secondNumber.lastIndexOf('.') == state.secondNumber.length) {
      emit(
        state.copyWith(
          secondNumber:
              state.secondNumber.substring(0, state.secondNumber.length - 1),
        ),
      );
    }
    makeAction();
    emit(
      state.copyWith(
        hasAction: false,
        action: '',
      ),
    );
  }

  void addNumber(int number) {
    if (state.hasAction == false) {
      addFirstNumber(number);
    } else {
      addSecondNumber(number);
    }
  }

  void addFirstNumber(int number) {
    if (state.firstNumber != '0') {
      emit(
        state.copyWith(
          firstNumber: state.firstNumber + number.toString(),
        ),
      );
    } else if (state.firstNumber == '0') {
      emit(
        state.copyWith(
          firstNumber: number.toString(),
        ),
      );
    }
  }

  void addSecondNumber(int number) {
    if (state.secondNumber != '0') {
      emit(
        state.copyWith(
          secondNumber: state.secondNumber + number.toString(),
        ),
      );
    } else if (state.secondNumber == '0') {
      emit(
        state.copyWith(
          secondNumber: number.toString(),
        ),
      );
    }
  }
}
