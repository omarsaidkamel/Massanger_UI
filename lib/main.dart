import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MessengerScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        /*inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.tealAccent),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.indigo),
          ),
        ),*/
      ),
    ));

class Person{
  String name;
  String letter;
  Person({
    required this.name,
    required this.letter
  });
}

class MessengerScreen extends StatelessWidget {
  List<Person> users =[
    Person(name: "Omar Said", letter: "How old are you?"),
    Person(name: "Ahmed samy", letter: "Hi! Friend"),
    Person(name: "Ali amr", letter: "Welcome back bro"),
    Person(name: "Alsayed Hassan", letter: "What do you prefer"),
    Person(name: "Hani mohamed", letter: "How are you?"),
    Person(name: "Mohamed Ali", letter: "Where are you now"),
    Person(name: "Ashraf gamal", letter: "Lets play!"),
    Person(name: "Paul hani", letter: "Lets go?"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.edit_rounded)),
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt)),
        ],
        title: Text("Chat",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        leading: Container(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
                child: Image.asset("assets/images/google.png"),
                backgroundColor: Colors.white10)),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
            Container(
            height: 55,
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.red, width: 50),
                ),
                labelText: "Search",
              ),
            ),
          ),
            Container(height: 120,
              child: ListView.separated(scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => horizontalview(users[index].name),
                itemCount: users.length, separatorBuilder: (BuildContext context, int index) =>SizedBox(width: 10,height: 5,),
              ),
            ),
            ListView.separated(itemCount: users.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index)=>SizedBox(height: 10,),
              itemBuilder: (BuildContext context, int index) => verticalview(context,users[index].name,users[index].letter),
              ),
        ],
      )),
    );
  }
  Widget horizontalview (String s){
    return Padding(padding: EdgeInsets.only(top: 2,left: 10,right: 10),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/facebook.png",),
            backgroundColor: Colors.white10,
            radius: 40,
          ),
          Container(width: 80,
            child: Text("$s",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
  Widget verticalview (BuildContext context,String s,String x){
    return Padding(
      padding: EdgeInsets.only(top: 5,left: 10,right: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/facebook.png",),
            backgroundColor: Colors.white10,
            radius: 35,
          ),
          Column(
              children: [
            Container(
              padding: EdgeInsets.only(left:11,bottom:5),
              width: MediaQuery.of(context).size.width*0.7,
              child: Text("$s",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left:11),
              width:MediaQuery.of(context).size.width*0.7,
              child: Text("$x",
                style: TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis,maxLines: 2,),
            )
          ]),
        ],
      ),
    );
  }
}

