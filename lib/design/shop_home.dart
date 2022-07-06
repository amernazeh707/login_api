import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/bloc/shop_cubit.dart';
import '../constants/bloc/shop_states.dart';
import '../constants/size_config.dart';

class ShopHome extends StatelessWidget {
  const ShopHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ShopCubit shopCubit = ShopCubit.get(context);
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          return Scaffold(
            body: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Container(
                    height: SizeConfig.defaultHeightSize,
                    width: SizeConfig.defaultWidthSize,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.green.withOpacity(.5),
                          Colors.white.withOpacity(.5),
                          Colors.blue.withOpacity(.5)
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Text(
                            'ID: ${shopCubit.userLoginModel!.data!.data[0].id}',
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Center(
                          child: Text(
                            'user name: ${shopCubit.userLoginModel!.data!.data[0].userName}',
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Center(
                          child: Text(
                            'pass: ${shopCubit.userLoginModel!.data!.data[0].pass}',
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Center(
                          child: Text(
                            'name: ${shopCubit.userLoginModel!.data!.data[0].name}',
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Center(
                          child: Text(
                            'checkPoint: ${shopCubit.userLoginModel!.data!.data[0].checkPoint}',
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
