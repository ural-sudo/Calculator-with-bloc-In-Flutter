

import 'package:calculator/view/calculator/viewModel/calculator_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CalculatorCubit extends Cubit<CalculatorState>{
  CalculatorCubit():super(CalculatorState());

  
  String result = "";
  String finalResult = "";
  String operation = "";
  
  double numberOne = 0;
  double numberTwo = 0;

  String buttonText = "";
  

  void calculateOperation(String buttonText){

    if(buttonText == "AC"){
      result = "";
      finalResult = "";
      operation = "";
      numberOne = 0;
      numberTwo = 0;
      emit(CalculatorState(text: finalResult));
    }
    else if(buttonText == "+" ||
      buttonText == "-" ||
      buttonText == "x" ||
      buttonText == "/" ||
      buttonText == "=" ||
      buttonText == "%"
    ){

      if(numberOne == 0){
        numberOne = double.parse(result);
      }else if (numberTwo == 0){
        numberTwo = double.parse(result);
      }else{
        numberTwo = 0;
      }

      if(operation == "+"){
        finalResult = addNumbers();
        emit(CalculatorState(text: finalResult));
        numberOne = double.parse(finalResult);
      }else if(operation == "-"){
        finalResult = minusNumbers();
        emit(CalculatorState(text: finalResult));
        numberOne = double.parse(finalResult);
      }else if(operation == "x"){
        finalResult = multipleNumbers();
        emit(CalculatorState(text: finalResult));
        numberOne = double.parse(finalResult);
      }else if(operation == "/"){
        finalResult = divideNumbers();
        emit(CalculatorState(text: finalResult));
        numberOne = double.parse(finalResult);
      }else if(operation == "%"){
        finalResult = remainingNumber();
        emit(CalculatorState(text: finalResult));
        numberOne = double.parse(finalResult);
      }
      
      operation = buttonText;
      result = "";
    }
    else{
      result += buttonText;
      finalResult = result;
      emit(CalculatorState(text: finalResult));
    }
  }

  String addNumbers(){
    finalResult = (numberOne + numberTwo).toString();
    return finalResult;
  }
  String minusNumbers(){
    finalResult = (numberOne - numberTwo).toString();
    return finalResult;
  }
  String multipleNumbers() {
    finalResult = (numberOne * numberTwo).toString();
    return finalResult;
  }
  String divideNumbers() {
    finalResult = (numberOne / numberTwo).toString();
    return finalResult;
  }
  String remainingNumber() {
    finalResult = (numberOne % numberTwo).toString();
    return finalResult;
  }
}
