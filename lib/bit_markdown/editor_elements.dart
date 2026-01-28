import 'package:editor/bit_markdown/editor_renderer.dart';
import 'package:editor/bit_markdown/elements.dart';
import 'package:flutter/material.dart';

class EditorTextElement extends MarkdownElement {
  final String text;
  final TextStyle? style;

  EditorTextElement(this.text, {this.style});

  @override
  dynamic buildWidget() => MarkdownEditorRenderer.renderText(text, style);
}

class EditorHeadingElement extends MarkdownElement {
  final String text;
  final int level;

  EditorHeadingElement(this.text, this.level);

  @override
  dynamic buildWidget() => MarkdownEditorRenderer.renderHeading(text, level);
}

class EditorBlockQuoteElement extends MarkdownElement {
  final String text;

  EditorBlockQuoteElement(this.text);

  @override
  dynamic buildWidget() => MarkdownEditorRenderer.renderBlockQuote(text);
}

class EditorListItemElement extends MarkdownElement {
  final String text;
  final bool ordered;

  EditorListItemElement(this.text, {this.ordered = false});

  @override
  dynamic buildWidget() => MarkdownEditorRenderer.renderListItem(text, ordered);
}

class EditorHorizontalLine extends MarkdownElement {
  @override
  dynamic buildWidget() => MarkdownEditorRenderer.renderHorizontalLine();
}

class EditorTableRowElement extends MarkdownElement {
  final List<String> cells;
  EditorTableRowElement(this.cells);

  @override
  dynamic buildWidget() => MarkdownEditorRenderer.renderTableRow(cells);
}

class EditorCodeBlockElement extends MarkdownElement {
  final String code;
  final String? language;
  EditorCodeBlockElement(this.code, {this.language});

  @override
  dynamic buildWidget() =>
      MarkdownEditorRenderer.renderCodeBlock(code, language: language);
}

class EditorMathBlockElement extends MarkdownElement {
  final String expression;
  EditorMathBlockElement(this.expression);

  @override
  dynamic buildWidget() => MarkdownEditorRenderer.renderMathBlock(expression);
}

class EditorMathInlineElement extends MarkdownElement {
  final String expression;
  EditorMathInlineElement(this.expression);

  @override
  dynamic buildWidget() => MarkdownEditorRenderer.renderMathInline(expression);
}

class EditorImageElement extends MarkdownElement {
  final String alt;
  final String url;
  final String? title;

  EditorImageElement(this.alt, this.url, {this.title});
  @override
  dynamic buildWidget() =>
      MarkdownEditorRenderer.renderImage(url, altText: alt, title: title);
}

class EditorLinkElement extends MarkdownElement {
  final String text;
  final String url;
  final String? title;
  void Function(String url)? onTap;

  EditorLinkElement(this.text, this.url, {this.title, this.onTap});

  @override
  dynamic buildWidget() =>
      MarkdownEditorRenderer.renderLink(text, url, title: title, onTap: onTap);
}
