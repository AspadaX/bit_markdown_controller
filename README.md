# bit_markdown_controller

A performant WYSIWYG markdown controller for Flutter, designed to render markdown in real-time within a `TextField`.

This package was created to support [OpenNote](https://github.com/AspadaX/opennote), an open source notebook app incorporating AI tech stacks. The package is heavily modified from [bit_markdown](https://github.com/BitCraftProduction/bit_markdown).

## Features

- **Real-time Rendering**: Parses and renders markdown syntax as you type.
- **Rich Markdown Support**:
  - **Headings**: `# H1` to `###### H6`
  - **Formatting**: **Bold** (`**` or `__`), *Italic* (`*` or `_`), ~~Strikethrough~~ (`~~`)
  - **Lists**: Unordered (`- `) and Ordered (`1. `)
  - **Block Quotes**: `> Quote`
  - **Code Blocks**: Fenced code blocks with language support
    ```dart
    void main() {
      print('Hello');
    }
    ```
  - **Math**: 
    - Block Math: `$$ ... $$`
    - Inline Math support (via `flutter_math_fork`)
  - **Tables**: `| cell | cell |`
  - **Links**: `[text](url)` with tap support
  - **Images**: `![alt](url)`
  - **Horizontal Rules**: `---` or `***`

## Getting Started

### Installation

Add `bit_markdown_controller` to your `pubspec.yaml`:

```yaml
dependencies:
  bit_markdown_controller:
    git:
      url: https://github.com/AspadaX/bit_markdown_controller.git
```

### Usage

1. Import the package:

```dart
import 'package:bit_markdown_controller/bit_markdown_controller.dart';
// parser is exported in the main package file now, so explicit import might not be needed if using bit_markdown_controller.dart
// but typically:
// import 'package:bit_markdown_controller/src/parser.dart'; 
```

2. Initialize the `MarkdownTextEditingController`:

```dart
class MyEditor extends StatefulWidget {
  @override
  _MyEditorState createState() => _MyEditorState();
}

class _MyEditorState extends State<MyEditor> {
  late MarkdownTextEditingController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize with a default theme or basic configuration
    _controller = MarkdownTextEditingController(
      parser: MarkdownEditorParser(),
      styleSheet: MarkdownStyleSheet.fromTheme(ThemeData.light()),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Update the stylesheet when the theme changes
    _controller.updateStyleSheet(MarkdownStyleSheet.fromTheme(Theme.of(context)));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _controller,
          maxLines: null, // Allow multiline
          decoration: InputDecoration(
            hintText: 'Type your markdown here...',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
