import 'package:flutter/material.dart';
import 'AddMember.dart';
import 'DeleteItem.dart';
import 'DisplayToDoMember.dart';
import 'UpdateItemLIst.dart';

class DemoAppHomePageProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(child: Text('To Do App',style: TextStyle(color: Colors.white,fontSize: 30),)),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu, color: Colors.white),
            );
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(child: Center(child: Text('To Do App Via Provider',style: TextStyle(fontSize: 30),),),),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 40),
              child: CircularProgressIndicator(backgroundColor: Colors.purple),
            ),
            Container(
              padding: EdgeInsets.all(0),
              child: Text('Username',style: TextStyle(fontSize: 30),),),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: (){
                  Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Add Member'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddMember()),
                );
              },
            ),
            ListTile(
                leading: Icon(Icons.smart_display),
                title: Text('All Items View'), // Corrected "Stettings" to "Settings"
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Display()));
                }
            ),
            ListTile(
              leading: Icon(Icons.update),
              title: Text('Update'),
              onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Updateitemlist()));
              },
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Delete'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DeleteItemList()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
