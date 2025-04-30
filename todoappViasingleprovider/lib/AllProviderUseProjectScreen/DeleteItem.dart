import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../AllProviderUseProjectDefineProvider/Add_DeleteFile.dart';

class DeleteItemList extends StatelessWidget {
  const DeleteItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Container(child: Text('Delete Member',style: TextStyle(fontSize: 30),),),
          leading: IconButton(
              onPressed: (){
                   Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_circle_left_outlined,size: 34,)
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(14),
              color: Colors.white70,
              child: Row(
                children: [
                  Expanded(child: Text('Sl.no', style: TextStyle(fontSize: 20))),
                  Expanded(child: Text('Name', style: TextStyle(fontSize: 20))),
                  Expanded(child: Text('Quantity', style: TextStyle(fontSize: 20))),
                  Expanded(child: Text('Price', style: TextStyle(fontSize: 20))),
                  Expanded(child: Text('Delete',style:  TextStyle(fontSize: 20),))
                ],
              ),
            ),
            Expanded(child: Consumer<AddMemberProvider>(
              builder: (context, DeleteData, child)
              {
                   return Container(child: ListView.builder(
                     itemCount: DeleteData.ITEMNAME.length,
                       itemBuilder: (context, index)
                           {
                               return Padding(
                                 padding: const EdgeInsets.all(12.0),
                                 child: Row(children: [
                                   Expanded(child: Text('${index + 1}', style: TextStyle(fontSize: 20))),
                                   Expanded(child: Text(DeleteData.ITEMNAME[index], style: TextStyle(fontSize: 20))),
                                   Expanded(child: Text(DeleteData.ITEMQUANTITY[index].toString(), style: TextStyle(fontSize: 20))),
                                   Expanded(child: Text(DeleteData.ITEMPRICE[index].toString(), style: TextStyle(fontSize: 20))),
                                   Expanded(child: TextButton(
                                       onPressed: (){
                                           Provider.of<AddMemberProvider>(context, listen: false).DeleteMembers(index, DeleteData.ITEMNAME[index], DeleteData.ITEMQUANTITY[index], DeleteData.ITEMPRICE[index]);
                                       },
                                       child: Icon(Icons.delete, size: 40,)))
                                 ],),
                               );
                           }
                   ),);
              },
            ),)
        ],),
    );
  }
}
