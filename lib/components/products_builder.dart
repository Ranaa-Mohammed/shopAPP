import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/shop/cubit_shop.dart';
import 'builder_categories_item_home.dart';

class ProductsBuilder extends StatelessWidget {
    ProductsBuilder( {super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CubitShop>(context);
    cubit.getProduct();
    cubit.getCategories();
   // print('sjvsu ${cubit.homeModel?.data?.banners}');
    return  SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //test
          CarouselSlider(
            items: cubit.homeModel?.data?.banners?.map((e) => Image(
                  image: NetworkImage('${e.image}'),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),).toList()  ?? [],
            options: CarouselOptions(
              viewportFraction: 1,
              height: 200,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
          ),
          //SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Categories',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => BuilderCategoriesItemHome(cubit.categoriesModel?.data?.data?[index]),
                    separatorBuilder: (context, index) => SizedBox(width: 10,),
                    itemCount: cubit.categoriesModel?.data?.data?.length ?? 0,
                  ),
                ),
                SizedBox(height: 20,),
                Text('New Products',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
            ],
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1 / 1.76,
            children: List.generate(
              cubit.homeModel?.data?.products?.length ?? 0,
                  (index) => Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Stack(
                                   alignment: AlignmentDirectional.bottomStart,
                                   children: [
                                     Image(
                                     image: NetworkImage('${cubit.homeModel?.data?.products?[index].image }'),
                                     width: double.infinity,
                                     height: 200,
                                   ),
                                     Container(
                                       color: Colors.red,
                                       padding: EdgeInsets.symmetric(horizontal: 5,),
                                       child: Text('DISCOUNT',
                                         style: TextStyle(
                                           fontSize: 10,
                                           color: Colors.white,
                                         ),
                                       ),
                                     ),
                                       ],
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(12.0),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text('${cubit.homeModel?.data?.products?[index].name}',
                                         maxLines: 2,
                                         overflow: TextOverflow.ellipsis,
                                         style: TextStyle(
                                           height: 1.3,
                                         ),

                                       ),
                                       Row(
                                         children: [
                                           Text('${cubit.homeModel?.data?.products?[index].price.round()}',
                                             style: TextStyle(
                                               fontSize: 13,
                                               color: Colors.indigo,
                                             ),

                                           ),
                                           SizedBox(width: 5,),
                                           Text('${cubit.homeModel?.data?.products?[index].oldPrice.round()}',
                                             style: TextStyle(
                                               fontSize: 12,
                                               color: Colors.grey,
                                               decoration: TextDecoration.lineThrough,
                                             ),
                                           ),
                                           Spacer(),
                                           IconButton(
                                                   onPressed: (){
                                                print(cubit.homeModel?.data?.products?[index].id);
                                               },
                                               icon: Icon(Icons.favorite_border,),
                                               //cubit.homeModel?.data?.products?[index].id  ?
                                               //Icon(Icons.favorite_border,) : Icon(Icons.favorite,),
    // cubit.favorite ?
    // icon:Icon(Icons.favorite_border,) : Icon(Icons.favorite,),
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
        ],
      ),
    );
  }
}