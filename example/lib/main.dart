import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:downloads_path_provider/downloads_path_provider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Directory _downloadsDirectory;

  @override
  void initState() {
    super.initState();
    initDownloadsDirectoryState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initDownloadsDirectoryState() async {
    Directory downloadsDirectory;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
    } on PlatformException {
      print('Could not get the downloads directory');
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _downloadsDirectory = downloadsDirectory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Downloads Directiry example app'),
        ),
        body: new Center(
          child: new Text(
            _downloadsDirectory != null
                ? 'Downloads directory: ${_downloadsDirectory.path}\n'
                : 'Could not get the downloads directory',
          ),
        ),
      ),
    );
  }
}
