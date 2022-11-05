import 'package:dukaan/core/styles/styles.dart';
import 'package:flutter/material.dart';

class AdditionalInfo extends StatelessWidget {
  const AdditionalInfo({super.key});

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:const Text('Additional Information'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            listTile(
              text: 'Share Dukaan App',
              preIcon: Icons.share_outlined,
              sufIcon:const Icon(Icons.chevron_right,size: 30,)
            ),
            listTile(
              text: 'Change Language',
              preIcon: Icons.translate,
              sufIcon:const Icon(Icons.chevron_right,size: 30,)
            ),
            listTile(
              text: 'Whatsapp Chat Support',
              preIcon: Icons.whatsapp,
              sufIcon: Switch(value: true, onChanged: (value){})
            ),
            listTile(
              text: 'Privacy Policy',
              preIcon: Icons.lock_outline,
            ),
            listTile(
              text: 'Rate Us',
              preIcon: Icons.star_border_outlined,
            ),
            listTile(
              text: 'Sign Out',
              preIcon: Icons.logout_outlined,
            ),
            Expanded(
              child:Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Version',style: textStyle1),
                    const SizedBox(height: 6),
                    Text('2.4.2',style: textStyle2)
                  ],
                ),
              )

              
              
              )
          ],
        ),
      ),
    );
  }
}

ListTile listTile({required String text,required IconData preIcon, Widget? sufIcon }){
  return ListTile(
    leading: Icon(preIcon,size: 30,),
    title: Text(text,style: textStyle,),
    trailing: sufIcon,
  );
}