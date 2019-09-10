import 'package:common/models/user/user.dart';
import 'package:common/utils/trusted_http.dart';
import 'package:common/widgets/custom_input_widget.dart';
import 'package:common/widgets/login/email_login_button.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState>scaffoldKey=GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
      bottomNavigationBar: Mutation(
        options: MutationOptions(
          document: createQuery(),
        ),
        builder: (RunMutation login, QueryResult result) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: EmailLoginButton("Login",onTap: (){
              setState(() {
                isLoading=true;
                print("Loading $isLoading");
              });
              login({});
            },isLoading: isLoading,),
          );
        },
        onCompleted: (data)async{
          print("Data $data");
          setState(() {
            isLoading=false;
          });
          bool success=false;
          if(data!=null){
            if(data["loginWithCredentials"]!=null){
              var credentials=data["loginWithCredentials"];
              if(credentials["token"]!=null){
                print("Token ${credentials["token"]}");
                String token=credentials["token"];
                await TrustedHttp.initTrustedClient();
                await TrustedHttp.saveToken(token);
                success=true;
                Navigator.of(context).pushNamed('/');
              }
            }
          }
          if(!success){
            scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Either email or password is wrong")));
          }
        },
      ),
    );
  }

  bool isLoading=false;
  String createQuery() {
    return '''
       mutation loginWithCredentials{
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
