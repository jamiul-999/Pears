import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pears/pages/ConversationPageSlide.dart';
import 'package:pears/repositories/AuthenticationRepository.dart';
import 'package:pears/repositories/StorageRepository.dart';
import 'package:pears/repositories/UserDataRepository.dart';
import 'config/Palette.dart';
import 'pages/RegisterPage.dart';
import 'package:pears/blocs/bloc/authentication_bloc.dart';
import 'package:pears/blocs/bloc/authentication_event.dart';
import 'package:pears/blocs/bloc/authentication_state.dart';

void main() {
  final AuthenticationRepository authRepository = AuthenticationRepository();
  final UserDataRepository userDataRepository = UserDataRepository();
  final StorageRepository storageRepository = StorageRepository();
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(
          authenticationRepository: authRepository,
          userDataRepository: userDataRepository,
          storageRepository: storageRepository)
        ..add(AppLaunched()),
      child: Pears(
        authenticationRepository: authRepository,
        userDataRepository: userDataRepository,
        storageRepository: storageRepository,
      ),
    ),
  );
}

class Pears extends StatelessWidget {
  // This widget is the root of your application.
  final AuthenticationRepository authenticationRepository;
  final UserDataRepository userDataRepository;
  final StorageRepository storageRepository;

  Pears(
      {Key? key,
      required this.authenticationRepository,
      required this.userDataRepository,
      required this.storageRepository})
      : //assert(authenticationRepository != null),
        //assert(userDataRepository != null),
        //assert(storageRepository != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pears',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Palette.primaryColor,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is UnAuthenticated) {
            return RegisterPage();
          } else if (state is ProfileUpdated) {
            return ConversationPageSlide();
          } else {
            return RegisterPage();
          }
        },
      ),
    );
  }
}
