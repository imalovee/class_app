import 'package:class_app/shared/app_colors.dart';
import 'package:class_app/shared/assets.dart';
import 'package:class_app/shared/constants.dart';
import 'package:class_app/shared/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({super.key});

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {

  int sliderValue = 20;
  int _age = 23;
  int _weight = 70;

  // void increaeValue(){
  //   setState(() {
  //     _value++;
  //   });
  // }
  //
  // void decreaseValue(){
  //   setState(() {
  //     _value--;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: AppColors.blueGrey,
     body: SafeArea(
         child: Padding(padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               SizedBox(height: 20,),
                 Text('BMI Calculator',
                   style: poppinsTextStyle.copyWith(
                     color: AppColors.black,
                     fontSize: 24,
                     fontWeight: FontWeight.w600
                   ),),
               const SizedBox(height: 25,),
               Row(
                 children: [
                   Expanded(
                     child: Container(
                       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                       decoration: BoxDecoration(
                         color: AppColors.deepBlue,
                         borderRadius: BorderRadius.circular(12)
                       ),
                       child: Row(
                         children: [
                           const Icon(Icons.male, color: AppColors.white,),
                            SizedBox(width: 12,),
                            Text('Male',
                              style: poppinsTextStyle.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 15
                              ),)
                         ],
                       ),
                     ),
                   ),
                   SizedBox(width: 16,),
                   Expanded(
                     child: Container(
                       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                       decoration: BoxDecoration(
                           color: AppColors.white,
                           borderRadius: BorderRadius.circular(12)
                       ),
                       child: Row(
                         //mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           const Icon(Icons.female, color: AppColors.deepBlue,),
                           SizedBox(width: 12,),
                           Text('Female',
                             style: poppinsTextStyle.copyWith(
                                 fontWeight: FontWeight.w400,
                                 fontSize: 15,
                               color: AppColors.deepBlue
                             ),)
                         ],
                       ),
                     ),
                   )
                 ],
               ),
               const SizedBox(height: 46,),
               Row(
                 children: [
                   Container(
                     height: 400,
                     padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                     decoration: BoxDecoration(
                       color: AppColors.white,
                       borderRadius: BorderRadius.circular(12)
                     ),
                     child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         RotatedBox(
                           quarterTurns: -1,
                           child: SliderTheme(
                             data: SliderThemeData(
                               trackHeight: 13
                             ),
                             child: Slider(
                                 value: sliderValue.toDouble(),
                                 onChanged: (double newValue){
                                   setState(() {
                                     sliderValue = newValue.round();
                                   });
                                 },
                               max: 100.0,
                               min: 0.0,
                               divisions: null,
                               activeColor: AppColors.deepBlue,
                               inactiveColor: AppColors.blueGrey,
                             ),
                           ),
                         ),
                         SizedBox(width: 12,),
                         Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text('Height',
                             style: poppinsTextStyle.copyWith(
                               color: AppColors.deepGrey,
                               fontWeight: FontWeight.w400,
                               fontSize: 15
                             ),),
                             Text('$sliderValue',
                               style: poppinsTextStyle.copyWith(
                                   color: AppColors.black,
                                   fontWeight: FontWeight.w600,
                                   fontSize: 64
                               ),)
                           ],
                         )
                       ],
                     ),
                   ),
                   SizedBox(width: 20,),
                   Expanded(
                     child: Column(
                       children: [
                     Container(
                     padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                     decoration: BoxDecoration(
                       color: AppColors.white,
                       borderRadius: BorderRadius.circular(12),
                     ),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Weight', style: poppinsTextStyle.copyWith(
                             fontSize: 15,
                             fontWeight: FontWeight.w400,
                             color: AppColors.deepGrey
                         ),),
                         Text(_weight.toString(),style: poppinsTextStyle.copyWith(
                             fontSize: 64,
                             fontWeight: FontWeight.w600,
                             color: AppColors.black
                         ),),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             RoundIconButton(
                                 icon: Icon(CupertinoIcons.minus, color: AppColors.white,),
                                 onPressed: (){
                                   setState(() {
                                     _weight--;
                                   });
                                 }
                             ),
                             RoundIconButton(
                                 icon: Icon(CupertinoIcons.plus, color: AppColors.white,),
                                 onPressed: (){
                                   setState(() {
                                     _weight++;
                                   });
                                 }
                             ),
                           ],
                         )
                       ],
                     ),
                   ),
                      SizedBox(
                        height: 16,
                      ),
                         Container(
                           padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                           decoration: BoxDecoration(
                             color: AppColors.white,
                             borderRadius: BorderRadius.circular(12),
                           ),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text('Age', style: poppinsTextStyle.copyWith(
                                   fontSize: 15,
                                   fontWeight: FontWeight.w400,
                                   color: AppColors.deepGrey
                               ),),
                               Text(_age.toString(),style: poppinsTextStyle.copyWith(
                                   fontSize: 64,
                                   fontWeight: FontWeight.w600,
                                   color: AppColors.black
                               ),),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   RoundIconButton(
                                       icon: Icon(CupertinoIcons.minus, color: AppColors.white,),
                                       onPressed: (){
                                         setState(() {
                                           _age--;
                                         });
                                       }
                                   ),
                                   RoundIconButton(
                                       icon: Icon(CupertinoIcons.plus, color: AppColors.white,),
                                       onPressed: (){
                                         setState(() {
                                           _age++;
                                         });
                                       }
                                   ),
                                 ],
                               )
                             ],
                           ),
                         ),
                       ],
                     ),
                   ) ,
                   ]
                   ) ,
                   SizedBox(height: 36,)      ,
                   Container(
                      width: MediaQuery.of(context).size.width,
                     padding: const EdgeInsets.symmetric(vertical: 12),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(12),
                       color: AppColors.deepBlue
                     ),
                     child: Text("Let's Go", style: poppinsTextStyle.copyWith(
                       color: AppColors.white,
                       fontSize: 15,
                       fontWeight: FontWeight.w400
                     ),
                     textAlign: TextAlign.center,),
                   )
             ],
           ),
         )
     ),
    );
  }
}

