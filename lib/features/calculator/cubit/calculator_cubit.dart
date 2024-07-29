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
}