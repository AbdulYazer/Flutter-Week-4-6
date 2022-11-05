import 'package:dukaan/core/styles/styles.dart';
import 'package:flutter/material.dart';

class ManageStore extends StatelessWidget {
  const ManageStore({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor:const Color.fromARGB(255, 224, 222, 222),
        appBar: AppBar(
          title:const Text('Manage Store'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Row(
              children: [
                card(
                  width, 
                  text: 'Marketing \nDesigns', 
                  icon: Icons.volume_mute, 
                  color: Colors.deepOrangeAccent
                ),
                card(
                  width, 
                  text: 'Online \nPayments', 
                  icon: Icons.currency_rupee_sharp, 
                  color: Colors.lightGreen
                ),
              ],
            ),
            Row(
              children: [
                card(
                  width, 
                  text: 'Discount \nCoupons', 
                  icon: Icons.discount_outlined, 
                  color: Colors.orangeAccent
                ),
                card(
                  width, 
                  text: 'My \nCustomers', 
                  icon: Icons.supervisor_account_outlined, 
                  color: Colors.green.shade700
                ),
              ],
            ),
            Row(
              children: [
                card(
                  width, 
                  text: 'Store QR \nCode', 
                  icon: Icons.qr_code_scanner_outlined, 
                  color: Colors.blueGrey.shade600
                ),
                card(
                  width, 
                  text: 'Extra \nCharges', 
                  icon: Icons.account_balance, 
                  color: Colors.blue.shade900
                ),
              ],
            ),
            Row(
              children: [
                card(
                  width, 
                  text: 'Order \nForm', 
                  icon: Icons.format_align_left_outlined, 
                  color: Colors.pink
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

card(double width,{required String text,required IconData icon,required Color color}){
  return Padding(
    padding: const EdgeInsets.only(top: 10,left: 7),
    child: Card(
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Container(
        margin:const EdgeInsets.only(left: 10,right: 10,top: 10),
        width:width * .4,
        height: width * .3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Icon(icon,color: Colors.white,),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(text,style: cardText,),
            ),
          ],
        ),
      ),
    ),
  );
}
