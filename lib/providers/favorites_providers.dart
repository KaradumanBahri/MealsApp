import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavoriteMealsNotifier(): super([]);

  bool toggleMealFavoriteStatus(Meal meal){
    final mailIsFavorite = state.contains(meal);
    if ( mailIsFavorite) {
      state =state.where((m) => m.id != meal.id).toList();
      return false;
    }else{
      state =[...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier,
    List<Meal>> ((ref) {
  return FavoriteMealsNotifier();
},);