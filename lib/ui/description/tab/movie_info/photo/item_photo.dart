import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../data/config/api.dart';
import '../../../../../data/model/photo.dart';


class ItemPhoto extends StatefulWidget {
  final List<Backdrops>? listbackdrop;
  const ItemPhoto({
    Key? key,
    @required this.listbackdrop,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ItemPhotoState createState() => _ItemPhotoState();
}

class _ItemPhotoState extends State<ItemPhoto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: widget.listbackdrop!.length,
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                '${Config.baseImageUrl}${widget.listbackdrop![index].filePath}',
                fit: BoxFit.cover,
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              )),
    );
  }
}
