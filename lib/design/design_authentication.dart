import 'dart:math';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test4/design/shop_home.dart';

import '../constants/bloc/shop_cubit.dart';
import '../constants/bloc/shop_states.dart';
import '../constants/size_config.dart';
import '../constants/text_form_field.dart';

TextEditingController userEditingController = TextEditingController();
TextEditingController passwordEditingController = TextEditingController();

class DesignAuthentication extends StatelessWidget {
  const DesignAuthentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ShopCubit shopCubit = ShopCubit.get(context);
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (BuildContext context, state) {
        if (state is ShopCompleteLoginState) {
          if (shopCubit.userLoginModel!.flag.toString() == 'true') {
            Fluttertoast.showToast(
                msg: shopCubit.userLoginModel!.message.toString(),
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShopHome(),
                ));
          } else {
            Fluttertoast.showToast(
                msg: 'Error',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        } else {
          Fluttertoast.showToast(
              msg: 'Error',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (BuildContext context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
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
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: SizeConfig.defaultHeightSize! * .1),
                        child: Container(
                          height: SizeConfig.defaultHeightSize! * .11,
                          padding: EdgeInsets.all(
                              (SizeConfig.defaultHeightSize! * .01)),
                          transform: Matrix4.rotationZ(-8 * pi / 180),
                          decoration: BoxDecoration(
                            color: Colors.deepOrange.shade600,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 20,
                                  offset: Offset(2, 2)),
                            ],
                          ),
                          child: Text(
                            'My Shop',
                            style: TextStyle(
                                fontSize: SizeConfig.defaultHeightSize! * .07,
                                color: Colors.white,
                                fontFamily: 'CustomFont'),
                          ),
                        ),
                      ),
                      const Spacer(),
                      SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(
                              SizeConfig.defaultHeightSize! / 60),
                          height: SizeConfig.defaultHeightSize! * .79,
                          child: Column(
                            children: <Widget>[
                              const Spacer(),
                              SizedBox(
                                height: SizeConfig.orientation ==
                                        Orientation.landscape
                                    ? SizeConfig.defaultHeightSize! * .18
                                    : null,
                                child: Card(

                                  margin: const EdgeInsets.all(0),
                                  color: Colors.white,
                                  elevation: 30,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: defaultFormField(
                                    controller: userEditingController,
                                    label: 'user name',
                                    prefix:
                                        Icons.supervised_user_circle_outlined,
                                    cursorColor: Colors.deepOrange.shade600,
                                    prefixColor: Colors.deepOrange.shade600,
                                    labelColor: Colors.deepOrange.shade600,
                                    type: TextInputType.emailAddress,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    SizeConfig.defaultHeightSize! * .011 / 2,
                              ),
                              SizedBox(
                                height: SizeConfig.orientation ==
                                        Orientation.landscape
                                    ? SizeConfig.defaultHeightSize! * .18
                                    : null,
                                child: Card(
                                  margin: const EdgeInsets.all(0),
                                  color: Colors.white,
                                  elevation: 30,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: defaultFormField(
                                    controller: passwordEditingController,
                                    label: 'password',
                                    prefix: Icons.lock_outline,
                                    cursorColor: Colors.deepOrange.shade600,
                                    prefixColor: Colors.deepOrange.shade600,
                                    labelColor: Colors.deepOrange.shade600,
                                    type: TextInputType.text,
                                    isPassword: true,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    SizeConfig.defaultHeightSize! * .011 / 2,
                              ),
                              SizedBox(
                                height:
                                    SizeConfig.defaultHeightSize! * .011 / 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      shopCubit.userLogin(
                                          userName: userEditingController.text,
                                          password:
                                              passwordEditingController.text);
                                    },
                                    child: const Text(
                                      'LOGIN',
                                      style:
                                          TextStyle(fontFamily: 'CustomFont'),
                                    ),
                                    color: Colors.deepOrange.shade600,
                                    textColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
