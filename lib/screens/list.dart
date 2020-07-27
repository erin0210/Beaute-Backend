//import 'package:beauty_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:beauty_app/util/data.dart';

import '../model/product.dart';
import '../services/data_service.dart';

class Friends extends StatefulWidget {

  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  
  
   List <bool> pressButton1 = List.generate(10, (_) => false);
   List <bool> pressButton2 = List.generate(10, (_) => false);
 //Use to call the data service   
    List<Product> _product;


//Fetch data from data service
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: dataService.getProductList(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          _product = snapshot.data;
          return _buildMainScreen();
        }
        return _buildFetchingDataScreen();
      }
    );
  }

//Mainscreen when success fetch the data
    Scaffold _buildMainScreen() {
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
               
               //toggle dirty-clean & update cleanliness scale
               //Update status of the product whether clean or dirty
                onPressed: () {
                 // Product updatedProduct = 
                  /*setState(() {
                     _product[index].clean = !_product[index].clean;
                     
                    dataService.updateProductStatus(
                   
                    id: _product[index].id.toString(), // Integer id to String
                    status: _product[index].clean //Update status clean
                    //status: !_product[index].dirty  //Update status dirty
                  );
                  }); */
                   

                  //setState(() {
                   //_product[index].clean = updatedProduct.dirty;
                   //_product[index].dirty = updatedProduct.clean;
                 // });

                  
                   
                    setState(() {
                      pressButton2[index] = !pressButton2[index];
                    }); 
                },    
              ),
              
              //Delete product at database when long press
              onLongPress: () {
                 // dataService.deleteProduct(
                 // id: _product[index].id.toString() // Integer id to String
               // );
                setState(() => friends.removeAt(index));
              },


              )
            //),
          );
        },

      ),
    );
  }

//Interface while waiting fetch the data from data service
  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body : Center(
        child: Column(
          mainAxisAlignment : MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching Product.....Please Wait'),
          ],
        ),
      ),
    );
  }
 
}
