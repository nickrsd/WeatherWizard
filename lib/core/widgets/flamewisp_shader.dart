import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class FlamewispWidget extends StatelessWidget {
  const FlamewispWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ui.FragmentProgram>(
      future: ui.FragmentProgram.fromAsset('shaders/flamewisp.frag'),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        final program = snapshot.data!;
        final shader = program.fragmentShader();
        // Here you'd set any uniforms the shader needs
        return CustomPaint(
          painter: ShaderPainter(shader: shader, time: 50),
          size: const Size(200, 200), // Size of the canvas for the shader
        );
      },
    );
  }
}

class ShaderPainter extends CustomPainter {
  final ui.FragmentShader shader;
  final double time; // Elapsed time in seconds, typically from a timer.

  ShaderPainter({required this.shader, required this.time});

  final stopwatch = Stopwatch()..start();

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    // The shader needs to know the resolution of the painting area
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, time); // Set the time uniform for the shader.

    final paint = Paint()..shader = shader;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
// IntrinsicHeight class
// A widget that sizes its child to the child's intrinsic height.

// This class is useful, for example, when unlimited height is available and you would like a child that would otherwise attempt to expand infinitely to instead size itself to a more reasonable height.

// Animated container
// https://www.youtube.com/watch?v=yI-8QHpGIP4&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=153

// Custom Paint

// transform widget for wizard (but need animated)

// Flutter backdrop filter with Container(color; Colors.black.witeOpacity(0) for visual effect view)

/*
AnimatedList(
  initialItemCount: items.length
  itemBuilder: (context, index, animation) [
    return SlideTransition(
      position: animation.drive(MyTween()),
      child: MyListItem(_myItems[index])
    )
  ]
)

AnimatedBuilder

final animation = Tween(begin: 0, end: 2* pi).animate(controller)
AnimatedBuilder(
  animation: animation,
  child: 
  builder: (context, child) {
    return Transform.rotate(
      angle: animation.value,
      child: Container()
    )
  }
)

screenSize = MediaQuery.of(context).size

Use rich text 

RichText(
  text: TextSpan(
    style: DefaultTextStyle.of(context).style,
    children: <TextSpan>[
      TextSpan(text; 'someaa', style: myBoldStyle),
      TextSpan(text: 'somebb')
    ]
  )
)

TweenAnimationBuilder (avoid animation controller)

TweenAnimationBuilder<Color>(
  duration:
  tween: ColorTween(begin: colors.white, end: colors.orange),
  curve:
  builder: (BuildContext _, Color value, Widget _) {
    return ColorFiltered(
      child: DashWidget(),
      colorFilter: ColorFilter.mode(value, Blend.modulate)
    ); 
  },
  onEnd: 
)

ShaderMask(
  shaderCallback: (bounds) => 
    RadialGradient(
      center: Alignment.topLeft,
      radius: 1.0
      colors: [
        Colors.yellow,
        Colors.deepOrange
      ],
      tileMode: TileMode.mirror
    ).createShader(bounds),
  child: const Text(
    'Burning Text!',
    style: TextStyle(color:Colors.white)
  )
)

transitions extend AnimatedWidget

class ButtonTransition extends AnimatedWidget {
  const ButtonTransition({width}) : super(listenable: width)

  Animation<double> get width => listenable

  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () => print("hello"),
      child: Text("click me")
      border: BorderSide(width: width)
    )
  }
}

InteractiveViewer for pan/zoom

Cluster of "find me" or "let him use it" 

Location package

Expansion Panel for accordian 

Connectivity
var result = await Connectivity().checkConnectivity
switch (result) {
  // is a wrapper around platform specific code
}

connectivity.onConnectivityChanged.listen(_updateConnectionState)
StreamSubscription<ConnectivityResult _stream>

Try using documents diroecty via pathProvider

*/