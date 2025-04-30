import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../AllModularWidgets/AddMember.dart';
import '../AllModularWidgets/MemberButton.dart';
import '../AllProviderUseProjectDefineProvider/Add_DeleteFile.dart';
// Make sure to import your provider

class AddMember extends StatelessWidget {
  final TextEditingController ItemNameController = TextEditingController();
  final TextEditingController ItemQuantityController = TextEditingController();
  final TextEditingController ItemPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(child: Text('Add Groceries',style: TextStyle(fontSize: 30),)),
        leading: IconButton(
            onPressed: (){
               Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_circle_left_outlined,size: 34,)
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(1.0),
        child: Column(
          children: [
            CustomTextFieldWidget(
              icon: Icons.border_color_sharp,
              hintText: 'Enter Item',
              inputController: ItemNameController,
            ),
            CustomTextFieldWidget(
              icon: Icons.border_color_sharp,
              hintText: 'Enter Quantity',
              inputController: ItemQuantityController,
            ),
            CustomTextFieldWidget(
              icon: Icons.currency_rupee,
              hintText: 'Enter Price',
              inputController: ItemPriceController,
            ),
            MemberButton(
              backgroundColor: Colors.blueAccent,
              callBack: () {
                String itemName = ItemNameController.text.trim();
                String itemPrice = ItemPriceController.text.trim();
                String itemQuantity = ItemQuantityController.text.trim();

                // Check if strings are empty
                if (itemName.isEmpty || itemPrice.isEmpty || itemQuantity.isEmpty) {
                  // Show error or handle accordingly
                  return;// or display a message
                }

                var totalPerItem = 0.0;

                // Attempt to parse price and quantity
                try {
                  double convertPrice = double.parse(itemPrice);
                  double convertQuantity = double.parse(itemQuantity);
                  totalPerItem = convertPrice * convertQuantity;
                } catch (e) {
                  // Handle parsing error (e.g., show a message)
                  return; // or display an error message
                }

                // Call the add method if parsing is successful
                Provider.of<AddMemberProvider>(context, listen: false).AddMember(itemName, itemQuantity, totalPerItem);

                // Clear the text fields
                ItemNameController.clear();
                ItemPriceController.clear();
                ItemQuantityController.clear();
              },
              text: Text('Add Sum', style: TextStyle(fontSize: 30, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
