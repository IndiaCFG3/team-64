import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

class SavedForms extends StatelessWidget {
  static const routeName = '/saved-forms';
  @override
  Widget build(BuildContext context) {
    var prod = Provider.of<Auth>(context);
    var data=prod.data;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Saved Forms'),
        ),
        body: Padding(
            padding: EdgeInsets.all(18),
            child: Container(height:700,decoration: BoxDecoration(border: Border.all(color: Colors.amber,width: 2)),child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (ctx, i) {
                  return Column(children:[ListTile(
                    leading: CircleAvatar(backgroundColor: data.elementAt(i)['lead']=="Yes" ? Colors.green: Colors.red ,
                      child: Text(data.elementAt(i)['lead'],style: TextStyle(color: Colors.white,),),
                    ),
                    title: Text(data.elementAt(i)['name']),
                    subtitle: Text(data.elementAt(i)['number']),
                    trailing: FlatButton.icon(label:Text("Upload"),icon: Icon(Icons.file_upload), onPressed:(){ prod.rem1(i);}),
                  ),
                    SizedBox(height: 5),
                    Divider(color: Colors.amber,thickness: 2,endIndent: 14,indent: 14,),
                    SizedBox(height:5),
                  ],);;
                }))));
  }
}
