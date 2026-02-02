import 'package:bit_markdown_controller/src/renderer.dart';
import 'package:bit_markdown_controller/src/style_sheet.dart';
import 'package:flutter/cupertino.dart';

import 'parser.dart';

class MarkdownTextEditingController extends TextEditingController {
  MarkdownStyleSheet styleSheet;
  MarkdownEditorParser parser;
  List<InlineSpan> processedInlineTextSpans = [];
  String lastText = '';
  TextSpan lastProcessedTextSpan = TextSpan();
  List<InlineSpan> lastProcessedInlineTextSpans = [];
  bool isRebuild = false;

  MarkdownTextEditingController({
    required this.parser,
    required this.styleSheet,
  });
  
  /// Cases
  /// 
  /// #| Some markdown (raw, cursor at 1)
  ///  |Some markdown (rendered, cursor at 0)
  /// 
  /// # Some markdow|n (raw, cursor at 14)
  ///  Some markdow|n (rendered, cursor at 13)
  /// 
  /// *italics*| (raw, cursor at 8)
  /// italics| (raw, cursor at 6)
  
  @override
  // TODO: implement value
  TextEditingValue get value => super.value;
  
  @override
  set value(TextEditingValue newValue) {
    // TODO: implement value
    super.value = newValue;
  }

  Future<void> _parseAndPrepareMarkdownForRendering() async {
    processedInlineTextSpans = await MarkdownEditorRenderer.buildInlineSpans(
      text,
      parser,
      styleSheet,
    );
    isRebuild = true;
    notifyListeners();
  }

  void updateStyleSheet(MarkdownStyleSheet newStyleSheet) {
    styleSheet = newStyleSheet;
    _parseAndPrepareMarkdownForRendering();
  }

  TextSpan _rebuild(TextStyle? style) {
    // Update the cache
    lastProcessedInlineTextSpans = processedInlineTextSpans;
    lastProcessedTextSpan = TextSpan(
      style: style ?? styleSheet.p,
      children: processedInlineTextSpans,
    );

    isRebuild = false;
    return lastProcessedTextSpan;
  }

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    if (isRebuild) {
      return _rebuild(style);
    }

    // We need to determine whether the spans are processed before updating it
    if (text == lastText) {
      return lastProcessedTextSpan;
    }

    // Start processing the text
    _parseAndPrepareMarkdownForRendering();

    lastText = text;
    return lastProcessedTextSpan;
  }
}
