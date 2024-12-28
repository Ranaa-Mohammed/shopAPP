import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/components/build_category_item.dart';
import 'package:shop_app/cubits/shop/cubit_shop.dart';
import 'package:shop_app/cubits/shop/states_shop.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitShop, ShopStates>(
      listener: (BuildContext context, ShopStates states) => CubitShop(),
      builder: (BuildContext context, ShopStates states) {
        CubitShop cubit = BlocProvider.of(context);
        return ListView.separated(
            itemBuilder: (context, index) => BuildCategoryItem(cubit.categoriesModel?.data?.data?[index]),
            separatorBuilder: (context, index) => Divider(
              height: 1,
              color: Colors.grey,
            ),
            itemCount: cubit.categoriesModel?.data?.data?.length ?? 0,
        );
      },
    );
  }
}