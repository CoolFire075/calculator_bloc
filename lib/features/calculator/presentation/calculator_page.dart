import 'package:calculator_bloc/features/calculator/cubit/calculator_cubit.dart';
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
            color: ,
            fontSize: 45,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            exit(0);
          },
          icon: const Icon(
            Icons.chevron_left,
            color: AppStyles.numberColor,
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
                        notifier.removeAll();
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
                        notifier.remove();
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
