import 'package:circular_progress_stack/circular_progress_stack.dart';
import 'package:class_app/shared/app_colors.dart';
import 'package:class_app/shared/constants.dart';
import 'package:flutter/material.dart';


class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.resultsParams, });

 final ResultsParams resultsParams;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueGrey,
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back', style: poppinsTextStyle.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: AppColors.black
                  ),),),
                const SizedBox(height: 18,),
                Text('Your BMI is', style: poppinsTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: AppColors.deepBlue
                ),),
                const SizedBox(height: 28,),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       TweenAnimationBuilder(
                           tween: Tween<double>(
                               begin: 0.0,
                               end: resultsParams.bmiResult
                           ),
                           duration: const Duration(seconds: 2),
                           curve: Curves.easeInOut,
                           builder: (BuildContext context, double value, Widget? child){
                             // Calculate the percentage for the circular progress.
                             double progressValue = value / 50;
                             return Stack(
                               alignment: Alignment.center,
                               children: [
                               // Background circle
                               SizedBox(
                               width: 250,
                               height: 250,
                               child: CircularProgressIndicator(
                                 value: progressValue.clamp(0.0, 1.0), // Ensures valid range
                                 strokeWidth: 18,
                                 backgroundColor: Colors.grey.shade200,
                                 valueColor: const AlwaysStoppedAnimation<Color>(
                                     AppColors.deepBlue),
                               ),
                             ),
                                 Center(
                                   child: Text(
                                     resultsParams.bmiResult.toStringAsFixed(1),
                                     style: poppinsTextStyle.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 100,
                                      color: AppColors.deepBlue
                                        ),
                                   ),
                                 )
                             ]);
                           }
                       ),
                      const SizedBox(height: 16,),
                      Text(resultsParams.bmiInterpretation, style: poppinsTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                          color: AppColors.deepBlue
                      ),),
                    ],
                  ),
                ),
                const SizedBox(height: 26,),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  height: 170,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text(resultsParams.bmiExplanations
                          , style: poppinsTextStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: AppColors.black
                          ), ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}


class ResultsParams{
  final double bmiResult;
  final String bmiInterpretation;
  final String bmiExplanations;

  ResultsParams({
    required this.bmiResult,
    required this.bmiInterpretation,
    required this.bmiExplanations,
});
}









// SingleSimpleStackCircularProgressBar(
// barColor: AppColors.deepBlue,
// barValue: resultsParams.bmiResult,
// size: 250,
// progressStrokeWidth: 25,
// backStrokeWidth: 25,
// backColor: AppColors.white,
// startAngle: 0,
// //isTextShow: true,
// textStyle: poppinsTextStyle.copyWith(
// fontWeight: FontWeight.w600,
// fontSize: 100,
// color: AppColors.deepBlue
// ),
// ),