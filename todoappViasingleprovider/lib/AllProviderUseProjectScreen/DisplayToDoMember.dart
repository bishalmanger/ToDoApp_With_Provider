import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../AllProviderUseProjectDefineProvider/Add_DeleteFile.dart';

class Display extends StatelessWidget {
  const Display({super.key});

  void AmountDisplay(BuildContext context, AddMemberProvider data) {
    double result = 0;
    for (var price in data.ITEMPRICE) {
      result += double.tryParse(price.toString()) ?? 0;
      print(price.runtimeType);
      print(result.runtimeType);
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text("Total Amount")),
          content: Container(
            height: 100,
            child: Column(
              children: [
                Text('Total Amount: $result',style: TextStyle(fontSize: 18),),
                Text('Per Head Amount: ${result/2}',style: TextStyle(fontSize: 18),),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text(
            'List of all Members',
            style: TextStyle(color: Colors.white),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_circle_left_outlined, color: Colors.white,size: 34,),
        ),
        backgroundColor: Colors.blueAccent,
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
              ],
            ),
          ),
          Expanded(
            child: Consumer<AddMemberProvider>(
              builder: (context, data, child) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(child: Text('${index + 1}', style: TextStyle(fontSize: 20))),
                            Expanded(child: Text(data.ITEMNAME[index], style: TextStyle(fontSize: 20))),
                            Expanded(child: Text(data.ITEMQUANTITY[index].toString(), style: TextStyle(fontSize: 20))),
                            Expanded(child: Text(data.ITEMPRICE[index].toString(), style: TextStyle(fontSize: 20))),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(height: 4, thickness: 2, color: Colors.white);
                  },
                  itemCount: data.ITEMQUANTITY.length,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Amount', style: TextStyle(fontSize: 20)),
          SizedBox(width: 10),
          Consumer<AddMemberProvider>(
            builder: (context, data, child) {
              return FloatingActionButton(
                onPressed: () {
                  AmountDisplay(context, data);
                },
                child: Icon(Icons.visibility),
              );
            },
          ),
        ],
      ),
    );
  }
}
