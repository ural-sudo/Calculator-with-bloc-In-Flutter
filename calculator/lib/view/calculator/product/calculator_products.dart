
import 'package:calculator/view/calculator/viewModel/calculator_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewModel/calculator_cubit.dart';
class CalculateButton extends StatelessWidget {
  CalculateButton({
    this.color = const Color(0xFF443E3E),
    required this.text,
    this.buttonColor = Colors.white,
    this.widthSize = 0.20,
    this.alignment = Alignment.center,
    Key? key,
  }) : super(key: key);
  
  Color? color;
  final String text; 
  Color buttonColor;
  num widthSize;
  AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return BlocBuilder<CalculatorCubit,CalculatorState>(
      builder: (context, state) {
        return SizedBox(
        height: size.height*0.12,
        width: size.width*widthSize,
        child: Container(
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: color,
            
          ),
          alignment: alignment,
          child:TextButton(
            onPressed: () {
              context.read<CalculatorCubit>().calculateOperation(text);
            },
            child:Text(text,style:TextStyle(color: buttonColor,fontSize: 35),),
          ),
    
        ),
      );
      },
      
    );
  }
}