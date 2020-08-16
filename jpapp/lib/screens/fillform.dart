import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
class FillForm extends StatefulWidget {
  static const routeName='/fill-form';

  @override
  _FillFormState createState() => _FillFormState();
}

class _FillFormState extends State<FillForm> {
  final _form = GlobalKey<FormState>();

    final _nameFocusNode = FocusNode();
    final _numberFocusNode = FocusNode();
    final _addressFocusNode = FocusNode();

    final _leadFocusNode = FocusNode();

    Map<String,String> _data={};

  void _submit(){
    _form.currentState.save();
    Provider.of<Auth>(context).add(_data);
    Navigator.of(context).pop();
  }
  void _submit2(){
    _form.currentState.save();
    Provider.of<Auth>(context).add2(_data);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    

    

  return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Lead Data Entry'),
        ),
      body:Padding(padding: EdgeInsets.all(20),child: Form(
          key: _form,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  keyboardType: TextInputType.text,
                  focusNode: _nameFocusNode,
                  onSaved: (value) {
                    _data['name'] = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'address'),
                  keyboardType: TextInputType.multiline,
                  focusNode: _addressFocusNode,
                  onSaved: (value) {
                    _data['address'] = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Mobile Number'),
                  keyboardType: TextInputType.number,
                  focusNode: _numberFocusNode,
                  onSaved: (value) {
                    _data['number'] = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Lead'),
                  keyboardType: TextInputType.text,
                  focusNode: _leadFocusNode,
                  onSaved: (value) {
                    _data['lead'] = value;
                  },
                ),
                SizedBox(height: 5),
                        Align(
                          alignment: Alignment.center,
                          child: RaisedButton(
                              onPressed: () {
                                _submit();
                              },
                              child: Text(
                                'Save Form Locally',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.deepPurple),
                              )),
                        ),
                        SizedBox(height: 2),
                        Align(
                          alignment: Alignment.center, 
                          child: RaisedButton(
                              onPressed: () {
                                _submit2();
                              },
                              child: Text(
                                'Upload To Server',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.deepOrange),
                              )),
                        )
                ]
                ),
    )
      )
      )
  );

  }
}