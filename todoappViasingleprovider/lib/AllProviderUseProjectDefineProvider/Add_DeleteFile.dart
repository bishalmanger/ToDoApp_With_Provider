import 'package:flutter/cupertino.dart';

class AddMemberProvider extends ChangeNotifier
{
   List<dynamic> _ItemName = [];
   List<dynamic> _ItemQuantity = [];
   List<dynamic> _ItemPrice = [];

   List<dynamic> get ITEMNAME => _ItemName;
   List<dynamic> get ITEMPRICE => _ItemPrice;
   List<dynamic> get ITEMQUANTITY => _ItemQuantity;

   void AddMember(dynamic itemname, dynamic itemquantity, dynamic itemprice)
   {
        _ItemName.add(itemname);
        _ItemPrice.add(itemprice);
        _ItemQuantity.add(itemquantity);
        notifyListeners();
        print(_ItemName);
        print(_ItemPrice);
        print(_ItemQuantity);
   }
   void UpdateMembers(int index, dynamic Newitemname, dynamic Newitemquantity, dynamic Newitemprice) {
     print('Trying to update item: $Newitemname');
     print('Current Items: $_ItemName');
     print('Calculated index: $index');

     if (index == -1) {
       print('Item not found. Cannot update.');
       return; // Handle the error appropriately
     }

     // Update the lists only if the index is valid
     print(Newitemquantity.runtimeType);
     print(Newitemprice.runtimeType);
     double UpdatePrice = Newitemquantity * Newitemquantity;
     _ItemName[index] = Newitemname;
     _ItemQuantity[index] = Newitemquantity;
     _ItemPrice[index] = UpdatePrice;
     notifyListeners();
   }


   void DeleteMembers(int index, dynamic itemname, dynamic itemquantity, dynamic itemprice,)
   {
       _ItemName.remove(_ItemName[index]);
       _ItemPrice.remove(_ItemPrice[index]);
       _ItemQuantity.remove(_ItemQuantity[index]);
       notifyListeners();
       print(_ItemName);
       print(_ItemPrice);
       print(_ItemQuantity);
   }
}