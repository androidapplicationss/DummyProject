import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netzero/model/urlModel.dart';
import 'package:netzero/pages/custom_textField.dart';
import 'package:netzero/pages/webview.dart';
import 'package:netzero/repository/repository.dart';
import 'package:netzero/util/color_constants.dart';
import 'package:netzero/util/constants.dart';

import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:netzero/model/urlModel.dart';
import 'package:netzero/restApi/rest_client.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:netzero/util/toast_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  final String title ;
   String errorMsg = "Please enter a valid code";


  LandingPage({super.key,required this.title });

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final codeEditFieldController = TextEditingController();
  Repository repository = Repository();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          maintainBottomViewPadding: true,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 240,
                  width: 240,
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: SvgPicture.asset(
                        "images/home_page_logo.svg",
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 16.0,left: 16.0),
                  child: CustomTextField(
                    hintTextString: "****",
                    labelText: "Enter Code",
                    inputType: InputType.nameType,
                    textEditController: codeEditFieldController,
                  ),
                ),
                Visibility(
                    visible: isVisible,child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(alignment: Alignment.topLeft,child: Text("Please enter a valid code",style: TextStyle(color: Colors.red),)),
                    )),

                const SizedBox(height: 32,),


                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 55,
                    width: 364,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(textColorWhite),
                            backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                 RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side: BorderSide(color: buttonColor)
                                )
                            )
                        ),
                        onPressed: () {

                          if(codeEditFieldController.text.length>0) {
                            fetchUrl(codeEditFieldController.text.toString(),codeEditFieldController.text);
                          }
                          else{
                            setState(() {
                              isVisible = true;
                            });
                          }


                        },
                        child: const Text(
                            "Submit",
                            style: TextStyle(fontSize: 14)
                        )),
                  ),
                ),
                SizedBox(height: 10,),

                Spacer(flex: 1,),
                Center(
                  child: Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Column(


                      children: [
                        SvgPicture.asset(
                          "images/poweredby.svg",
                          fit: BoxFit.fitHeight,
                          width: 200,
                          height: 60,
                        ),
                        /*SvgPicture.asset(
                          "images/ied_logo.svg",
                          width: 42,
                          height: 36,
                        ),*/
                        Image.asset('images/ied.png',
                        ),
                        SizedBox(height: 10,)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }




  Future<UrlModel?> fetchUrl(String code, String text) async {
    try {
      final client =
      ApiClient(Dio(BaseOptions(contentType: "application/json")));
      final String response = await client.extractUrl(code);
      print(response);
      Map<String, dynamic> valueMap = json.decode(response);
      if(valueMap['status'] ==1){
        final sph = await SharedPreferences.getInstance();
        sph.setString("is_success", "success");
        String url = valueMap['url'].toString();
        sph.setString("url", url);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>   WebviewScreen(url:url,)));
          //  MaterialPageRoute(builder: (context) =>   WebViewScreen()));

      }

      print(valueMap['status'].toString());
      return UrlModel.fromJson(valueMap);

    } on DioError catch (e) {
      setState(() {
        isVisible= true;

      });

    }
  }


}
