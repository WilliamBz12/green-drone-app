import 'package:flutter/material.dart';
import 'package:green_drone/app/shared/theme/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final Function onTap;
  final Color color;
  final Color iconsColor;
  final IconData sufixIcon;
  final double width;
  final bool isLoading;

  CustomButtonWidget({
    @required this.text,
    @required this.onTap,
    this.color = AppColors.green,
    this.iconsColor = Colors.white,
    this.sufixIcon,
    this.width,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      height: 50,
      child: RaisedButton(
        disabledColor: Colors.grey[500],
        child: isLoading ? CircularProgressIndicator() : _buildTitle(),
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onPressed: isLoading ? null : onTap,
      ),
    );
  }

  Widget _buildTitle() {
    if (sufixIcon != null) {
      return Row(
        children: <Widget>[
          Icon(sufixIcon, color: iconsColor),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(color: iconsColor),
          ),
        ],
      );
    }
    return Text(
      text,
      style: TextStyle(color: iconsColor),
    );
  }
}
