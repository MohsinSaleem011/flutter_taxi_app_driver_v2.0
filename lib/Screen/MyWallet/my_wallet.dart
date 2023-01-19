import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_taxi_app_driver/Screen/MyWallet/payment.dart';
import 'package:flutter_taxi_app_driver/Screen/widgets.dart';
import 'package:flutter_taxi_app_driver/theme/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_taxi_app_driver/Screen/Menu/menu_screen.dart';
import 'package:flutter_taxi_app_driver/Components/bank_card.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({Key? key}) : super(key: key);

  @override
  _MyWalletState createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  final String screenName = "MY WALLET";
String Config= "\$150.0";

//IconData icon, String title, String date, String balance
  // List<Map<String, dynamic>> listService = [
  //   {"id": '0',"icon" : Icons.phone_android, "title" : "Mobile Recharge","date" : "22-05-2020","balance" : "\$+200"},
  //   {"id": '1',"icon" : Icons.work, "title" : "Freelance word","date" : "19-05-2019","balance" : "\$+200,000"},
  //   {"id": '2',"icon" : Icons.add_shopping_cart, "title" : "Shopping ","date" : "19-05-2019","balance" : "\$ - 20,000"},
  // ];

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('wallet'.tr(),style: TextStyle(color: blackColor),),
        backgroundColor: whiteColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: blackColor),
      ),
      // drawer: MenuScreens(activeScreenName: screenName),
      body: Scrollbar(
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: BankCard(
                card: BankCardModel('assets/image/icon/bg_blue_card.png','Debit Card', 'JOHN',
                    '4221 5168 7464 2283', '08/20', 10000000),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 50.0,bottom: 30.0),
              child: Column(
                children: <Widget>[
                  Text('balance'.tr(),style: textStyle,),
                  Text(Config,style: heading35Primary,),
                ],
              ),
            ),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_){
                  return PaymentMethod();
                }));
              },
              child: Container(
                margin: const EdgeInsets.only(left: 20.0,right: 20.0),
                padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,left: 10.0,right: 10.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x88999999),
                        offset: Offset(0, 5),
                        blurRadius: 5.0,
                      ),
                    ]),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: const BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: const Icon(FontAwesomeIcons.wallet,color: blackColor,),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text("add a new card".tr(),style: textBoldBlack,)
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Icon(Icons.arrow_forward_ios,color: blackColor,),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30.0,bottom: 10.0,left: 20.0),
              child: Text('historycards'.tr(),style: textStyle,),
            ),
           Mylistile(Icons.phone_android, "01-08-2022", 'Mohsin Saleem', "\$200"),
           SizedBox(height: 5,),
           Mylistile(Icons.phone_android, "05-02-2000", 'Zeeshan Tariq ', "\$2000"),
  SizedBox(height: 5,),
           Mylistile(Icons.phone_android, "09-05-2021", 'Sir Qaisar', "\$200000"),
          ],
        ),
      ),
    );
  }

  // Widget historyCard(IconData icon, String title, String date, String balance) {
  //   return Container(
  //     padding: const EdgeInsets.only(
  //         top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
  //     decoration: const BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.all(Radius.circular(10)),
  //         boxShadow: [
  //           BoxShadow(
  //             color: Color(0x88999999),
  //             offset: Offset(0, 5),
  //             blurRadius: 5.0,
  //           ),
  //         ]),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: <Widget>[
  //         Container(
  //           height: 50.0,
  //           width: 50.0,
  //           decoration: const BoxDecoration(
  //             color: primaryColor,
  //             borderRadius: BorderRadius.all(Radius.circular(50)),
  //           ),
  //           child: Icon(icon, color: whiteColor, size: 30.0,),
  //         ),
  //         Expanded(
  //           flex: 4,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               Container(
  //                   padding: const EdgeInsets.only(left: 10.0),
  //                   child: Text(title, style: textBoldBlack,)
  //               ),
  //               Container(
  //                   padding: const EdgeInsets.only(left: 10.0),
  //                   child: Text(date, style: textGrey,)
  //               ),
  //             ],
  //           ),
  //         ),
  //         Expanded(
  //           flex: 2,
  //           child: Container(
  //             alignment: Alignment.centerRight,
  //             child: Text(balance, style: heading18Black,)
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
// }
}
