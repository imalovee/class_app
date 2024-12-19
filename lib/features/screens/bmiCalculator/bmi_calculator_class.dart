import 'dart:math';

class BmiCalculator{
  final int weight;
  final int height;

  BmiCalculator( {
    required this.weight,
    required this.height,
});
  double? _bmi;

 double getResults(){
   double heightInMeters = height / 100;
   _bmi = weight/pow(heightInMeters, 2);
   print("Raw BMI: $_bmi");

   return double.parse(_bmi!.toStringAsFixed(1));
 }

 String interpretation(){
   double _bmi = getResults();
   if (_bmi < 18.5) {
    return 'Underweight';
   } else if (_bmi < 24.9) {
      return 'Normal weight';
   } else if (_bmi < 29.9) {
     return 'Overweight';
   }  else {
     return 'Obesity';
   }
 }
 String getExplanations(){
   double _bmi = getResults();
   if (_bmi < 18.5) {
     return 'Your BMI is low, indicating your weight is in the Normal category for adults of your height.\n\n'
         'For your height, a normal weight range would be from 53.5 to 72 kilograms.\n\n'
         'Maintaining a healthy weight may reduce the risk of chronic diseases associated with overweight and obesity.';
   } else if (_bmi < 24.9) {
     return 'You have a normal body weight. Good job';
   } else if (_bmi < 29.9) {
     return 'You have a higher than normal body weight. Try an exercise\n\n'
         'For your height, a normal weight range would be from 53.5 to 72 kilograms.\n\n'
   'Maintaining a healthy weight may reduce the risk of chronic diseases associated with overweight and obesity.';
   } else {
     return "Your BMI is indicating your weight is in the Obesity Class category for adults of your height.\n\n Don't Wait, hit the Gym Immediately!!!";
   }
  }

}


