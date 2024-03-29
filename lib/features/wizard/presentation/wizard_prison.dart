import 'package:flutter/widgets.dart';

class WizardPrison extends StatelessWidget {
  const WizardPrison({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
            Image.asset("assets/images/prison_room.jpg", fit: BoxFit.fitHeight),
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
    );
  }
}
