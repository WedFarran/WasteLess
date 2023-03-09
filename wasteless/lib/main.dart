import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/app_theme.dart';

 void main() => runApp(const WasteLess());

class WasteLess extends StatelessWidget {
  const WasteLess({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      title: 'WasteLess',
      home: Scaffold(appBar: AppBar(title:const Text('WasteLess'),),body: Center(child: ElevatedButton(onPressed: (){}, child: const Text('LOGIN') ,),),),
    );
  }
}
