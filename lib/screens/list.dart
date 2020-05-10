import 'package:beauty_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:beauty_app/util/data.dart';

class Friends extends StatefulWidget {

  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  
  
    List <bool> pressButton1 = List.generate(10, (_) => false);
    List <bool> pressButton2 = List.generate(10, (_) => false);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: (){},
        ),
        title: TextField(
          decoration: InputDecoration.collapsed(
            hintText: 'Search',
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.filter_list,
            ),
            onPressed: () {}
          ),
        ],
      ),


      body: ListView.separated(
        padding: EdgeInsets.all(10),
        separatorBuilder: (BuildContext context, int index) {
          return Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 0.5,
              width: MediaQuery.of(context).size.width / 1.3,
              child: Divider(),
            ),
          );
        },
        itemCount: friends.length,
        itemBuilder: (BuildContext context, int index) {
          Map friend = friends[index];
              /*return Dismissible(
              key: Key(friends[index]),
              onDismissed: (direction) {
              setState(() {
              friends.removeAt(index);
            });
          },*/
              return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  friend['dp'],
                ),
                radius: 25,
              ),
              

              contentPadding: EdgeInsets.all(0),
              title: Text(friend['name']),
              subtitle: Text(friend['status']),
              trailing: friend['isAccept']
                  ? new FlatButton(
                child: new Text(pressButton1[index]? ('Clean') :
                  ('Dirty'),
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                ),

                color: pressButton1[index]? Colors.green: Colors.red,
                //onPressed: () => setState(() => pressButton1[index] = !pressButton1[index]),
                onPressed: () {
                    setState(() {
                      pressButton1[index] = !pressButton1[index];
                    }); 
                }, 
            
            )
              :FlatButton(
                child: new Text(pressButton2[index]? ('Dirty') :
                  ('Clean'),
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                ),
                 color: pressButton2[index]? Colors.red : Colors.green,
                //onPressed: () => setState(() => pressButton2[index] = !pressButton2[index]),
                onPressed: () { //toggle dirty-clean
                    setState(() {
                      pressButton1[index] = !pressButton1[index];
                    }); 
                },    
          ),
              onTap: (){
                setState(() {
                   friends.removeAt(index); //delete products from your list
                });
              },


              )
            //),
          );
        },

      ),
    );
  }
 
}
