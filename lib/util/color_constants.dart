
import 'package:flutter/material.dart';

const Color appThemeColor = Color(0xFFF37037);
const Color statusColor = Color(0xFFD7662F);
const Color buttonColor = Color(0xFF160459);
const Color splashColor = Color(0xFF130459);
const Color textColor = Color(0xFF414042);
const Color favIconBack = Color(0xFF6D6E71);
const Color bottomAppColor = Color(0xFFBCBEC0);
const Color placeholderBackgroundColor = Color(0xFFDADADA);
const Color textColorWhite = Color(0xFFFFFFFF);
const Color progressBackgroundColor = Color(0xffE6E7E8);
const Color questionProgressBarColor = Color(0xff8EC549);
const Color appGradient1 = Color(0x00ffffff);
const Color appGradient2 = Color(0xEDEDEDE3);
const Color profileLabelColor = Color(0xFF6D6E71);
const Color profileGradient1 = Color(0xFFEE9F41);
const Color profileGradient2 = Color(0xFFF37037);
const Color dividerColor = Color(0xFF5E5E5E);
const Color profileHead = Color(0xFF6D6E71);
const Color searchHintColor = Color(0xFFBCBEC0);
const Color backgroundColor = Color(0xFFE9E9E9);
const Color backgroundColorMentor = Color(0xFF1E1E1E);
const Color tagLabelColor = Color(0xFFD9D9D9);
const Color profileEmailColor = Color(0xFF414042);
const Color backgroundFeedDetail = Color(0xFFFAFAFA);
const Color academyRecommendedTag = Color(0xFFF4D034);
const Color academyInProgress = Color(0xFF06475F);
const Color backgroundSelectedOption = Color(0xFFF5F5F5);
const Color upcomingSessionColor = Color(0xFFFEEFC3);
const Color requestDeclinedColor = Color(0xFFFCE8E6);
const Color requestDeclinedIconColor = Color(0xFFC5221F);
const Color sessionCompletedColor = Color(0xFFE6F4EA);
const Color sessionCompletedIconColor = Color(0xFF137333);
const Color sessionProgressColor = Color(0xFFE8F0FE);
const Color sessionProgressIconColor = Color(0xFF185ABC);
const Color linkLabelColor = Color(0XFF1A73E8);
const Color rightColor = Color(0XFF137333);
const Color wrongColor = Color(0XFFC5221F);
const Color placeholderBackColor = Color(0XFFD1D1D1);



const LinearGradient mainButton = LinearGradient(colors: [
  Color.fromRGBO(236, 60, 3, 1),
  Color.fromRGBO(234, 60, 3, 1),
  Color.fromRGBO(216, 78, 16, 1),
], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);

const List<BoxShadow> shadow = [
  BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 6)
];

screenAwareSize(int size, BuildContext context) {
  double baseHeight = 640.0;
  return size * MediaQuery.of(context).size.height / baseHeight;
}


