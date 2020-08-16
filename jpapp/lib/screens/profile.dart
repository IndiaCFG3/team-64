import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
class Profile extends StatelessWidget {
  static const routeName='/profile';
  var url='https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
  @override
  Widget build(BuildContext context) {
    var prod=Provider.of<Auth>(context);
 return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(prod.currentUser),
        ),
      body:Padding(padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child:Column(
            children: <Widget>[
              CircleAvatar(backgroundImage:  NetworkImage(url),radius: 200,),
              SizedBox(height: 12,),
              Align(alignment: Alignment.center,child:Text(prod.currentUser,style: TextStyle(color:Colors.red,fontSize: 24,fontWeight: FontWeight.bold),)),
              SizedBox(height: 12,),
              Text('Number of leads converged : 344 ',style: TextStyle(color:Colors.purple,fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(height: 12,),
              Align(alignment: Alignment.center,child:Text('History',style: TextStyle(color:Colors.red,fontSize: 24,fontWeight: FontWeight.bold),)),
              Container(height:300,decoration: BoxDecoration(border: Border.all(color: Colors.amber,width: 2)),child: 
                ListView.builder(itemCount: prod.data3.length,itemBuilder: (ctx,i){
                  return Column(children: <Widget>[
                    ListTile(
                    leading: CircleAvatar(backgroundColor: prod.data.elementAt(i)['lead']=="Yes" ? Colors.green: Colors.red ,
                      child: Text(prod.data3.elementAt(i)['lead'],style: TextStyle(color: Colors.white,),),
                    ),
                    title: Text(prod.data3.elementAt(i)['name']),
                    subtitle: Text(prod.data3.elementAt(i)['number']),
                    trailing: Icon(prod.data.elementAt(i)['lead']=="Yes" ? Icons.thumb_up : Icons.thumb_down),
                    ),
                    SizedBox(height: 5),
                    Divider(color: Colors.amber,thickness: 2,endIndent: 14,indent: 14,),
                    SizedBox(height:5),
                  ],);
                })
              ,),
              SizedBox(height: 22,)
            ],
          )
        ),
      )
    );
  }
}