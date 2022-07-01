library user_avatar_with_friends;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserAvatarWithFriendsList extends StatefulWidget {
  List<String>? imagePath = List.empty(growable: true);
  String? userImage;
  double? imageWidth;
  double? imageHeight;
  String? placeHolderImage;
  TextStyle? textStyle;
  double? space;

  UserAvatarWithFriendsList(
      {Key? key,
      required this.imagePath,
      required this.userImage,
      required this.imageHeight,
      required this.imageWidth,
      required this.placeHolderImage,
      required this.textStyle,
      this.space})
      : super(key: key);

  @override
  State<UserAvatarWithFriendsList> createState() {
    return _UserAvatarWithFriendsList();
  }
}

class _UserAvatarWithFriendsList extends State<UserAvatarWithFriendsList> {
  int listSize = 0;
  int restValue = 0;
  @override
  void initState() {
    if (widget.imagePath!.length > 3) {
      listSize = 3;
      restValue = widget.imagePath!.length - listSize;
    } else {
      listSize = widget.imagePath!.length;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            widget.userImage!.contains("http")
                ? CachedNetworkImage(
                    imageUrl: widget.userImage!,
                    imageBuilder: (context, imageProvider) => Container(
                      width: widget.imageWidth,
                      height: widget.imageHeight,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      width: widget.imageWidth,
                      height: widget.imageHeight,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(widget.placeHolderImage!))),
                    ),
                    errorWidget: (context, url, error) => Container(
                      width: widget.imageWidth,
                      height: widget.imageHeight,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.black),
                      ),
                      child: const Icon(
                        Icons.error,
                        size: 30,
                      ),
                    ),
                  )
                : Container(
                    width: widget.imageWidth,
                    height: widget.imageHeight,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.grey),
                        image: DecorationImage(
                            image: AssetImage(widget.userImage!)))),
            Padding(
                padding: EdgeInsets.only(
                  left: widget.imageWidth! + widget.space! / 2,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        for (int i = 0; i < listSize; i++)
                          i == 0
                              ? widget.imagePath![i].contains("http")
                                  ? CachedNetworkImage(
                                      imageUrl: widget.imagePath![i],
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: widget.imageWidth! / 2,
                                        height: widget.imageHeight! / 2,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) => Container(
                                        width: widget.imageWidth! / 2,
                                        height: widget.imageHeight! / 2,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    widget.placeHolderImage!))),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        width: widget.imageWidth! / 2,
                                        height: widget.imageHeight! / 2,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 1, color: Colors.black),
                                        ),
                                        child: const Icon(
                                          Icons.error,
                                          size: 30,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: widget.imageWidth! / 2,
                                      height: widget.imageHeight! / 2,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 1, color: Colors.grey),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  widget.imagePath![i]))),
                                    )
                              : Padding(
                                  padding: EdgeInsets.only(
                                    left: i *
                                        (widget.imageWidth! + widget.space!) /
                                        2,
                                  ),
                                  child: widget.imagePath![i].contains("http")
                                      ? CachedNetworkImage(
                                          imageUrl: widget.imagePath![i],
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            width: widget.imageWidth! / 2,
                                            height: widget.imageHeight! / 2,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) =>
                                              Container(
                                            width: widget.imageWidth! / 2,
                                            height: widget.imageHeight! / 2,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(widget
                                                        .placeHolderImage!))),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Container(
                                            width: widget.imageWidth! / 2,
                                            height: widget.imageHeight! / 2,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.black),
                                            ),
                                            child: const Icon(
                                              Icons.error,
                                              size: 30,
                                            ),
                                          ),
                                        )
                                      : Container(
                                          width: widget.imageWidth! / 2,
                                          height: widget.imageHeight! / 2,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 1, color: Colors.grey),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      widget.imagePath![i]))),
                                        ),
                                ),
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "+$restValue",
                      style: widget.textStyle,
                    )
                  ],
                ))
          ],
        ));
  }
}
