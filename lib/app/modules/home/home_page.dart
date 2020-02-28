import 'package:flutter/material.dart';
import 'widgets/item_list_home_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<Map> _items = [
    {
      "title": "Índices de\nvegetação",
      "subTitle": "Utilize sua câmera ou\ngaleria para calcular IV's",
      "image": "iv_background.png",
      "route" : "/vegetation_index",
    },
    {
      "title": "Registrar dados\ndo drone",
      "subTitle": "Registre as imagens\ncapturadas pelo seu drone",
      "image": "drone_background.png",
    },
    {
      "title": "Dados de suas\nplantações",
      "subTitle": "Veja todo o histórico de\ndados de suas plantações",
      "image": "data_background.png",
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Green Drone"),
      ),
      body: Container(
        margin: EdgeInsets.only(
          right: 15,
          left: 15,
          top: 20,
        ),
        child: Column(
          children: List.generate(
            _items.length,
            (index) {
              return ItemListHomeWidget(
                image: _items[index]["image"],
                subTitle: _items[index]["subTitle"],
                title: _items[index]["title"],
                route: _items[index]["route"],
              );
            },
          ),
        ),
      ),
    );
  }
}
