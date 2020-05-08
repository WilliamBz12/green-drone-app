import 'package:flutter/material.dart';
import 'package:green_drone/app/modules/vegetation_index/vegetation_index_bloc.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:photo_view/photo_view.dart';

import '../vegetation_index_module.dart';

class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  final _bloc = VegetationIndexModule.to.get<VegetationIndexBloc>();

  bool _isDownloadingImage = false;
  bool _isDownloaded = false;

  _downloadImage(String url) async {
    try {
      setState(() => _isDownloadingImage = true);

      final imageId = await ImageDownloader.downloadImage("$url");

      setState(() {
        _isDownloadingImage = false;
        _isDownloaded = imageId != null;
      });
    } on Exception catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("TGI"),
      ),
      body: Container(
        child: StreamBuilder<String>(
          stream: _bloc.urlImage,
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return _buildImageColumn(snapshot.data);
            }

            if (snapshot.hasError) {
              return Text(snapshot.error);
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Widget _buildImageColumn(String urlImage) {
    return Column(
      children: <Widget>[
        Expanded(
          child: PhotoView(
            imageProvider: NetworkImage("$urlImage"),
          ),
        ),
        AnimatedContainer(
          duration: Duration(seconds: 2),
          child: _isDownloaded ? Container() : _buildDownloadButton(urlImage),
        ),
        _buildTGIInfo(),
      ],
    );
  }

  Widget _buildDownloadButton(url) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: FloatingActionButton(
        onPressed: () => _downloadImage(url),
        child: _isDownloadingImage
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            : Icon(Icons.file_download),
      ),
    );
  }

  Widget _buildTGIInfo() {
    return Container(
      padding: EdgeInsets.all(15),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "0 %",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "100 %",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Image.asset(
            "assets/images/colormap_jet.jpg",
            fit: BoxFit.fitWidth,
            height: 100,
          ),
        ],
      ),
    );
  }
}
