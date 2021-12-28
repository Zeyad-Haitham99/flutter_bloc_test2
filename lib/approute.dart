import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test2/UI/screens/charachterdetailsscree.dart';
import 'package:flutter_bloc_test2/UI/screens/charachters_screen.dart';
import 'package:flutter_bloc_test2/bussiness_layer/cubit/breakingbad_cubit.dart';
import 'package:flutter_bloc_test2/constants/strings.dart';
import 'package:flutter_bloc_test2/data/repositery/charachters_repositery.dart';

import 'data/web_services/charachters_response.dart';

class AppRoute {
  late CharachterRepositery charachterRepositery;
  late BreakingbadCubit breakingbadCubit;
  AppRoute() {
    charachterRepositery = CharachterRepositery(CharachterResponse());
    breakingbadCubit = BreakingbadCubit(charachterRepositery);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterscreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                BreakingbadCubit(charachterRepositery),
                child: CharachtersScreen(),
          ),
          
        );
      case charachterDetailesScreen:
        return MaterialPageRoute(builder: (_) => CharachterDetailsScreen());
    }
  }
}
