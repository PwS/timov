import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:timov/services/service.dart';
import 'package:timov/state_management/page_bloc.dart';
import 'package:timov/state_management/state_management.dart';
import 'package:timov/utils/theme/theme.dart';
import 'package:timov/utils/utils.dart';

part 'wrapper.dart';

part 'splash_page.dart';

part 'sign_in_page.dart';

part 'sign_up_page.dart';

part 'main_page.dart';
