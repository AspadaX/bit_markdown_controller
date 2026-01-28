import 'package:editor/bit_markdown/editor_parser.dart';
import 'package:editor/bit_markdown/editor_renderer.dart';
import 'package:flutter/cupertino.dart';

class MarkdownTextEditingController extends TextEditingController {
  MarkdownEditorParser parser;

  MarkdownTextEditingController(this.parser);

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    return TextSpan(
      style:
          style ??
          const TextStyle(
            fontSize: 16,
            color: CupertinoColors.darkBackgroundGray,
          ),
      children: MarkdownEditorRenderer.buildInlineSpans(text, parser),
    );
  }
}
