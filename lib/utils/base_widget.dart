import 'package:clone_epoint/const/const.dart';
import 'package:flutter/cupertino.dart';

Widget baseButtonGradient(
    {@required Widget child, @required Function onPressed}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFF42A5F5),
            Color(0xFF0D47A1),
          ],
        ),
      ),
      padding: EdgeInsets.all(AppDimens.paddingDefault),
      alignment: Alignment.center,
      child: child,
    ),
  );
}
