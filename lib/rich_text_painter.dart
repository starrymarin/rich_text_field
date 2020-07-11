import 'dart:ui' as ui show TextHeightBehavior;

import 'package:flutter/painting.dart';

typedef TextPainterMarkNeedLayoutChangedListener = void Function(bool needsLayout);

class RichTextPainter extends TextPainter {
  RichTextPainter({
    InlineSpan text,
    TextAlign textAlign = TextAlign.start,
    TextDirection textDirection,
    double textScaleFactor = 1.0,
    int maxLines,
    String ellipsis,
    Locale locale,
    StrutStyle strutStyle,
    TextWidthBasis textWidthBasis = TextWidthBasis.parent,
    ui.TextHeightBehavior textHeightBehavior,
  }) : super(
    text: text,
    textAlign: textAlign,
    textDirection: textDirection,
    textScaleFactor: textScaleFactor,
    maxLines: maxLines,
    ellipsis: ellipsis,
    locale: locale,
    strutStyle: strutStyle,
    textWidthBasis: textWidthBasis,
    textHeightBehavior: textHeightBehavior
  );

  TextPainterMarkNeedLayoutChangedListener _needLayoutChangedListener;

  set needsLayoutChangedListener(TextPainterMarkNeedLayoutChangedListener listener) {
    _needLayoutChangedListener = listener;
  }

  @override
  void markNeedsLayout() {
    super.markNeedsLayout();
    if (_needLayoutChangedListener != null) {
      _needLayoutChangedListener.call(true);
    }
  }

  @override
  void layout({double minWidth = 0.0, double maxWidth = double.infinity}) {
    // TODO: implement layout
    super.layout(minWidth: minWidth, maxWidth: maxWidth);
    if (_needLayoutChangedListener != null) {
      _needLayoutChangedListener.call(false);
    }
  }
}