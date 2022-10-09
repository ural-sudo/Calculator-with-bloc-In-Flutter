

import 'package:calculator/constants/colors.dart';
import 'package:calculator/constants/paddings.dart';
import 'package:calculator/view/calculator/viewModel/calculator_cubit.dart';
import 'package:calculator/view/calculator/viewModel/calculator_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../product/calculator_products.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {


  List<String> numbers = ["0","1","2","3","4","5","6","7","8","9"];
  List<String> operations = ["+","-","x","/","=","%","+/-","AC","."];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BlocBuilder<CalculatorCubit,CalculatorState>(
                builder: (context, state) {
                  return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:[
                     Expanded(
                       child: Text(state.text,
                       maxLines: 1,
                       overflow: TextOverflow.ellipsis,
                       textAlign: TextAlign.right,
                        style: const TextStyle(fontSize:60),
                      ),
                     ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 10,),
              Padding(
                padding:ProjectPaddings.buttonsPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CalculateButton(text: operations[7],color: ProjectColors.grey500),
                    CalculateButton(text: operations[6],color: ProjectColors.grey500),
                    CalculateButton(text: operations[5],color: ProjectColors.grey500),
                    CalculateButton(text: operations[3],color:ProjectColors.nearOrange),
                  ],
                ),
              ),
              Padding(
                padding: ProjectPaddings.buttonsPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CalculateButton(text: numbers[7]),
                    CalculateButton(text: numbers[8]),
                    CalculateButton(text: numbers[9]),
                    CalculateButton(text: "x",color:ProjectColors.nearOrange),
                  ],
                ),
              ),
              Padding(
                padding: ProjectPaddings.buttonsPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CalculateButton(text:numbers[4]),
                    CalculateButton(text:numbers[5]),
                    CalculateButton(text:numbers[6]),
                    CalculateButton(text: operations[1],color:ProjectColors.nearOrange),
                  ],
                ),
              ),
              Padding(
                padding: ProjectPaddings.buttonsPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CalculateButton(text: numbers[1]),
                    CalculateButton(text: numbers[2]),
                    CalculateButton(text: numbers[3]),
                    CalculateButton(text: operations[0],color:ProjectColors.nearOrange),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CalculateButton(
                    widthSize: 0.44,
                    alignment: Alignment.centerLeft,
                    text: numbers[0],
                  ),
                  CalculateButton(
                    text: operations[8],
                  ),
                  CalculateButton(
                    color: ProjectColors.nearOrange,
                    text: operations[4],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
