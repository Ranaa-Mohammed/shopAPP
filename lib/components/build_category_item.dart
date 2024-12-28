

import 'package:flutter/material.dart';
import 'package:shop_app/models/Categories_model.dart';

class BuildCategoryItem extends StatelessWidget {
   BuildCategoryItem(this.dataModel, {super.key});
       DataModel? dataModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Image(
            image: NetworkImage(
                '${dataModel?.image}'
            ),
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 20,),
          Text('${dataModel?.name}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Spacer(),
             Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
