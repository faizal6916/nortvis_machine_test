import 'package:flutter/material.dart';
import '../services/api_status.dart';
import '../services/dishes_services.dart';
import '../models/dishes_model.dart';
import '../models/user_error.dart';

class DishesViewModel extends ChangeNotifier {
  bool _loading = false;
  List<DishModel> _dishes = [];
  UserError _userError = UserError();
  bool get loading => _loading;
  List<DishModel> get dishes => _dishes;
  UserError get userError => _userError;
  DishesViewModel() {
    getDishes();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setDishes(List<DishModel> dishes) {
    _dishes = dishes;
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  getDishes() async {
    setLoading(true);
    var response = await DishServices.getDishes();
    print(response.runtimeType);
    if (response is Success) {
      print('success');

      setDishes(response.response as List<DishModel>);
    }
    if (response is Failure) {
      print('failure');
      UserError userError =
          UserError(code: response.code, errorMessage: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }
}
