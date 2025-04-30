import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../AllProviderUseProjectDefineProvider/Add_DeleteFile.dart';
import '../AllProviderUseProjectScreen/HomeScreen.dart';

void main()
{
     runApp(Demo());
}
class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
         ChangeNotifierProvider(create: (_) => AddMemberProvider()),
         //ChangeNotifierProvider(create: (_)=>UpdateItemProvider())
    ],
    child: MaterialApp(home: DemoAppHomePageProvider(),debugShowCheckedModeBanner: false,),
    );
  }
}
