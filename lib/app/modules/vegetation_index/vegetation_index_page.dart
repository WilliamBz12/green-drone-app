import 'dart:io';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:green_drone/app/shared/widgets/custom_button_widget.dart';

import 'vegetation_index_bloc.dart';
import 'vegetation_index_module.dart';

class VegetationIndexPage extends StatefulWidget {
  @override
  _VegetationIndexPageState createState() => _VegetationIndexPageState();
}

class _VegetationIndexPageState extends State<VegetationIndexPage> {
  final _bloc = VegetationIndexModule.to.get<VegetationIndexBloc>();
  bool _isLoading = false;
  double _widhtSize;

  void _sendImage() async {
    setState(() => _isLoading = true);
    final result = await _bloc.sendImage();

    if (!result) {
      Flushbar(
        message: "",
        duration: Duration(seconds: 3),
      )..show(context);
    } else {
      Navigator.pushNamed(context, "/vegetation_index/image-page");
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    _widhtSize = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Índice de vegetação")),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () =>
      //       Navigator.pushNamed(context, "/vegetation_index/image-picker"),
      // ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildImageSelect(),
            _buildImageSelected(),
            _buildButtonApplyTGI()
          ],
        ),
      ),
    );
  }

  Widget _buildButtonApplyTGI() {
    return StreamBuilder<bool>(
      stream: _bloc.outStateButton,
      initialData: false,
      builder: (context, snapshot) {
        bool isTap = snapshot.hasData ? snapshot.data : false;
        return CustomButtonWidget(
          onTap: isTap ? _sendImage : null,
          width: double.infinity,
          text: "Aplicar TGI",
          isLoading: _isLoading,
        );
      },
    );
  }

  Widget _buildImageSelected() {
    return StreamBuilder<File>(
      stream: _bloc.outImage,
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              width: double.infinity,
              child: Image.file(snapshot.data),
            ),
          );
        }

        if (snapshot.hasError) {
          return Text(snapshot.error);
        }

        return Text("Selecione uma imagem...");
      },
    );
  }

  Widget _buildImageSelect() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        CustomButtonWidget(
          onTap: _bloc.selectImageFromCamera,
          text: "Camera",
          width: _widhtSize * .5 - 30,
          sufixIcon: Icons.camera,
        ),
        CustomButtonWidget(
          onTap: _bloc.selectImageFromGallery,
          text: "Galeria",
          width: _widhtSize * .5 - 30,
          sufixIcon: Icons.add_to_photos,
        ),
      ],
    );
  }
}
