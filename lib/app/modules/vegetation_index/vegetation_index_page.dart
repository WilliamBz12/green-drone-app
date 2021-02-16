import 'dart:io';
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

  void _sendImage(context) async {
    setState(() => _isLoading = true);
    final result = await _bloc.sendImage();

    if (!result) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Image não encontrada"),
      ));
    } else {
      Navigator.pushNamed(context, "/vegetation_index/image-page");
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    _widhtSize = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Green Drone"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildImageSelect(),
            _buildImageSelected(),
            Column(
              children: [
                _buildButtonApplyTGI(),
                SizedBox(
                  height: 10,
                ),
                CustomButtonWidget(
                  onTap: null,
                  width: double.infinity,
                  text: "VARI (Em breve)",
                ),
              ],
            ),
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
        return CustomButtonWidget(
          onTap: snapshot?.data ?? false ? () => _sendImage(context) : null,
          width: double.infinity,
          text: "TGI",
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

        return Text("Selecione uma imagem");
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
