import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_providers.dart';

enum Filter{
  glutenFree,
  lactoseFree,
  vegaterianFree,
  veganFree,
}


class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier() : super({
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegaterianFree: false,
    Filter.veganFree: false,
  });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive){
    state ={
      ...state,
      filter: isActive,
    };
  }
}

final filtersProviter =
    StateNotifierProvider<FiltersNotifier,Map<Filter,
    bool>>((ref) => FiltersNotifier()
    );
final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProviter);
  return meals.where((meal) {
    if(activeFilters[Filter.glutenFree]! && !meal.isGlutenFree){
      return false;
    }
    if(activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree){
      return false;
    }
    if(activeFilters[Filter.vegaterianFree]! && !meal.isVegetarian){
      return false;
    }
    if(activeFilters[Filter.veganFree]! && !meal.isVegan){
      return false;
    }
    return true;
  }).toList();
});