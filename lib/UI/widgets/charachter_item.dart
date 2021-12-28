import 'package:flutter/material.dart';
import 'package:flutter_bloc_test2/data/models/charachters.dart';

class CharachterItem extends StatelessWidget {
  final Charachter charachter;
  const CharachterItem({Key? key, required this.charachter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        child: Container(
          color: Colors.grey,
          child: charachter.img!.isNotEmpty
              ? FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: 'assets/images/loading.gif',
                  image: charachter.img!)
              : Image.asset('assets/images/image.webp'),
        ),
        footer: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          width: double.infinity,
          color: Colors.black45,
          alignment: Alignment.bottomCenter,
          child: Text(
            '${charachter.name}',
            style: TextStyle(
                height: 1.3,
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
