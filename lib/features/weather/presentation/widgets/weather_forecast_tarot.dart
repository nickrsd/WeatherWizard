import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_wizard/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_wizard/features/weather/presentation/bloc/weather_state.dart';

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      /// status particles to fill this space
      // const Row(
      //   mainAxisSize: MainAxisSize.max,
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   children: <Widget>
      // ),
      ListView(
        children: <Widget>[
          BlocBuilder<WeatherBloc, WeatherState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              return Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/pixel_card.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: const Column(children: [
                    Text('title'),
                    Text('subtitle'),
                    Text('third')
                  ]));
            },
          ),
        ],
      ),
    ]);
  }
}
