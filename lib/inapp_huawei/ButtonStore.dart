import 'package:flutter/material.dart';
import 'dart:developer' show log;
import 'package:flutter/services.dart' show PlatformException;
import 'package:huawei_iap/huawei_iap.dart';

import './utils/CustomButton.dart';
import 'CustomWidgets/StorePage.dart';

class ButtonStore extends StatefulWidget {
  const ButtonStore({Key? key}) : super(key: key);

  @override
  State<ButtonStore> createState() => _ButtonStoreState();
}

class _ButtonStoreState extends State<ButtonStore> {
  String? isEnvReadyStatus;
  String? sandboxReadyStatus;
  bool hmsLoggerStatus = true;

  @override
  void initState() {
    // TODO: implement initState
    enablePendingPurchase();
    environmentCheck();
    super.initState();
  }

  enablePendingPurchase() async {
    String result = await IapClient.enablePendingPurchase();
    log(result);
  }

  environmentCheck() async {
    isEnvReadyStatus = null;
    try {
      IsEnvReadyResult response = await IapClient.isEnvReady();
      setState(() {
        if (response.status != null)
          isEnvReadyStatus = response.status!.statusMessage;
      });
    } on PlatformException catch (e) {
      if (e.code == HmsIapResults.LOG_IN_ERROR.resultCode) {
        log(HmsIapResults.LOG_IN_ERROR.resultMessage!);
      } else {
        log(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          isEnvReadyStatus == null
              ? SizedBox.shrink()
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Environment Status: " + isEnvReadyStatus!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    CustomButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePageHW()));
                      },
                      text: "Store",
                    )
                  ],
                ),
        ]);
  }
}
