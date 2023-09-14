import 'package:flutter/material.dart';
import 'package:recipes/utils/constants.dart';

class  UserDrawer extends StatelessWidget {
  const UserDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(

      child: ListView(
        children:const [
           DrawerHeader(
             child: FlutterLogo()
           ),
          ListTile(
            title: Text("Accueil"),
            leading: Icon(Icons.home,color: appColor,),
            trailing: Icon(Icons.more_horiz,color: appColor,),
          ),
          Divider(color: Colors.grey,height: 2),
           ListTile(
            title: Text("favoris"),
            leading: Icon(Icons.favorite,color: appColor,),
            trailing: Icon(Icons.more_horiz,color: appColor,),
          ),
          Divider(color: Colors.grey,height: 2),
           ListTile(
            title: Text("Recettes"),
            leading: Icon(Icons.fastfood,color: appColor,),
            trailing: Icon(Icons.more_horiz,color: appColor,),
          ),
          Divider(color: Colors.grey,height: 2),
           ListTile(
            title: Text("Deconection"),
            leading: Icon(Icons.logout,
            color: appColor,),
            trailing: Icon(Icons.more_horiz,color: appColor,),
          ),
          Divider(color: Colors.deepOrange,height: 2),


        ],
      ),
    );
  }
}
