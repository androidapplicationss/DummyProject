import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netzero/util/color_constants.dart';

class InternetNotAvailable extends StatelessWidget {
  const InternetNotAvailable({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const Text(
              'No Internet Connection',
              textAlign: TextAlign.center,
              style: TextStyle(color: textColor, fontSize: 18,fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 30,),
            SvgPicture.asset(
              'images/no_internet_image.svg',
            ),
             const Padding(
               padding: EdgeInsets.all(16.0),
               child: Text(
                'Please check your internet connection again, or connect to Wi-Fi',
                textAlign: TextAlign.center,
                style: TextStyle(color: textColor, fontSize: 14,fontWeight: FontWeight.w400),
            ),
             ),
             const Visibility(
               visible: false,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.refresh,color: appThemeColor,),
                    Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Text(
                      'Reload',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: appThemeColor, fontSize: 20,fontWeight: FontWeight.w700),
            ),
                   ),
                 ],
               ),
             ),
          ],
        ),
      ),
    ),);
  }
}
