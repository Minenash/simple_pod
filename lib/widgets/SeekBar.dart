import 'package:flutter/material.dart';

class SeekableProgressBar extends StatefulWidget {

  final bool Function(double value) onChange;

  final double progress, width;

  final Color activeColor;
  final Color inactiveColor;

  SeekableProgressBar({Key key,
    this.onChange,
    this.progress = 0,
    this.width,
    this.activeColor = Colors.white,
    this.inactiveColor = const Color(0x33FFFFFF),
  }) : assert(progress >= 0 && progress <= 1),
       super(key: key);

  @override
  _SeekableProgressBarState createState() => _SeekableProgressBarState(
      onChange: onChange,
      progress: progress,
      width: width,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
  );
}

class _SeekableProgressBarState extends State<SeekableProgressBar> {

  double progress;

  final double width;

  final bool Function(double value) onChange;

  final Color activeColor, inactiveColor;

  _SeekableProgressBarState({
    this.onChange, this.progress, this.width,
    this.activeColor, this.inactiveColor
  });

  bool isSeeking = false;
  double val = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Slider(
        value: isSeeking? val : progress,
        activeColor:   activeColor,
        inactiveColor: inactiveColor,
        onChanged:     (v) { setState(() { val = v; }); },
        onChangeStart: (_) { setState(() { isSeeking = true; }); },
        onChangeEnd:   (v) { setState(() {
          isSeeking = false;
          if (onChange != null && onChange(v))
              progress = v;
        }); },
      ),
    );
  }
}