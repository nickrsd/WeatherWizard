import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WeatherDashboard extends StatelessWidget {
  const WeatherDashboard({super.key});

  // Title for the weather page, stack of labels with values

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(children: [
          Container(
            constraints: const BoxConstraints(minHeight: 150, maxHeight: 320),
            child: ClipRRect(
                child: Align(
              widthFactor: 2.0,
              heightFactor: 2.0,
              child: Image.asset(
                "assets/images/rainy.gif",
                fit: BoxFit.cover,
                scale: 0.1,
              ),
            )),
          ),
        ]
            // const SizedBox(height: 80),
            ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.antiAlias,
              children: [
                SizedBox(
                  height: 120,
                  child: ClipRect(
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset("assets/images/stone_wall_light.png",
                        fit: BoxFit.fill),
                  ),
                ),
                Image.asset("assets/images/prison_room.jpg",
                    fit: BoxFit.fitHeight),
                Positioned(
                  top: 55,
                  left: 125,
                  child: SizedBox(
                    height: 120,
                    child: Image.asset("assets/images/oldman-all.gif",
                        fit: BoxFit.fitHeight),
                  ),
                )
              ],
            )
          ],
        ),
        const SizedBox(height: 20),
      ],
    ));
  }
}
