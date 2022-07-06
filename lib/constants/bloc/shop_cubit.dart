
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test4/constants/bloc/shop_states.dart';

import '../../shop_model/login_model.dart';
import '../networking/shop_dio.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) {
    return BlocProvider.of(context);
  }

  UserLoginModel? userLoginModel;
  userLogin({String? userName, String? password}) {
    ShopDio.dioPostData(
      url: 'User',
      data: {'username': userName, 'pass': password},
    ).then((value) {
      userLoginModel = UserLoginModel.jsonData(value.data);
      emit(ShopCompleteLoginState());
    }).catchError((error) {
      emit(ShopErrorLoginState());
    });
  }
}
