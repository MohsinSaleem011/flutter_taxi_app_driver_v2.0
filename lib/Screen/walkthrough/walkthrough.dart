import 'package:flutter/material.dart';
import 'package:flutter_taxi_app_driver/Components/button_view.dart';
import 'package:flutter_taxi_app_driver/theme/style.dart';
import 'data.dart';

class WalkthroughScreen extends StatefulWidget {

  const WalkthroughScreen({Key? key}) : super(key: key);

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  final ItemsListBuilder itemsListBuilder = ItemsListBuilder();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: DefaultTabController(
          length: itemsListBuilder.itemList.length,
          child: Container(
              color: whiteColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TabBarView(
                        children: itemsListBuilder.itemList.map((Items item) {
                          return Column(
                            key: ObjectKey(item),
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Image.asset(item.image,height: 180.0,)),
                              Text(item.pageNo, style: heading35Black,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 60.0, right: 60.0),
                                child: Text(
                                  item.description,
                                  style: textBoldBlack,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              ButtonTheme(
                                minWidth: screenSize.width*0.43,
                                height: 45.0,
                                child: ButtonView(
                                 title: item.btnDescription,
                                  radius: 8,
                                  onPressed: () {
                                    Navigator.of(context).pushNamedAndRemoveUntil('/use_my_location', (Route<dynamic> route) => false);
                                  },
                                ),
                              ),
                            ],
                          );
                        }).toList()
                    )
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 32.0),
                    child: const TabPageSelector(
                      selectedColor: primaryColor,
                    ),
                  )
                ],
              )
          )
      ),
    );
  }
}
