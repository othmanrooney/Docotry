import 'package:flutter/cupertino.dart';

class AppScale {
  BuildContext _ctxt;

  AppScale(this._ctxt);

  double get labelDim => scaledWidth(.04);
  double get popupMenuButton => scaledHeight(.065);

  double scaledWidth(double widthScale) {
    return MediaQuery.of(_ctxt).size.width * widthScale;
  }

  double scaledHeight(double heightScale) {
    return MediaQuery.of(_ctxt).size.height * heightScale;
  }
}