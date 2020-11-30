library easy_custom_dialog;

import 'package:flutter/material.dart';


class EasyCustomDialog extends StatefulWidget {
  String title;
  String cancelButtonText;
  String applyButtonText;
  List<Widget> contentChildren;
  VoidCallback onCancelEvent;
  VoidCallback onApplyEvent;
  IconData dialogIcon;
  Color bgColor;
  EasyCustomDialog({this.title = 'Title', this.cancelButtonText = 'Cancel',this.applyButtonText = 'Apply',this.contentChildren = const [],this.onCancelEvent,this.onApplyEvent,this.dialogIcon = Icons.group_add,this.bgColor = Colors.blue});
  @override
  _EasyCustomDialogState createState() => _EasyCustomDialogState();
}

class _EasyCustomDialogState extends State<EasyCustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, top: 65, right: 20, bottom: 20),
          margin: EdgeInsets.only(top: 45),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.5),
                    offset: new Offset(0, 4),
                    blurRadius: 12)
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 22,
              ),
             Column(children:  widget.contentChildren,),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FlatButton(
                        onPressed: widget.onCancelEvent,
                        child: Text(
                          widget.cancelButtonText,
                          style: TextStyle(fontSize: 18),
                        )),
                    FlatButton(
                        onPressed: widget.onApplyEvent,
                        child: Text(
                          widget.applyButtonText,
                          style: TextStyle(fontSize: 18),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
            left: 20,
            right: 20,
            child: CircleAvatar(
              backgroundColor: widget.bgColor,
              radius: 45,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: Center(
                  child: Icon(
                    widget.dialogIcon,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}

