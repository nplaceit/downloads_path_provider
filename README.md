# downloads_path_provider

Flutter plugin to get the download directory for Android.

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

For help on editing plugin code, view the [documentation](https://flutter.io/developing-packages/#edit-plugin-package).

## Usage

To use this plugin, add [downloads_path_provider](https://pub.dartlang.org/packages/downloads_path_provider#-installing-tab-) as a dependency in your pubspec.yaml file.

## Example
```dart
import 'package:downloads_path_provider/downloads_path_provider.dart';  

Future<Directory> downloadsDirectory = DownloadsPathProvider.downloadsDirectory;
```