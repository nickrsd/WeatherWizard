import 'package:bloc_timer/bloc_timer.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedWizard extends StatelessWidget {
  const AnimatedWizard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerBloc(ticker: const Ticker()),
      child: SizedBox(
        height: 120,
        child:
            Image.asset("assets/images/oldman-all.gif", fit: BoxFit.fitHeight),
      ),
    );
  }
}
