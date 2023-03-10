import 'package:flutter/material.dart';
import 'package:flutter_taxi_app_driver/theme/style.dart';
import 'package:flutter_taxi_app_driver/Screen/Menu/menu_screen.dart';
import 'history_detail.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:cached_network_image/cached_network_image.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final String screenName = "HISTORY";
  DateTime? selectedDate;
  List<dynamic> event = [];
  String selectedMonth = '';

  navigateToDetail(String id) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HistoryDetail(id: id,)));
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History',
          style: TextStyle(color: blackColor),
        ),
        backgroundColor: whiteColor,
        elevation: 2.0,
        iconTheme: const IconThemeData(color: blackColor),
      ),
      // drawer: MenuScreens(activeScreenName: screenName),
      body: Column(
        children: <Widget>[
          Container(
            height: 120.0,
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CalendarCarousel(
              weekendTextStyle: const TextStyle(
                color: Colors.red,
              ),
                headerTextStyle: const TextStyle(
                color: Colors.black45
              ),
                inactiveWeekendTextStyle: const TextStyle(
                  color: Colors.black45
                ),
              headerMargin: const EdgeInsets.all(0.0),
              thisMonthDayBorderColor: Colors.grey,
              weekFormat: true,
              height: 150.0,
              selectedDateTime: DateTime.now(),
              selectedDayBorderColor: blue1,
              selectedDayButtonColor: blue2,
              todayBorderColor: primaryColor,
              todayButtonColor: primaryColor,
              onDayPressed: (DateTime date, List<dynamic> events) {
                setState(() => selectedDate = date);
                print(selectedDate);
              },
              onCalendarChanged: (DateTime date) {
                setState(() => selectedMonth = DateFormat.yMMM().format(date));
                print(selectedMonth);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.deepPurple,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    height: 80,
                    width: screenSize.width*0.4,
                    child: Row(
                      children: <Widget>[
                        const Icon(Icons.content_paste,size: 30.0,),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Job",style: heading18,),
                            Text("20",style: headingWhite,)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10.0,),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.deepPurple,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    height: 80,
                    width: screenSize.width*0.4,
                    child: Row(
                      children: <Widget>[
                        const Icon(Icons.attach_money,size: 30.0,),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Earning",style: heading18,),
                            Text("20",style: headingWhite,)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Scrollbar(
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          print('$index');
                          navigateToDetail(index.toString());
                        },
                        child: historyItem()
                    );
                  }
              ),
            ),
          ),
        ],
      )
    );
  }

  Widget historyItem() {
    return Card(
        margin: const EdgeInsets.all(10.0),
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: CachedNetworkImage(
                          imageUrl: 'https://source.unsplash.com/1600x900/?portrait',
                          fit: BoxFit.cover,
                          width: 40.0,
                          height: 40.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Olivia Nastya',style: textBoldBlack,),
                          Text("08 Jan 2019 at 12:00 PM", style: textGrey,),
                          Row(
                            children: <Widget>[
                              Container(
                                height: 25.0,
                                padding: const EdgeInsets.all(5.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: primaryColor
                                ),
                                child: Text('ApplePay',style: textBoldWhite,),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                height: 25.0,
                                padding: const EdgeInsets.all(5.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: primaryColor
                                ),
                                child: Text('Discount',style: textBoldWhite,),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text("\$ 250.0",style: textBoldBlack,),
                          Text("2.2 Km",style: textGrey,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("PICK UP".toUpperCase(),style: textGreyBold,),
                        Text("2536 Flying Taxicabs",style: textStyle,),

                      ],
                    ),
                    const Divider(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("DROP OFF".toUpperCase(),style: textGreyBold,),
                        Text("2536 Flying Taxicabs",style: textStyle,),

                      ],
                    ),

                  ],
                )
              ),
            ],
          ),
        ),
      );
  }
}
