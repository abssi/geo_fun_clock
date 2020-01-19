import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

enum _Palette {
  color1,
  color2,
  color3,
  color4,
}

final _lightTheme = {
  _Palette.color1: Color(0xffc73866),
  _Palette.color2: Color(0xfffe676e),
  _Palette.color3: Color(0xfff9b923),
  _Palette.color4: Color(0xff2fa94f),
};

final _darkTheme = {
  _Palette.color1: Color(0xff1f2f98),
  _Palette.color2: Color(0xff73bb03),
  _Palette.color3: Color(0xffff1f0f),
  _Palette.color4: Color(0xffffe5d8),
};

class DrawerUtil {
  bool _isBright;
  Map<_Palette, Color> _colors;

  DrawerUtil(this._isBright) {
    _colors = _isBright ? _lightTheme : _darkTheme;
  }

  drawZero(Canvas canvas, Paint paint, Size size, double pulse) {
    paint.color = _colors[_Palette.color4];
    var center = Offset(size.width / 2, size.height - (size.width / 2));
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(center, pulse * size.width * 0.2, paint);

    paint.color = _colors[_Palette.color4];
    var center2 = Offset(size.width / 2, size.height - (size.width / 2));
    paint.style = PaintingStyle.stroke;
    canvas.drawCircle(center2, pulse * size.width * 0.45, paint);
  }

  drawOne(Canvas canvas, Paint paint, Size size, double pulse) {
    var rect =
        Rect.fromLTWH(size.width / 2, 0, size.width * 0.2, pulse * size.height);
    paint.color = _colors[_Palette.color2];
    paint.style = PaintingStyle.fill;
    canvas.drawRect(rect, paint);

    paint.color = _colors[_Palette.color2];
    var center = Offset(size.width * 0.4, size.height * 0.1);
    paint.style = PaintingStyle.stroke;
    canvas.drawCircle(center, pulse * size.width * 0.1, paint);
  }

  drawTwo(Canvas canvas, Paint paint, Size size, double pulse) {
    var rect = Rect.fromLTWH(
        0, size.height * 0.9, pulse * size.width, size.height * 0.1);
    paint.color = _colors[_Palette.color3];
    paint.style = PaintingStyle.fill;
    canvas.drawRect(rect, paint);

    paint.color = _colors[_Palette.color3];
    paint.style = PaintingStyle.stroke;
    var circlerect = Rect.fromLTWH(0, size.height * 0.2, size.width, size.height * 0.7);
    canvas.drawArc(circlerect, pi * 1.2, pi * 1.5 * pulse, false, paint);
  }

  drawThree(Canvas canvas, Paint paint, Size size, double pulse) {
    paint.color = _colors[_Palette.color2];
    paint.style = PaintingStyle.fill;
    var circlerect = Offset(size.width * 0.5, 0) & size / 2;
    canvas.drawArc(circlerect, pi * 3 / 2, pi * pulse, true, paint);

    paint.color = _colors[_Palette.color2];
    paint.style = PaintingStyle.fill;
    var circlerect2 = Offset(size.width * 0.5, size.height * 0.5) & size / 2;
    canvas.drawArc(circlerect2, pi * 3 / 2, pi * pulse, true, paint);

    paint.color = _colors[_Palette.color2];
    var center = Offset(size.width / 2, size.height * 0.1);
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(center, pulse * size.width * 0.15, paint);

    paint.color = _colors[_Palette.color2];
    var center2 = Offset(size.width / 2, size.height * 0.9);
    paint.style = PaintingStyle.stroke;
    canvas.drawCircle(center2, pulse * size.width * 0.15, paint);
  }

  drawFour(Canvas canvas, Paint paint, Size size, double pulse) {
    var rect =
        Rect.fromLTWH(size.width / 2, 0, size.width / 3, pulse * size.height);
    paint.color = _colors[_Palette.color3];
    paint.style = PaintingStyle.stroke;
    canvas.drawRect(rect, paint);

    var rect2 = Rect.fromLTWH(0, 5, size.width / 3, pulse * size.height / 2);
    paint.color = _colors[_Palette.color3];
    paint.style = PaintingStyle.fill;
    canvas.drawRect(rect2, paint);
  }

  drawFive(Canvas canvas, Paint paint, Size size, double pulse) {
    var rect = Rect.fromLTWH(0, 0, pulse * size.width, size.height * 0.1);
    paint.color = _colors[_Palette.color4];
    paint.style = PaintingStyle.fill;
    canvas.drawRect(rect, paint);

    paint.color = _colors[_Palette.color4];
    paint.style = PaintingStyle.stroke;
    var circlerect =
        Rect.fromLTWH(0, size.height * 0.2, size.width, size.height * 0.8);
    canvas.drawArc(circlerect, pi * 3 / 2, pulse * pi, false, paint);

    /*paint.color = _colors[_Palette.color3];
    var center = Offset(size.width / 2, size.height*0.2);
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(center, pulse * size.width *0.15, paint);
    */
  }

  drawSix(Canvas canvas, Paint paint, Size size, double pulse) {
    paint.color = _colors[_Palette.color1];
    var center = Offset(size.width / 2, size.height - (size.width / 2));
    paint.style = PaintingStyle.stroke;
    canvas.drawCircle(center, pulse * size.width / 2, paint);

    var rect = Rect.fromLTWH(0, 0, size.width / 3, pulse * size.height * 0.7);
    paint.color = _colors[_Palette.color1];
    paint.style = PaintingStyle.fill;
    canvas.drawRect(rect, paint);
  }

  drawSeven(Canvas canvas, Paint paint, Size size, double pulse) {
    var rect = Rect.fromLTWH(
        size.width * 2 / 3, 0, size.width / 3, pulse * size.height);
    paint.color = _colors[_Palette.color2];
    paint.style = PaintingStyle.stroke;
    canvas.drawRect(rect, paint);

    var rect2 = Rect.fromLTWH(0, 0, pulse * size.width, size.height / 4);
    paint.color = _colors[_Palette.color2];
    paint.style = PaintingStyle.fill;
    canvas.drawRect(rect2, paint);
  }

  drawEight(Canvas canvas, Paint paint, Size size, double pulse) {
    paint.color = _colors[_Palette.color3];
    var center2 = Offset(size.width / 2, size.height / 4);
    paint.style = PaintingStyle.stroke;
    canvas.drawCircle(center2, pulse * size.width * 0.3, paint);

    paint.color = _colors[_Palette.color3];
    var center = Offset(size.width / 2, size.height - (size.width / 2));
    paint.style = PaintingStyle.stroke;
    canvas.drawCircle(center, pulse * size.width * 0.5, paint);
  }

  drawNine(Canvas canvas, Paint paint, Size size, double pulse) {
    paint.color = _colors[_Palette.color4];

    var center = Offset(size.width / 2, size.width / 2);
    paint.style = PaintingStyle.stroke;
    canvas.drawCircle(center, pulse * size.width *0.4, paint);

    var rect = Rect.fromLTWH(
        size.width * 2 / 3, 0, size.width / 3, pulse * size.height);
    paint.color = _colors[_Palette.color4];
    paint.style = PaintingStyle.fill;
    canvas.drawRect(rect, paint);
  }
}
