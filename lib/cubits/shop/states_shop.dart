import 'package:shop_app/models/home_model.dart';

class ShopStates {}

class ShopInitializeStates extends ShopStates {}

class ChangeBottomNavStates extends ShopStates {}

class ShopLoadingStates extends ShopStates {}

class ShopSuccessStates extends ShopStates {
  final HomeModel? homeModel;

  ShopSuccessStates([this.homeModel]);
}

class ShopErrorStates extends ShopStates {}

class ShopSuccessCategoriesStates extends ShopStates {

}

class ShopErrorCategoriesStates extends ShopStates {}


class ShopSuccessFavoriteStates extends ShopStates {}

class ShopErrorFavoriteStates extends ShopStates {}