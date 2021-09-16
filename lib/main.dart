import 'package:flutter/material.dart';
import 'package:timov/services/service.dart';
import 'package:timov/state_management/state_management.dart';
import 'package:timov/ui/pages/pages.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: ServiceAuth.userStream,
      child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => PageBloc()),
            BlocProvider(create: (_) => UserBloc()),
            BlocProvider(create: (_) => ThemeBloc())
          ],
          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (_, themeState) => MaterialApp(
                theme: themeState.themeData,
                debugShowCheckedModeBanner: false,
                home: Wrapper()),
          )),
    );
  }
}
