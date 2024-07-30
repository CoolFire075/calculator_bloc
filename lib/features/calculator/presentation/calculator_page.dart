import 'dart:io';

import 'package:calculator_bloc/features/calculator/cubit/calculator_cubit.dart';
import 'package:calculator_bloc/features/calculator/cubit/calculator_state.dart';
import 'package:calculator_bloc/features/calculator/cubit/calculator_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CalculatorCubit>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'My calculator',
          style: TextStyle(
            color: CalculatorStyle.numberColor,
            fontSize: 45,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            exit(0);
          },
          icon: const Icon(
            Icons.chevron_left,
            color: CalculatorStyle.numberColor,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const CalculatorConsumerHistory(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CalculatorConsumerText(),
            ],
          ),
          Consumer(
            builder: (BuildContext context, value, Widget? child) {
              return Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(AppStyles.iconColor),
                      ),
                      onPressed: () {
                        cubit.removeAll();
                      },
                      child: const Text(
                        'c',
                        style: TextStyle(
                          color: AppStyles.actionColor,
                          fontSize: AppStyles.numberSize,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: AppStyles.buttonStyle,
                      onPressed: () {
                        cubit.remove();
                      },
                      child: const Icon(
                        size: AppStyles.numberSize + 20,
                        Icons.delete_forever_outlined,
                        color: AppStyles.actionColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(AppStyles.iconColor),
                      ),
                      onPressed: () {
                        notifier.getPercent();
                      },
                      child: const Text(
                        '%',
                        style: TextStyle(
                          color: AppStyles.actionColor,
                          fontSize: AppStyles.numberSize,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        notifier.divide();
                      },
                      style: AppStyles.buttonStyle,
                      child: SvgPicture.asset(
                        height: AppStyles.numberSize + 20,
                        AppStyles.divisionAssetName,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Row(
            children: [
              NumberButton(
                number: '7',
                onPressed: () {
                  notifier.addNumber(7);
                },
              ),
              NumberButton(
                number: '8',
                onPressed: () {
                  notifier.addNumber(8);
                },
              ),
              NumberButton(
                number: '9',
                onPressed: () {
                  notifier.addNumber(9);
                },
              ),
              Expanded(
                child: ElevatedButton(
                  style: AppStyles.buttonStyle,
                  onPressed: () {
                    notifier.multiple();
                  },
                  child: const Icon(
                    size: AppStyles.numberSize + 20,
                    Icons.clear,
                    color: AppStyles.actionColor,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              NumberButton(
                number: '4',
                onPressed: () {
                  notifier.addNumber(4);
                },
              ),
              NumberButton(
                number: '5',
                onPressed: () {
                  notifier.addNumber(5);
                },
              ),
              NumberButton(
                number: '6',
                onPressed: () {
                  notifier.addNumber(6);
                },
              ),
              Expanded(
                child: ElevatedButton(
                  style: AppStyles.buttonStyle,
                  onPressed: () {
                    notifier.reduce();
                  },
                  child: const Icon(
                    size: AppStyles.numberSize + 20,
                    Icons.remove,
                    color: AppStyles.actionColor,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              NumberButton(
                number: '1',
                onPressed: () {
                  notifier.addNumber(1);
                },
              ),
              NumberButton(
                number: '2',
                onPressed: () {
                  notifier.addNumber(2);
                },
              ),
              NumberButton(
                number: '3',
                onPressed: () {
                  notifier.addNumber(3);
                },
              ),
              Expanded(
                child: ElevatedButton(
                  style: AppStyles.buttonStyle,
                  onPressed: () {
                    notifier.increment();
                  },
                  child: const Icon(
                    size: AppStyles.numberSize + 20,
                    Icons.add_outlined,
                    color: AppStyles.actionColor,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(AppStyles.iconColor),
                  ),
                  onPressed: () {},
                  child: const Text(
                    '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: AppStyles.numberSize,
                    ),
                  ),
                ),
              ),
              NumberButton(
                number: '0',
                onPressed: () {
                  notifier.addNumber(0);
                },
              ),
              Expanded(
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(AppStyles.iconColor),
                  ),
                  onPressed: () {
                    notifier.getFractionalNumber();
                  },
                  child: const Text(
                    ',',
                    style: TextStyle(
                      color: AppStyles.numberColor,
                      fontSize: AppStyles.numberSize,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(AppStyles.actionColor),
                  ),
                  onPressed: () {
                    notifier.equal();
                  },
                  child: const Text(
                    '=',
                    style: TextStyle(
                      color: AppStyles.numberColor,
                      fontSize: AppStyles.numberSize,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CalculatorConsumerWidget extends StatelessWidget {
  const CalculatorConsumerWidget({
    super.key,
    required this.notifier,
  });

  final CalculatorState notifier;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            notifier.firstNumber + notifier.action + notifier.secondNumber,
            style: const TextStyle(
              color: CalculatorStyle.numberColor,
              fontSize: CalculatorStyle.numberSize,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}

class NumberButton extends StatelessWidget {
  const NumberButton({
    super.key,
    required this.number,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.white24),
        ),
        onPressed: onPressed,
        child: Text(
          number,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 60.0,
          ),
        ),
      ),
    );
  }
}

class CalculatorConsumerText extends StatelessWidget {
  const CalculatorConsumerText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorNotifier>(
      builder: (BuildContext context, value, Widget? child) {
        return Text(
          value.firstNumber + value.action + value.secondNumber,
          style: const TextStyle(fontSize: 60, color: Colors.white),
        );
      },
    );
  }
}

class CalculatorConsumerHistory extends StatelessWidget {
  const CalculatorConsumerHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorNotifier>(
      builder: (BuildContext context, value, Widget? child) {
        return SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: value.historyList.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Expanded(
                    child: Text(
                      value.historyList[index],
                      style: const TextStyle(
                        color: AppStyles.iconColor,
                        fontSize: AppStyles.numberSize,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
