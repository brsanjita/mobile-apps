import 'package:common/models/user/mobile_number.dart';
import 'package:common/widgets/rounded_button.dart';
import 'package:customer/screens/login/country_selection.dart';
import 'package:customer/screens/login/signup_email.dart';
import 'package:flutter/material.dart';

class MobileLoginScreen extends StatefulWidget {
  final Function(String, String) onSubmitted;

  const MobileLoginScreen({Key key, this.onSubmitted}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  String _currentCode;
  String _contactNo;
  GlobalKey<FormState> _phoneNoKey = GlobalKey<FormState>();
  FocusNode node = FocusNode();

  @override
  void initState() {
    super.initState();
    _currentCode = '+91';
    WidgetsBinding.instance.addPostFrameCallback((val) {
      // node.requestFocus();
      FocusScope.of(context).requestFocus(node);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Enter Mobile Number"),
      ),
      body: Form(
        key: _phoneNoKey,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
//                  margin: EdgeInsets.only(top:20.0),
                    padding:
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
//
                        RaisedButton(
                          onPressed: () async {
                            String result = await Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CountrySelectionScreen()));
                            if (result != null && mounted) {
                              setState(() {
                                _currentCode = result;
                              });
                            }
                          },
                          elevation: 0.0,
                          color: Colors.white,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                _currentCode,
                                style: TextStyle(fontSize: 20.0),
                              ),
                              Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              autofocus: true,
                              focusNode: node,
                              style: TextStyle(fontSize: 20.0),
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500),
                                hintText: "Mobile Number",
                                // contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                              ),
                              validator: (String phoneNo) {
                                this._contactNo = phoneNo;
                                if (phoneNo == null || phoneNo.isEmpty) {
                                  return "Phone No is required";
                                } else if (phoneNo.length != 10) {
                                  return "Invalid Number";
                                }
                                return null;
                              },
                              onSaved: (String phoneNo) {
                                this._contactNo = phoneNo;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  RoundedButton(
                    "Continue",
                    onPressed: () {
                      if (_phoneNoKey.currentState.validate())
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpScreen(
                                  mobileNumber: MobileNumber(
                                      countryCode: _currentCode.substring(1),
                                      number: _contactNo),
                                )));
                    },
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget goButton() {
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .73,
          right: 50.0,
          bottom: 10.0),
      alignment: Alignment.bottomRight,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            getShadow(),
          ]),
      child: IconButton(
        icon: ImageIcon(
          AssetImage('assets/signup/go.png'),
          size: 30.0,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
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
    node.unfocus();
    node.dispose();
    super.dispose();
  }
}
