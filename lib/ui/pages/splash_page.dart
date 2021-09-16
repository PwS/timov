part of 'pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///Logo
              Container(
                height: 136,
                width: 130,
                decoration: BoxDecoration(color: Colors.black),
              ),
              Container(
                margin: EdgeInsets.only(top: 70, bottom: 16),
                child: Text(
                  'New Experience',
                  style: txtBlackTextStyle.copyWith(fontSize: 20),
                ),
              ),
              Text(
                'Watch a Movie',
                style: txtGreyTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
              Container(
                margin: EdgeInsets.only(top: 70, bottom: 19),
                width: 250,
                height: 46,
                child: ElevatedButton(
                  child: Text(
                    'Get Started',
                    style: txtWhiteTextStyle.copyWith(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(primary: cPrimaryColor),
                  onPressed: () {},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style:
                        txtGreyTextStyle.copyWith(fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                      onPressed: () {
                        context.bloc<PageBloc>().add(GoToLoginPage());
                      },
                      child: Text('Sign In', style: txtPurpleTextStyle))
                ],
              )
            ],
          )),
    );
  }
}
