import 'package:dukaan/presentation/Additional%20Info/additional_info_widget.dart';
import 'package:dukaan/presentation/Catalouge/catalouge.dart';
import 'package:dukaan/presentation/Order_details/order_details.dart';
import 'package:dukaan/presentation/Payments/payments_widget.dart';
import 'package:dukaan/presentation/dukaan_premium/dukaan_premium.dart';
import 'package:dukaan/presentation/manage_store/manage_store_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:const Text('Home Screen'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            home(
              context, 
              text: 'Dukaan Premium', 
              icon: Icons.chevron_right_outlined,
              ontap:const DukaanPremium(),
            ),
            home(
              context, 
              text: 'Manage Store', 
              icon: Icons.chevron_right_outlined,
              ontap:const ManageStore(),
            ),
            home(
              context, 
              text: 'Additional Informations', 
              icon: Icons.chevron_right_outlined,
              ontap:const AdditionalInfo(),
            ),
            home(
              context, 
              text: 'Catalouge', 
              icon: Icons.chevron_right_outlined,
              ontap:const Catalouge(),
            ),
            home(
              context, 
              text: 'Order Details', 
              icon: Icons.chevron_right_outlined,
              ontap:const OrderDetails(),
            ),
            home(
              context, 
              text: 'Payments', 
              icon: Icons.chevron_right_outlined,
              ontap:const Payments(),
            ),
          ],
        ),
      ),
    );
  }
}

ListTile home(BuildContext context,{required String text,required IconData icon,required Widget ontap}){
  return ListTile(
          title: Text(text,style: TextStyle(fontSize: 20),),
          trailing: Icon(icon),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: ((context) => ontap)))
  );
}
