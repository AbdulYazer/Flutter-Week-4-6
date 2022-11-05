import 'package:dukaan/core/styles/styles.dart';
import 'package:flutter/material.dart';

class Payments extends StatelessWidget {
  const Payments({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          title:const Text('Payments'),
          centerTitle: true,
          actions: const [
             Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.info_outline),
            ),
          ],
        ),
        body:Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Center(child: card1()),
              Padding(
                padding: const EdgeInsets.only(left: 5,right: 5,top: 20,bottom: 10),
                child: col2(
                  text1: 'Default Method', 
                  text2: 'Online Payments', 
                  icon1: Icons.chevron_right
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5,right: 5,top: 20,bottom: 10),
                child: col2(
                  text1: 'Payment Profile', 
                  text2: 'Bank Account', 
                  icon1: Icons.chevron_right
                ),
              ),
              divide,
              Padding(
                padding: const EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 10),
                child: col2(
                  text1: 'Payments Overview', 
                  text2: 'Life Time', 
                  icon1: Icons.arrow_drop_down_outlined
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  card2(
                    width: width, 
                    text1: 'AMOUNT ON HOLD', 
                    text2: '₹0',
                    color2: Colors.orange,
                  ),
                  card2(
                    width: width, 
                    text1: 'AMOUNT RECIEVED', 
                    text2: '₹13,332',
                    color2: Colors.green,
                  ),
                ],
              ),
              height1,
              Text('Transactions',style: listtext,),
              height1,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  transactionButtons(
                    text: const Text('On hold',style: TextStyle(color: Colors.black38,fontSize: 17),), 
                    color: Colors.white54,
                  ),
                  transactionButtons(
                    text:const Text('Payouts(15)',style: TextStyle(color: Colors.white,fontSize: 17),), 
                    color:const Color.fromRGBO(7, 55, 138, 0.7),
                  ),
                  transactionButtons(
                    text:const Text('Refunds',style: TextStyle(color: Colors.black38,fontSize: 17),), 
                    color: Colors.white54,
                  ),
                ],
              ),
              orders(
                orderNo: 'Order #1688068', 
                date: 'Jul 12, 02:06 PM', 
                price: '₹799', 
                text: '₹799 deposited to 58860200000138', 
                image: 'assets/images/tshirt.jpeg',
              ),
              divide,
              orders(
                orderNo: 'Order #1457741', 
                date: 'April 26, 07:47 AM', 
                price: '₹397.4', 
                text: '₹397.4 deposited to 58860200000138', 
                image: 'assets/images/cup.jpeg',
              ),
              divide,
              orders(
                orderNo: 'Order #1408896', 
                date: 'April 11, 10:54 AM', 
                price: '₹686.42', 
                text: '₹686.42 deposited to 58860200000138', 
                image: 'assets/images/files.jpeg',
              ),
              divide,
              orders(
                orderNo: 'Order #1369633', 
                date: 'April 02, 11:29 AM', 
                price: '₹1,29,999', 
                text: '₹1,29,999 deposited to 58860200000138', 
                image: 'assets/images/iphone.jpeg',
              ),


            ],
          ),
        ), 
      ),
    );
  }
}


Card card1(){
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),side:const BorderSide(color: Colors.black12)),
    child: Container(
      width: 500,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Transaction Limit',style: card1Text1,),
            height1,
            Text('A free limit up to  which you will receive \nthe online payments directly in your bank',style: card1Text2,),
            height2,
            SizedBox(
              height: 7,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:const LinearProgressIndicator(
                  value: .28,
                  color: color1,
                  backgroundColor: Colors.black12,
                ),
              ),
            ),
            height1,
            Text('36,668 left out of ₹50,000',style: card1Text3,),
            height3,
            ElevatedButton(
              onPressed: (){}, 
              child:const Text('Increase limit'),
              style: ElevatedButton.styleFrom(
                backgroundColor: color1
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Column col2({required String text1,required String text2,required IconData icon1}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text1,style: listtext,),
          Row(
            children: [
              Text(text2,style:card1Text2,),
              Icon(icon1,size: 30,),
            ],
          )
        ],
      )
    ],
  );
}

Card card2({required double width,required String text1,required String text2,required Color color2}){
  return Card(
    child:Container(
      width: width * .45,
      height: width * .24,
      decoration: BoxDecoration(
        color: color2,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Padding(
        padding: const EdgeInsets.only(top:15,left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text1,style: card2text1,),
            height1,
            Text(text2,style: card2text2,),
            
          ],
        ),
      ),
    ),
    

  );
}

Row transactionButtons({Widget? text,required Color color}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: color,
        ), 
        child: text )
    ],
  );
}

Column orders({required String orderNo,required String date,required String price,required String text,required String image}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ListTile(
        contentPadding:const EdgeInsets.only(left:10),
        leading:Container(
          width: 50,height: 60,
          decoration: BoxDecoration(border: Border.all(color: Colors.black54),),
          child: Image(image:AssetImage(image),),
        ),
        title: Text(orderNo,style:listTile1,),
        subtitle: Text(date),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(price,style: price1,),
            height1,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(radius: 5,backgroundColor: Colors.green,),
                const SizedBox(width: 5),
                Text(success,style: card1Text2,),
              ],
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10,bottom: 5),
        child: Text(text,style: orderText3,),
      )
    ],
  );
}