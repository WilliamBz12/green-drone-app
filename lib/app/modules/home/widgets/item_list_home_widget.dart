import 'package:flutter/material.dart';
import 'package:green_drone/app/shared/theme/colors.dart';


class ItemListHomeWidget extends StatelessWidget {
  final String title;
  final String route;
  final String subTitle;
  final String image;
  final Function onTapCard;

  ItemListHomeWidget({
    this.title,
    this.subTitle,
    this.image,
    this.onTapCard,
    this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.darkBlack,
        borderRadius: BorderRadius.circular(14),
        image: DecorationImage(
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            Color(0xFF161616),
            BlendMode.softLight,
          ),
          image: AssetImage(
            "assets/images/$image",
          ),
        ),
      ),
      child: IntrinsicHeight(
        child: Material(
          borderRadius: BorderRadius.circular(14),
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            highlightColor: Color(0x20FFFFFF),
            splashColor: Color(0x10000000),
            onTap: () => Navigator.pushNamed(context, route),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    subTitle,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
