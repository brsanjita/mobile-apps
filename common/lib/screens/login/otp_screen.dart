import 'package:common/models/user/mobile_number.dart';
import 'package:common/utils/user_controller.dart';
import 'package:common/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class OTPScreen extends StatefulWidget {
  final MobileNumber mobileNumber;
  const OTPScreen({
    Key key,@required this.mobileNumber,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OTPScreenState();
  }
}

class _OTPScreenState extends State<OTPScreen>
    with TickerProviderStateMixin<OTPScreen> {
  AnimationController controller;
  GlobalKey<FormState> _otpKey = GlobalKey<FormState>();
  String otpCode = "";
  FocusNode node;
  final double endValue = 1.0 / 60 * 30;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(minutes: 1));
    node = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((val) {
      FocusScope.of(context).requestFocus(node);
    });
    controller.reverse(from: endValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Verify Mobile Number"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _otpKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20.0, top: 28.0),
                  child: Text(
                    'Enter the 6-digit code that we sent to ${widget.mobileNumber} ',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: PinCodeTextField(
                    hideCharacter: false,
                    highlight: true,
                    highlightColor: Theme.of(context).primaryColor,
                    defaultBorderColor: Colors.black,
                    hasTextBorderColor: Theme.of(context).primaryColor,
                    maxLength: 6,
                    onTextChanged: (text) {
                      setState(() {
                        this.otpCode = text;
                      });
                    },
                    onDone: (text) {
                      this.otpCode = text;
                      print("DONE $text");
                    },
                    pinCodeTextFieldLayoutType:
                        PinCodeTextFieldLayoutType.AUTO_ADJUST_WIDTH,
                    wrapAlignment: WrapAlignment.start,
                    pinBoxDecoration:
                        ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
                    pinTextStyle: TextStyle(fontSize: 20.0),
                    pinTextAnimatedSwitcherTransition:
                        ProvidedPinBoxTextAnimation.scalingTransition,
                    pinTextAnimatedSwitcherDuration:
                        Duration(milliseconds: 300),
                  ),
                ),
                SizedBox(
                  height: 35.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: RoundedButton(
                    "Continue",
                    onPressed: () {
                      if(otpCode!=null&&otpCode.length==6)
                      Navigator.of(context).pushNamed('/');
                    },
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      return Text(
                        "${controller.value!=0?"Resend Code in ${controller.value.toInt()}:${(controller.value * 60 % 60).toInt()}":"You can resend code now"}",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w700),
                      );
                    },
                    child: Container(
                      width: 0.0,
                      height: 0.0,
                    )),
                SizedBox(
                  height: 25.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      return RoundedButton(
                        "Resend code",
                        onPressed: controller.value != 0.0 ? null : resendCode,
                        color: Colors.black,
                      );
                    },
                    child: Container(
                      width: 0.0,
                      height: 0.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
 bool isLoading=false;
  void resendCode() {
    controller.reverse(from: endValue);
    isLoading=true;
    UserController.requestOTP(widget.mobileNumber).then((val){
      if(isLoading){
        Navigator.of(context).pop();
    }
    });
    showDialog(context: context, builder: (context) => AlertDialog(
      content: Container(
        height: 75.0,
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    ),barrierDismissible: false).then((val){
      isLoading=false;
    });
  }

  BoxShadow getShadow() {
    return BoxShadow(
      color: Colors.black.withOpacity(0.8),
      offset: Offset(0.0, 0.0),
      blurRadius: 8.0,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
