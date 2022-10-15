import 'dart:io';

import 'package:download_assets/download_assets.dart';
import 'package:flutter/material.dart';

class DownloadTest extends StatefulWidget {
  static const routeName = '/download';

  const DownloadTest({Key? key}) : super(key: key);
  @override
  _DownloadTestState createState() => _DownloadTestState();
}

class _DownloadTestState extends State<DownloadTest> {
  DownloadAssetsController downloadAssetsController =
      DownloadAssetsController();
  String message = "Press the download button to start the download";
  bool downloaded = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future _init() async {
    await downloadAssetsController.init();
    downloaded = await downloadAssetsController.assetsDirAlreadyExists();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Download Test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(message),
            if (downloaded)
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(File(
                        "${downloadAssetsController.assetsDir}/replicate/s1.png")),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            if (downloaded)
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(File(
                        "${downloadAssetsController.assetsDir}/replicate/s2.png")),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _downloadAssets,
            tooltip: 'Increment',
            child: const Icon(Icons.arrow_downward),
          ),
          const SizedBox(
            width: 25,
          ),
          FloatingActionButton(
            onPressed: _refresh,
            tooltip: 'Refresh',
            child: const Icon(Icons.refresh),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future _refresh() async {
    await downloadAssetsController.clearAssets();
    await _downloadAssets();
  }

  Future _downloadAssets() async {
    bool assetsDownloaded =
        await downloadAssetsController.assetsDirAlreadyExists();

    if (assetsDownloaded) {
      setState(() {
        message = "Click in refresh button to force download";
        print(message);
      });
      return;
    }

    try {
      await downloadAssetsController.startDownload(
        assetsUrl:
            "https://wwf-contents.fra1.digitaloceanspaces.com/subject1/subject1/replicate.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=NUM5DZATAVUJ3V46HMZM%2F20221015%2Ffra1%2Fs3%2Faws4_request&X-Amz-Date=20221015T054538Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=c18716966f5702128d2475d8b368936b6be6837adb23fbf64ecc588a30af9b80",
        // assetsUrl:
        //     "https://github.com/edjostenes/download_assets/raw/master/assets.zip",
        onProgress: (progressValue) {
          downloaded = false;
          setState(() {
            if (progressValue < 100) {
              message = "Downloading - ${progressValue.toStringAsFixed(2)}";
              print(message);
            } else {
              message =
                  "Download completed\nClick in refresh button to force download";
              print(message);
              downloaded = true;
            }
          });
        },
      );
    } on DownloadAssetsException catch (e) {
      print(e.toString());
      setState(() {
        downloaded = false;
        message = "Error: ${e.toString()}";
      });
    }
  }
}
