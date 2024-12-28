import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/Categories_model.dart';

import '../cubits/shop/cubit_shop.dart';

class BuilderCategoriesItemHome extends StatelessWidget {
  BuilderCategoriesItemHome(this.dataModel, {super.key});
         DataModel? dataModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Image(
          image: NetworkImage('${dataModel?.image}'),
          height: 100,
          width: 100,
          //fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black.withOpacity(0.8),
          width: 100,
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text('${dataModel?.name}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
