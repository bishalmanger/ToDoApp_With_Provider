import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../AllModularWidgets/AddMember.dart';
import '../AllModularWidgets/MemberButton.dart';
import '../AllProviderUseProjectDefineProvider/Add_DeleteFile.dart';

class Updateitemlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Item List',
          style: TextStyle(fontSize: 30),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_circle_left_outlined, size: 30),
        ),
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Expanded(child: Text('Sl.no', style: TextStyle(fontSize: 20))),
                  Expanded(child: Text('Name', style: TextStyle(fontSize: 20))),
                  Expanded(child: Text('Quantity', style: TextStyle(fontSize: 20))),
                  Expanded(child: Text('Price', style: TextStyle(fontSize: 20))),
                  Expanded(child: Text('Update', style: TextStyle(fontSize: 20))),
                ],
              ),
            ),
            Expanded(
              child: Consumer<AddMemberProvider>(
                builder: (context, data, child) {
                  if (data.ITEMNAME.isEmpty) {
                    return Center(child: Text('No items available.'));
                  }
                  return ListView.builder(
                    itemCount: data.ITEMNAME.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Expanded(child: Text('${index + 1}', style: TextStyle(fontSize: 20))),
                          Expanded(child: Text(data.ITEMNAME[index], style: TextStyle(fontSize: 20))),
                          Expanded(child: Text(data.ITEMQUANTITY[index].toString(), style: TextStyle(fontSize: 20))),
                          Expanded(child: Text(data.ITEMPRICE[index].toString(), style: TextStyle(fontSize: 20))),
                          Expanded(
                            child: IconButton(
                              onPressed: () {
                                // Pass the index to the update function
                                UpdateitemlistFun(context, index, data.ITEMNAME[index], data.ITEMQUANTITY[index], data.ITEMPRICE[index]);
                              },
                              icon: Icon(Icons.update),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void UpdateitemlistFun(BuildContext context, int index, dynamic itemName, dynamic itemQuantity, dynamic itemPrice) {
    TextEditingController iname = TextEditingController(text: itemName);
    TextEditingController iquantity = TextEditingController(text: itemQuantity.toString());
    TextEditingController iprice = TextEditingController(text: itemPrice.toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('Update Details')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFieldWidget(icon: Icons.border_color_sharp, inputController: iname),
              CustomTextFieldWidget(icon: Icons.border_color_sharp, inputController: iquantity),
              CustomTextFieldWidget(icon: Icons.currency_rupee, inputController: iprice),
            ],
          ),
          actions: [
            MemberButton(
              text: Text('Update'),
              backgroundColor: Colors.grey,
              callBack: () {
                String updateName = iname.text;
                String updateQuantity = iquantity.text;
                String updatePrice = iprice.text;

                if (updateName.isNotEmpty && updateQuantity.isNotEmpty && updatePrice.isNotEmpty) {
                  // Use the index to update the provider
                  Provider.of<AddMemberProvider>(context, listen: false).UpdateMembers(index, updateName, double.parse(updateQuantity), double.parse(updatePrice));
                  Navigator.pop(context);
                } else {
                  print('Update Data Properly');
                }
              },
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Text('Cancel', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
