import 'package:flutter/material.dart';

import '../../../../../data/config/api.dart';
import '../../../../../data/model/cast.dart';


class ItemCast extends StatefulWidget {
  final List<CastModel>? listcast;
  const ItemCast({
    Key? key,
    @required this.listcast,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ItemCastState createState() => _ItemCastState();
}

class _ItemCastState extends State<ItemCast> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
        itemBuilder: (context, index) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Row(children: [
              Flexible(
                flex: 2,
                child: SizedBox(
                  width: 50,
                  child: (widget.listcast![index].profilePath != null)
                  ?ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      '${Config.baseImageUrl}${widget.listcast![index].profilePath}',
                      fit: BoxFit.cover,
                    ),
                  ): const SizedBox( width: 50,)
                  ,
                )
              ),
              const SizedBox(width: 15,),
              Expanded(
                flex: 4,
                child: Text(
                  '${widget.listcast![index].name}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 15,),
              Flexible(
                flex: 1,
                child: Image.asset(
                  'images/3cham.png',
                ),
              ),
              const SizedBox(width: 30,),
              Expanded(
                flex: 3,
                child: Text(
                  '${widget.listcast![index].character}',
                  style: TextStyle(color: Colors.white.withOpacity(0.5)),
                ),
              ),
            ]),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 0,
            height: 25,
          );
        },
        itemCount: widget.listcast!.length);
  }
}
