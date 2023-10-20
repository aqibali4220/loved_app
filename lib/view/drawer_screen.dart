import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class DrawerScreen extends StatelessWidget {
   DrawerScreen({super.key});
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: Drawer(
        elevation: 16,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: const AlignmentDirectional(-0.05, 0),
              child: Container(
                width: 100,
                height: 150,
                decoration: const BoxDecoration(),
                alignment:
                const AlignmentDirectional(0, -0.09999999999999998),
              ),
            ),
            const ListTile(
              title: Text(
                'Personal Safety',
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF303030),
                size: 20,
              ),
              tileColor: Color(0xFFF5F5F5),
              dense: false,
            ),

          ],
        ),
      ),
    );
  }
}
