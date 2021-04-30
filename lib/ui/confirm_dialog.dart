import 'package:flutter/material.dart';

import '../item.dart';

class ConfirmDialog extends StatelessWidget {
  final Item item;
  const ConfirmDialog({Key key , this.item}):super (key:key);


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(item.name),
      content: Text("confirm to delete ${item.name}"),
      actions:<Widget>[
        FlatButton(onPressed: (){
          Navigator.of(context).pop(false);
    }, child: Text("Cancel",
         style: TextStyle(color:Colors.black),),),
        FlatButton(onPressed:(){
         Navigator.of(context).pop(true);
    }, child: Text("Delete",
        style:TextStyle(color:Colors.white),),
        color: Theme.of(context).accentColor,)
    ],
    );
  }
}
