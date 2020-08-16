import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../screens/fillform.dart';
import '../screens/profile.dart';
class Home extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    var prod=Provider.of<Auth>(context);
    var data=prod.table;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Home'),
        actions: <Widget>[FlatButton.icon(onPressed: (){Navigator.of(context)
                            .pushNamed(Profile.routeName);}, icon: Icon(Icons.person), label: Text(prod.currentUser,style: TextStyle(color:Colors.white),))],
        // actions: <Widget>[IconButton(icon: Icon(Icons.more_horiz), onPressed: null)],
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 100,
                color: Colors.red,
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(padding: EdgeInsets.all(14),child:Align(alignment: Alignment.center,child: Column(children: <Widget>[
                    Text('Monthly Target',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                     SizedBox(height:4),
                     CircleAvatar(backgroundColor:Colors.amber,child: Padding(padding:EdgeInsets.all(2),child:Text('100',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),))
                  ],),)
                  
                ),
              ),
            ),),
            Expanded(
              child: Container(
                height: 100,
                color: Colors.amber,
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(padding: EdgeInsets.all(14),child:Align(alignment: Alignment.center,child: Column(children: <Widget>[
                    Text('Pending Targets',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                     SizedBox(height:4),
                     CircleAvatar(backgroundColor:Colors.red,child: Padding(padding:EdgeInsets.all(2),child:Text('37',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),))
                  ],),)
                  
                ),
              ),
            ),),
            Expanded(
              child: Container(
                height: 100,
                color: Colors.red,
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(padding: EdgeInsets.all(14),child:Align(alignment: Alignment.center,child: Column(children: <Widget>[
                    Text('Today\'s Target',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    SizedBox(height:4),
                    CircleAvatar(backgroundColor:Colors.amber,child: Padding(padding:EdgeInsets.all(2),child:Text('5',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),))
                    
                  ],),)
                  
                ),
              ),
            ),)
          ],
        ),
        SizedBox(height:36),
        Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.amber),
                  color: Colors.grey[200],
                  ),
              height: 300,
              width: 400,
              child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (ctx, i) {
                    return Dismissible(
                        key: ValueKey(data[i][8]),
                        background: Container(
                            color: Colors.red, child: Padding(padding: EdgeInsets.only(left:10),child:Align(alignment: Alignment.centerLeft,child:Icon(Icons.delete)))),
                        direction: DismissDirection.startToEnd,
                        onDismissed: (dir){prod.rem2(i);},
                        child: Column(
                      children:[
                        Padding(padding:EdgeInsets.all(5), child:Container(height:50,width:450,child:Padding(
                          padding: EdgeInsets.only(left: 20),
                          child:SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child:Row(children: <Widget>[
                            
                            Padding(padding:EdgeInsets.symmetric(horizontal: 5),child:Container(color:Colors.blue,child:Padding(padding:EdgeInsets.all(5),child:Align(alignment: Alignment.center,child: Text(data[i][0],style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),)))),
                            Padding(padding:EdgeInsets.symmetric(horizontal: 5),child:Container(color:Colors.purple,child:Padding(padding:EdgeInsets.all(5),child:Align(alignment: Alignment.center,child: Text(data[i][1],style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),)))),
                            Padding(padding:EdgeInsets.symmetric(horizontal: 5),child:Container(color:Colors.blue,child:Padding(padding:EdgeInsets.all(5),child:Align(alignment: Alignment.center,child: Text(data[i][2],style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),)))),
                            Padding(padding:EdgeInsets.symmetric(horizontal: 5),child:Container(color:Colors.purple,child:Padding(padding:EdgeInsets.all(5),child:Align(alignment: Alignment.center,child: Text(data[i][3],style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),)))),
                            Padding(padding:EdgeInsets.symmetric(horizontal: 5),child:Container(color:Colors.blue,child:Padding(padding:EdgeInsets.all(5),child:Align(alignment: Alignment.center,child: Text(data[i][4],style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),)))),
                            Padding(padding:EdgeInsets.symmetric(horizontal: 5),child:Container(color:Colors.purple,child:Padding(padding:EdgeInsets.all(5),child:Align(alignment: Alignment.center,child: Text(data[i][5],style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),)))),
                            Padding(padding:EdgeInsets.symmetric(horizontal: 5),child:Container(color:Colors.blue,child:Padding(padding:EdgeInsets.all(5),child:Align(alignment: Alignment.center,child: Text(data[i][6],style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),)))),
                            Padding(padding:EdgeInsets.symmetric(horizontal: 5),child:Container(color:Colors.purple,child:Padding(padding:EdgeInsets.all(5),child:Align(alignment: Alignment.center,child: Text(data[i][7],style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),)))),
                            Padding(padding:EdgeInsets.symmetric(horizontal: 5),child:Container(color:Colors.blue,child:Padding(padding:EdgeInsets.all(5),child:Align(alignment: Alignment.center,child: Text(data[i][8],style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),)))),
                            Padding(padding:EdgeInsets.symmetric(horizontal: 5),child:Container(color:Colors.purple,child:Padding(padding:EdgeInsets.all(5),child:Align(alignment: Alignment.center,child: Text(data[i][9],style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),)))),
                            Padding(padding:EdgeInsets.symmetric(horizontal: 5),child:Container(color:Colors.blue,child:Padding(padding:EdgeInsets.all(5),child:Align(alignment: Alignment.center,child: Text(data[i][10],style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),)))),
                          ],) ,
                        )
                        ) ),
                        ),
                      
                         SizedBox(height:3),
                        Divider(color: Colors.amber,thickness: 2,indent: 14,endIndent: 14,),
                        SizedBox(height:3),

                       
                      ]
                      ));
                  }),
            )),
            SizedBox(height: 40,),
            FlatButton.icon(onPressed: (){Navigator.of(context)
                            .pushNamed(FillForm.routeName);}, icon: Icon(Icons.edit), label: Text('Open Form',style: TextStyle(color:Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 20),))
      ])),
      drawer: DrawerWidget(),
    );
  }
}
