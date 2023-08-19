import 'dart:async';
import 'package:flutter/material.dart';

class ToastUtils {
  static Timer? toastTimer;
  static OverlayEntry? _overlayEntry;

  static void showCustomToast(
      BuildContext context, String message, bool isErrorMsg) {
    if (toastTimer == null || !toastTimer!.isActive) {
      _overlayEntry = createOverlayEntry(context, message, isErrorMsg);
      Overlay.of(context).insert(_overlayEntry!);
      toastTimer = Timer(const Duration(seconds: 2), () {
        if (_overlayEntry != null) {
          _overlayEntry!.remove();
        }
      });
    }
  }

  static OverlayEntry createOverlayEntry(
      BuildContext context, String message, bool isErrorMsg) {
    return OverlayEntry(
        builder: (context) => Positioned(
              top: 300.0,
              width: MediaQuery.of(context).size.width - 40,
              left: 23,
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  alignment: Alignment.center,
                  height: 48,
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 13, bottom: 10),
                  decoration: BoxDecoration(
                      color: isErrorMsg
                          ? const Color(0xffFAD5C5)
                          : const Color(0xffE6F4EA),
                      border: Border.all(
                          color: isErrorMsg
                              ? Colors.red
                              : const Color(0xff137333)),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      Icon(
                          isErrorMsg
                              ? Icons.info_outline
                              : Icons.check_circle_outline_outlined,
                          color: isErrorMsg
                              ? Colors.red
                              : const Color(0xff137333)),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 0.19,
                          fontWeight: FontWeight.w400,
                          color:
                              isErrorMsg ? Colors.red : const Color(0xFF3C4043),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
