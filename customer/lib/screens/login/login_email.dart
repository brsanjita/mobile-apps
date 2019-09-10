import 'package:common/models/user/user.dart';
import 'package:common/widgets/rounded_button.dart';
import 'package:customer/utils/user_controller.dart';
import 'package:customer/widgets/custom_input_widget.dart';
import 'package:customer/widgets/login/gender_widget.dart';
import 'package:customer/widgets/options_dialog.dart';
import 'package:flutter/material.dart';
import 'package:customer/widgets/login/tap_input_widget.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class LoginEmailScreen extends StatefulWidget {
  @override
  _LoginEmailScreenState createState() => _LoginEmailScreenState();
}

class _LoginEmailScreenState extends State<LoginEmailScreen> {
  int orderCount = 2;
  String serviceType;
  String countryCode;
  bool agreed = false;
  String email;
  String password;
  User user = User.named(gender: "Male");
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Account Details",
              ),
              centerTitle: true,
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate.fixed([
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                  child: Center(
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          CustomInputWidget(
                            label: "Email",
                            onSubmitted: (val) {
                              email = val;
                            },
                            validator: (val) {
                              return val == '' ? "can not be empty" : null;
                            },
                          ),
                          CustomInputWidget(
                            label: "Password",
                            obscure: true,
                            onSubmitted: (val) {
                              password = val;
                            },
                            validator: (val) {
                              return val == '' ? "can not be empty" : null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]))
        ],
      ),
      bottomNavigationBar:Mutation(
        options: MutationOptions(document: createQuery(),),
        builder: (RunMutation login, QueryResult result){

           return Container(child: Text("${result.data}"),);
        },
      ),
    );
  }

  String createQuery(){
    return '''
       mutation{
          loginWithCredentials(email:"$email",password:"$password"){
            token
          }
        }
    ''';
  }

  Widget buildInputWidget(
      String label,
      Function(String) onSubmitted,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextField(
        onChanged: onSubmitted,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          hasFloatingPlaceholder: true,
        ),
      ),
    );
  }
}
