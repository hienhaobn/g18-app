
import 'package:app/base_hieu/colors.dart';
import 'package:app/base_hieu/images.dart';
import 'package:app/base_hieu/styles.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class LoadingApp extends StatefulWidget {
  const LoadingApp({
    Key? key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1400),
    this.controller,
  })  : assert(
            !(itemBuilder is IndexedWidgetBuilder && color is Color) &&
                !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color'),
        super(key: key);

  final Color? color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  _LoadingAppState createState() => _LoadingAppState();
}

class _LoadingAppState extends State<LoadingApp>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(vsync: this, duration: widget.duration))
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size(widget.size * 2, widget.size),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(3, (i) {
            return ScaleTransition(
              scale: DelayTween(begin: 0.0, end: 1.0, delay: i * .2)
                  .animate(_controller),
              child: SizedBox.fromSize(
                  size: Size.square(widget.size * 0.5), child: _itemBuilder(i)),
            );
          }),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(
          decoration:
              BoxDecoration(color: widget.color, shape: BoxShape.circle));
}

class DelayTween extends Tween<double> {
  DelayTween({double? begin, double? end, required this.delay})
      : super(begin: begin, end: end);

  final double delay;

  @override
  double lerp(double t) =>
      super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}

class LoadingAppFlight extends StatelessWidget {
  final String? text;
  const LoadingAppFlight({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: text != null
            ? Container(
                padding: EdgeInsets.all(16),
                height: double.infinity,
                color: AppColors.bgDayPrice.withOpacity(0.8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImagePath.loading_g18,
                      width: 120,
                      height: 120,
                    ),
                    Text(
                      "$text",
                      textAlign: TextAlign.start,
                      style: AppStyles.normalStyleAuto(
                          fontWeight: FontWeight.w500, color: AppColors.red),
                    )
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(40.0),
                child: Image.asset(
                  ImagePath.loading_g18,
                  width: 120,
                  height: 120,
                ),
              ));
  }
}
