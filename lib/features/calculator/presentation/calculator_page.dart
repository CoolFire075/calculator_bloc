import 'dart:io';
import 'package:calculator_bloc/features/calculator/cubit/calculator_cubit.dart';
import 'package:calculator_bloc/features/calculator/cubit/calculator_state.dart';
import 'package:calculator_bloc/features/calculator/cubit/calculator_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CalculatorCubit>();
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
          const CalculatorHistory(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CalculatorConsumerText(),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(CalculatorStyle.iconColor),
                  ),
                  onPressed: () {
                    cubit.removeAll();
                  },
                  child: const Text(
                    'c',
                    style: TextStyle(
                      color: CalculatorStyle.actionColor,
                      fontSize: CalculatorStyle.numberSize,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: CalculatorStyle.buttonStyle,
                  onPressed: () {
                    cubit.remove();
                  },
                  child: const Icon(
                    size: CalculatorStyle.numberSize + 20,
                    Icons.delete_forever_outlined,
                    color: CalculatorStyle.actionColor,
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(CalculatorStyle.iconColor),
                  ),
                  onPressed: () {
                    cubit.getPercent();
                  },
                  child: const Text(
                    '%',
                    style: TextStyle(
                      color: CalculatorStyle.actionColor,
                      fontSize: CalculatorStyle.numberSize,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    cubit.divide();
                  },
                  style: CalculatorStyle.buttonStyle,
                  child: SvgPicture.asset(
                    height: CalculatorStyle.numberSize + 20,
                    CalculatorStyle.divisionAssetName,
                    color: Colors.orange,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              NumberButton(
                number: '7',
                onPressed: () {
                  cubit.addNumber(7);
                },
              ),
              NumberButton(
                number: '8',
                onPressed: () {
                  cubit.addNumber(8);
                },
              ),
              NumberButton(
                number: '9',
                onPressed: () {
                  cubit.addNumber(9);
                },
              ),
              Expanded(
                child: ElevatedButton(
                  style: CalculatorStyle.buttonStyle,
                  onPressed: () {
                    cubit.multiple();
                  },
                  child: const Icon(
                    size: CalculatorStyle.numberSize + 20,
                    Icons.clear,
                    color: CalculatorStyle.actionColor,
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
                  cubit.addNumber(4);
                },
              ),
              NumberButton(
                number: '5',
                onPressed: () {
                  cubit.addNumber(5);
                },
              ),
              NumberButton(
                number: '6',
                onPressed: () {
                  cubit.addNumber(6);
                },
              ),
              Expanded(
                child: ElevatedButton(
                  style: CalculatorStyle.buttonStyle,
                  onPressed: () {
                    cubit.reduce();
                  },
                  child: const Icon(
                    size: CalculatorStyle.numberSize + 20,
                    Icons.remove,
                    color: CalculatorStyle.actionColor,
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
                  cubit.addNumber(1);
                },
              ),
              NumberButton(
                number: '2',
                onPressed: () {
                  cubit.addNumber(2);
                },
              ),
              NumberButton(
                number: '3',
                onPressed: () {
                  cubit.addNumber(3);
                },
              ),
              Expanded(
                child: ElevatedButton(
                  style: CalculatorStyle.buttonStyle,
                  onPressed: () {
                    cubit.increment();
                  },
                  child: const Icon(
                    size: CalculatorStyle.numberSize + 20,
                    Icons.add_outlined,
                    color: CalculatorStyle.actionColor,
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
                        WidgetStatePropertyAll(CalculatorStyle.iconColor),
                  ),
                  onPressed: () {},
                  child: const Text(
                    '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: CalculatorStyle.numberSize,
                    ),
                  ),
                ),
              ),
              NumberButton(
                number: '0',
                onPressed: () {
                  cubit.addNumber(0);
                },
              ),
              Expanded(
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(CalculatorStyle.iconColor),
                  ),
                  onPressed: () {
                    cubit.getFractionalNumber();
                  },
                  child: const Text(
                    ',',
                    style: TextStyle(
                      color: CalculatorStyle.numberColor,
                      fontSize: CalculatorStyle.numberSize,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(CalculatorStyle.actionColor),
                  ),
                  onPressed: () {
                    cubit.equal();
                  },
                  child: const Text(
                    '=',
                    style: TextStyle(
                      color: CalculatorStyle.numberColor,
                      fontSize: CalculatorStyle.numberSize,
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
    final cubit = context.watch<CalculatorCubit>().state;
    return Text(
      cubit.firstNumber + cubit.action + cubit.secondNumber,
      style: const TextStyle(fontSize: 60, color: Colors.white),
    );
  }
}

// class CounterText extends StatelessWidget {
//   const CounterText({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final counter = context.watch<CounterNotifier>().counter;
//     return Text(
//       '$counter',
//       style: const TextStyle(fontSize: 50),
//     );
//   }
// }

class CalculatorHistory extends StatelessWidget {
  const CalculatorHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CalculatorState>().historyList;
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: cubit.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              Expanded(
                child: Text(
                  cubit[index],
                  style: const TextStyle(
                    color: CalculatorStyle.iconColor,
                    fontSize: CalculatorStyle.numberSize,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
