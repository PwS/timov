part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: Colors.yellow)));

    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
        backgroundColor: cWhiteColor,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///LOGO
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 70,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.black),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 70, bottom: 40),
                    child: Text(
                      'Welcome Back',
                      style: txtBlackTextStyle.copyWith(fontSize: 20),
                    ),
                  ),
                  TextField(
                    controller: _emailController,
                    onChanged: (text) {
                      setState(() {
                        isEmailValid = EmailValidator.validate(text);
                      });
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Email Address',
                        hintText: 'Email Address'),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: _passwordController,
                    onChanged: (text) {
                      isPasswordValid = text.length >= 6;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Password',
                        hintText: 'Password'),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Text(
                        'Forgot Password ? ',
                        style: txtGreyTextStyle.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Get Now',
                        style: txtPurpleTextStyle.copyWith(fontSize: 12),
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(top: 40, bottom: 30),
                      child: isLoading
                          ? SpinKitFadingCircle(
                              color: cPrimaryColor,
                            )
                          : FloatingActionButton(
                              elevation: 0,
                              child: Icon(
                                Icons.arrow_forward,
                                color: isEmailValid && isPasswordValid
                                    ? cWhiteColor
                                    : Color(0xFFBEBEBE),
                              ),
                              onPressed: isEmailValid && isPasswordValid
                                  ? () async {
                                      setState(() {
                                        isLoading = true;
                                      });

                                      SignInSignUpResult result =
                                          await ServiceAuth.signIn(
                                              _emailController.text,
                                              _passwordController.text);

                                      if (result.user == null) {
                                        setState(() {
                                          isLoading = false;
                                        });

                                        Flushbar(
                                          duration: Duration(seconds: 4),
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                          backgroundColor: Color(0xFFFF5c83),
                                          message: result.message,
                                        )..show(context);
                                      }
                                    }
                                  : null,
                              backgroundColor: isEmailValid && isPasswordValid
                                  ? cPrimaryColor
                                  : Color(0xFFE4E4E4),
                            ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Start Fresh Now? ',
                        style: txtGreyTextStyle.copyWith(
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Sign Up',
                        style: txtPurpleTextStyle,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
