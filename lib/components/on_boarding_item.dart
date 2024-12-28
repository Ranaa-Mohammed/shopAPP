import 'package:flutter/material.dart';
import 'package:shop_app/models/boarding_model.dart';

class OnBoardingItem extends StatelessWidget {
   OnBoardingItem(this.boardingModel ,{super.key});
   BoardingModel boardingModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Image(
              image: AssetImage(
                  '${boardingModel.image}',
              ),
            ),
        ),
        SizedBox(height: 30,),
        Text(
          '${boardingModel.title}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
            fontFamily: 'Janna',
          ),
        ),
        SizedBox(height: 20,),
        Text(
          '${boardingModel.body}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
            fontFamily: 'Janna',
          ),
        ),
      ],
    );
  }
}
