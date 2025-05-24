import 'package:ecotrail/widgets/custom_heading.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../constants.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBar,
        title:Text("EcoTrail",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: kWhiteColor)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomText(text: "Good Morning, Rina"),
                SizedBox(height: kHeight,),
                CustomText(text: "Sunny? Perfect for biking !",isLarge: false,),
                SizedBox(height: kHeight,),
          
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFFFAFAFA),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey.shade300)],
                  ),
                  child: Column(
                    children: [
                      Text('See your carbon footprint today!'),
                      SizedBox(height: 10),
                      CircularPercentIndicator(
                        radius: 60,
                        lineWidth: 12,
                        percent: 0.74,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("148kg", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                            Text("CO₂\nToday", textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        progressColor: Colors.teal,
                        backgroundColor: Colors.grey.shade300,
                      ),
                      SizedBox(height: 10),
                      Text('148 kg CO₂ saved\nLike 1,024 phone charges!', textAlign: TextAlign.center),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                SizedBox(height: kHeight,),

                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFFFAFAFA),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey.shade300)],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IndicatorDot(label: 'Transportation', color: Color(0xff2C6376),value: "(420Kg)",),
                      SizedBox(height: 10,),
                      IndicatorDot(label: 'Lifestyle', color: Color(0xffDBA945),value: "(203Kg)",),
                      SizedBox(height: 10,),

                      IndicatorDot(label: 'Consumption Habits', color: Color(0xff3AA8A4),value: "(104Kg)",),
                    ],
                  ),
                ),

                SizedBox(height: 20),
          
                // Priority Challenge
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Today’s Priority Challenge', style: TextStyle(fontWeight: FontWeight.w600)),
                    CustomText(text: "View More",isLarge: false,),
                  ],
                ),
                SizedBox(height: 8),
                Container(
          height: 250
                  ,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey.shade300)],
          
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xff8DF7F7),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey.shade300)],
                        ),
                        height: 150,
                        child:                      Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Image.asset('assets/water.png', height: 50,alignment: Alignment.centerRight,),
                        ), // Replace with your asset
          
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Water saving quick wins",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis, // optional: trims long text
                                ),
                                SizedBox(height: 4),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.arrow_drop_down_outlined,size: 30,color: Color(0xff91CDCD),),
                                    Text(
                                      "Reduce emissions by 430 kg",
                                      style: TextStyle(color: Colors.grey[600]),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),


    );
  }
}
class IndicatorDot extends StatelessWidget {
  final String label;
  final Color color;
  final String value;

  IndicatorDot({required this.label, required this.color,required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 5, backgroundColor: color),
        SizedBox(width: 4),
        Text(label, style: TextStyle(fontSize: 12)),
        SizedBox(width: 2,),
        Text(value,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),)
      ],
    );
  }
}