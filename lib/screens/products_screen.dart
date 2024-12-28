import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/components/products_builder.dart';
import 'package:shop_app/cubits/shop/cubit_shop.dart';
import 'package:shop_app/cubits/shop/states_shop.dart';
import 'package:shop_app/models/Categories_model.dart';
import 'package:shop_app/models/home_model.dart';


class ProductsScreen extends StatefulWidget {
  ProductsScreen({super.key});
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<CubitShop>(context).getProduct();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitShop, ShopStates>(
      builder: (context, state) {
       // print('Current State: ${state.runtimeType}');
           return  state is ShopLoadingStates ?
        Center(child: CircularProgressIndicator()) : ProductsBuilder();
        // if (state is ShopLoadingStates) {
        //   return Center(child: CircularProgressIndicator());
        // }
        // else if (state is ShopErrorStates) {
        //   return Center(child: Text("Error loading products"));
        // }
        // else if (state is ShopSuccessStates) {
        //   final cubit = BlocProvider.of<CubitShop>(context);

         // return ProductsBuilder();

          // Return your products builder here
          // return Center(child: Text('${cubit.homeModel?.banners.first.toString()}'),);
      //  }

        // Call getProduct only if the state is not loading or error
        // final cubit = BlocProvider.of<CubitShop>(context);
        // cubit.getProduct(); // Ensure this is called once, ideally in initState of StatefulWidget

       // return Container(); // Default case
      },
    );
  }
}