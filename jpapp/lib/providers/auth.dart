import 'package:flutter/material.dart';
class Auth with ChangeNotifier
{
  var auth={
    'siddhu@5':'123456789',
    'naveen@1' :'1234567',
    '@':'1234567'
  };
  String currentUser='';
  int login(String a,String b){
    if(auth[a]==b){
      currentUser=a;
      notifyListeners();
      return 0;
    }else
      return 1;
  }
   void signUp(String a,String b){
    auth[a]=b;
   }
   void logout(){
     currentUser='';
     notifyListeners();
   }
   List<Map<String,String>> data=[{'name':'Siddharth','adddress':'qwerty','number':'9878642123','lead':'Yes'},
    {'name':'Rishabh','adddress':'qwerty','number':'7878642123','lead':'No'},
   {'name':'Pranav','adddress':'qwerty','number':'8878642123','lead':'Yes'},
   {'name':'Naveen','adddress':'qwerty','number':'6878642123','lead':'No'},
   {'name':'Kumar','adddress':'qwerty','number':'9808621123','lead':'Yes'},
   {'name':'priya','adddress':'qwerty','number':'6878642123','lead':'No'},
   {'name':'Pragya','adddress':'qwerty','number':'9808621123','lead':'Yes'},

  ];
   List<Map<String,String>> data2=[];
   List<Map<String,String>> data3=[
     {'name':'Siddharth','adddress':'qwerty','number':'9878642123','lead':'Yes'},
    {'name':'Rishabh','adddress':'qwerty','number':'7878642123','lead':'No'},
   {'name':'Pranav','adddress':'qwerty','number':'8878642123','lead':'Yes'},
   {'name':'Naveen','adddress':'qwerty','number':'6878642123','lead':'No'},
   {'name':'Kumar','adddress':'qwerty','number':'9808621123','lead':'Yes'},
      {'name':'priya','adddress':'qwerty','number':'6878642123','lead':'No'},
   {'name':'Pragya','adddress':'qwerty','number':'9808621123','lead':'Yes'},

   ];
   void add(Map<String,String> a){
     data.add(a);
     data3.add(a);
     notifyListeners();
   }
   void add2(Map<String,String> a){
     data2.add(a);
     data3.add(a);
     notifyListeners();
   }
   void rem1(index){
     data.removeAt(index);
     notifyListeners();
   }
  //  var table=List.generate(30,(i)=>List(11));
   var table=[
     ["James",	"wart",	"Benton", "John B Jr	6649 N Blue Gum St",	'New Orleans',	'Orleans',	'LA',	'70116',	'504-621-8921',	'504-845-1427'	,'jbutt@gmail.com'],
      ["Rakesh",	"Kishore",	"Benton", "Anagha	6649 N Blue Gum St",	'New Orleans',	'Orleans',	'LA',	'70116',	'504-621-8912',	'504-845-1427'	,'jbutt@gmail.com'],
       ["Sharma",	"Vinay",	"Benton", "Vrindalam	6649 N Blue Gum St",	'New Orleans',	'Orleans',	'LA',	'70116',	'504-621-8923',	'504-845-1427'	,'jbutt@gmail.com'],
        ["Manoj",	"Kumar",	"Benton", " Bharat 6649 N Blue Gum St",	'New Orleans',	'Orleans',	'LA',	'70116',	'504-621-8924',	'504-845-1427'	,'jbutt@gmail.com'],     
         ["Rishabh",	"Jain",	"Benton", "Mandir	6649 N Blue Gum St",	'New Orleans',	'Orleans',	'LA',	'70116',	'504-621-8925',	'504-845-1427'	,'jbutt@gmail.com'],
          ["Pragya",	"Jisha",	"Benton", "Tesla	6649 N Blue Gum St",	'New Orleans',	'Orleans',	'LA',	'70116',	'504-621-8926',	'504-845-1427'	,'jbutt@gmail.com'],
           ["Varun",	"Jha",	"Benton", "Bhatia	6649 N Blue Gum St",	'New Orleans',	'Orleans',	'LA',	'70116',	'504-621-8927',	'504-845-1427'	,'jbutt@gmail.com'],
            ["Anubhav",	"Bhatia",	"Benton", "Bhuvia	6649 N Blue Gum St",	'New Orleans',	'Orleans',	'LA',	'70116',	'504-621-8927',	'504-845-1427'	,'jbutt@gmail.com'],
   ];
   void rem2(int i){
     print(table[i]);
     table.removeAt(i);
   }
}