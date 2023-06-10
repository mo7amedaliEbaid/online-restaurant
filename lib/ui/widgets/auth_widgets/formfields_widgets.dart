import 'package:flutter/material.dart';

import '../../../constants/app_consts.dart';
import '../../../constants/global_consts.dart';

Widget UserFormField(
    BuildContext context, TextEditingController usernameController) {
  return TextFormField(
    validator: (String? value) {
      if (value == null) {
        return AppConstants.usernamevalidatin;
      } else if (value.isEmpty) {
        return AppConstants.usernamevalidatin;
      }
    },
    controller: usernameController,
    decoration: InputDecoration(
      errorStyle: TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      iconColor: Colors.grey,
      prefixIcon: Icon(
        Icons.nest_cam_wired_stand,
        color: appbarcolor,
      ),
      filled: true,
      fillColor: Colors.white,
      border: InputBorder.none,
      hintText: 'UserName',
    ),
  );
}

Widget PassFormField(BuildContext context) {
  bool _obscureText = true;
  return StatefulBuilder(builder: (context, setState) {
    void _toggle() {
      setState(() {
        _obscureText = !_obscureText;
      });
    }

    return TextFormField(
      validator: (String? value) {
        if (value == null) {
          return AppConstants.passvalidation;
        } else if (value.isEmpty) {
          return AppConstants.passvalidation;
        }
      },
      controller: passwordController,
      decoration: InputDecoration(
          errorStyle: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
          filled: true,
          fillColor: Colors.white,
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.lock,
            color: appbarcolor,
          ),
          hintText: 'Password',
          suffixIcon: IconButton(
              onPressed: _toggle,
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: appbarcolor,
              ))),
      obscureText: _obscureText,
    );
  });
}
