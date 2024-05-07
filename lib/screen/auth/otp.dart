import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mandiweb/controller/auth_controller/auth_controller.dart';
import 'package:mandiweb/widgets/buttons/custom_fbuttons.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../constant/constant_color.dart';


class OtpScreen extends StatefulWidget {
  OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
 //LoginController loginController = Get.put(LoginController());

  var userName = Get.arguments;

  int secondsRemaining = 30;

  bool enableResend = false;

  late Timer timer;

  @override
  initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  TextEditingController Otp = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: (){Get.back();},
                      child: CircleAvatar(backgroundColor: Colors.white
                          ,child: Icon(Icons.arrow_back_ios,color: Colors.black, size: 20,))
                    )
                  ],

                ),
              ),

              SizedBox(height: MediaQuery.of(context).padding.top),

              welcome(),
              text(),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Text("OTP Code",style: TextStyle( fontWeight: FontWeight.w600,fontSize: 21)),

                  ],

                ),
              ),
              Text(userName.toString()),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 24),
                  child: PinCodeTextField(
                    keyboardType: TextInputType.number,
                    length: 6,
                    controller: Otp,
                    appContext: context,
                    autoDismissKeyboard: true,
                    autoDisposeControllers: false,

                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      inactiveColor: klightblack,
                      activeColor: Colors.black,
                      selectedColor: kblue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    onCompleted: (otp){

                    },
                    onChanged: (otp) {

                    },

                  ),
                ),
              ),

               SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomFButton(onTap: (){
                  EasyLoading.show(
                    status: 'Loading...',
                  );
                  AuthController().otpVerify(mobile: userName[0],otp:Otp.text ,userName: userName[1]);

                },title: "Verify",),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    TextButton(
                      child: Text('Resend Code ${ secondsRemaining==0?"":secondsRemaining.toString()}',
                      style: TextStyle(
                        color: Color(0xff01A3FB,
                        )
                      ),
                      ),
                      onPressed: enableResend ? _resendCode : null,
                    ),
                    //Text("${ secondsRemaining.toString()==0?"":secondsRemaining.toString()}"),
                  ] ,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget welcome() => Container(
    margin: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
    child: const Text(
      "OTP Verification",
      style: TextStyle(
          color: Color(0xff2B2B2B),
               fontSize: 32.0, fontWeight: FontWeight.w700),
    ),
  );

  Widget text() => Container(
    margin: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 30.0),
    child: Text(
      "Please check your Inbox to see the verification code.",
      style: TextStyle(
          color: Color(0xff707B81
          ),
          fontSize: 16.0,
          fontWeight: FontWeight.w400),
    ),
  );

  Widget otpTextField(BuildContext context, bool autoFocus) {
    return Container(

      height: MediaQuery.of(context).size.shortestSide * 0.13,
      child: AspectRatio(
        aspectRatio: 0.8,
        child: TextFormField(
          autofocus: autoFocus,
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black))),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLines: 1,
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }

  // Widget button({required Function onPress, required String text}) {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
  //     height: 50,
  //     width: Get.width,
  //     child: MaterialButton(
  //       onPressed: () {
  //         onPress();
  //       },
  //       color: kblue,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
  //       child: Text(
  //         text,
  //         style: const TextStyle(
  //             fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.white),
  //       ),
  //     ),
  //   );
  // }

  void _resendCode()async {
    //other code here
    await AuthController().login(mobile: userName[0],username: userName[1]);
    //await loginController.login(mobile:getemail[0].toString());
    setState((){
      secondsRemaining = 30;
      enableResend = false;
    });
  }

  @override
  dispose(){
    timer.cancel();
    super.dispose();
  }

}
