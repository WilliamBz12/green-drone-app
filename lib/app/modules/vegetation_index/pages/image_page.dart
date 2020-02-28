import 'package:flutter/material.dart';
import 'package:green_drone/app/modules/vegetation_index/vegetation_index_bloc.dart';
import 'package:photo_view/photo_view.dart';

import '../vegetation_index_module.dart';

class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  final _bloc = VegetationIndexModule.to.get<VegetationIndexBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, title: Text("TGI"),),
      body: Container(
        child: StreamBuilder<String>(
          stream: _bloc.urlImage,
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: PhotoView(
                      imageProvider: NetworkImage(snapshot.data),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("0 %", style: TextStyle(fontSize: 20)),
                            Text("100 %",  style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        Image.asset(
                          "assets/images/colormap_jet.jpg",
                          fit: BoxFit.fitWidth,
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ],
              );
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
}
