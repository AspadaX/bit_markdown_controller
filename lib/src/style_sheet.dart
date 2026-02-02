import 'package:flutter/material.dart';

class MarkdownStyleSheet {
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;
  final TextStyle h5;
  final TextStyle h6;
  final TextStyle p;
  final TextStyle code;
  final TextStyle codeBlock;
  final TextStyle blockQuote;
  final TextStyle link;
  final TextStyle listBullet;
  final TextStyle tableHead;
  final TextStyle tableBody;

  const MarkdownStyleSheet({
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.h5,
    required this.h6,
    required this.p,
    required this.code,
    required this.codeBlock,
    required this.blockQuote,
    required this.link,
    required this.listBullet,
    required this.tableHead,
    required this.tableBody,
  });

  factory MarkdownStyleSheet.fromTheme(ThemeData theme) {
    return MarkdownStyleSheet(
      h1: theme.textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold) ??
          const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      h2: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold) ??
          const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      h3: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold) ??
          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      h4: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold) ??
          const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      h5: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold) ??
          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      h6: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold) ??
          const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      p: theme.textTheme.bodyMedium ?? const TextStyle(fontSize: 16),
      code: theme.textTheme.bodyMedium?.copyWith(
            fontFamily: 'Courier',
            backgroundColor: theme.colorScheme.surfaceContainerHighest,
          ) ??
          const TextStyle(
              fontFamily: 'Courier', backgroundColor: Color(0xFFEEEEEE)),
      codeBlock: theme.textTheme.bodyMedium?.copyWith(
            fontFamily: 'Courier',
            fontSize: 14,
          ) ??
          const TextStyle(fontFamily: 'Courier', fontSize: 14),
      blockQuote: theme.textTheme.bodyMedium?.copyWith(
            fontStyle: FontStyle.italic,
            color: theme.textTheme.bodyMedium?.color?.withOpacity(0.8),
          ) ??
          const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
      link: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.primary,
            decoration: TextDecoration.underline,
          ) ??
          const TextStyle(
              color: Colors.blue, decoration: TextDecoration.underline),
      listBullet: theme.textTheme.bodyMedium ?? const TextStyle(fontSize: 16),
      tableHead: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold) ??
          const TextStyle(fontWeight: FontWeight.bold),
      tableBody: theme.textTheme.bodyMedium ?? const TextStyle(fontSize: 16),
    );
  }
}
