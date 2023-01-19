import 'package:flutter/material.dart';
import 'package:flutter_taxi_app_driver/Components/ink_well_custom.dart';
import 'package:flutter_taxi_app_driver/theme/style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HistoryDetail extends StatefulWidget {
  final String id;

  const HistoryDetail({Key? key, required this.id}) : super(key: key);

  @override
  _HistoryDetailState createState() => _HistoryDetailState();
}

class _HistoryDetailState extends State<HistoryDetail> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String? yourReview;
  double? ratingScore;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

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
      bottomNavigationBar: ButtonTheme(
        minWidth: screenSize.width,
        height: 45.0,
        child: MaterialButton(
          elevation: 0.0,
          color: primaryColor,
          child: Text('Submit',style: headingWhite,
          ),
          onPressed: (){
            Navigator.of(context).pushReplacementNamed('/history');
            //and
            Navigator.popAndPushNamed(context, '/history');
          },
        ),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: InkWellCustom(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Container(
              color: greyColor,
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: CachedNetworkImage(
                            imageUrl: 'https://source.unsplash.com/1600x900/?portrait',
                            fit: BoxFit.cover,
                            width: 40.0,
                            height: 40.0,
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          flex: 5,
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
                    color: whiteColor,
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
                          const Divider(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("note".toUpperCase(),style: textGreyBold,),
                              Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry",style: textStyle,),
                            ],
                          ),
                        ],
                      )
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0,bottom: 5.0),
                    padding: const EdgeInsets.all(10),
                    color: whiteColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Bill Details (Cash Payment)".toUpperCase(), style: textGreyBold,),
                        Container(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Ride Fare", style: textStyle,),
                              Text("\$10.99", style: textBoldBlack,),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Taxes", style: textStyle,),
                              Text("\$1.99", style: textBoldBlack,),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Discount", style: textStyle,),
                              Text("- \$5.99", style: textBoldBlack,),
                            ],
                          ),
                        ),
                        Container(
                          width: screenSize.width - 50.0,
                          height: 1.0,
                          color: Colors.grey.withOpacity(0.4),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Total Bill", style: heading18Black,),
                              Text("\$7.49", style: heading18Black,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Container(
                      //margin: EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(10.0),
                      color: whiteColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          /// todo
                          // RatingBar(
                          //   itemBuilder: (context, index) => Icon(
                          //     Icons.star,
                          //     color: Colors.amber,
                          //   ),
                          //   itemSize: 20.0,
                          //   itemCount: 5,
                          //   glowColor: Colors.white,
                          //   onRatingUpdate: (rating) {
                          //     ratingScore = rating;
                          //     print(rating);
                          //   },
                          //   ratingWidget: null,
                          // ),
                          Container(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: SizedBox(
                              height: 100.0,
                              child: TextField(
                                style: textStyle,
                                decoration: InputDecoration(
                                  hintText: "Write your review",
//                                hintStyle: TextStyle(
//                                  color: Colors.black38,
//                                  fontFamily: 'Akrobat-Bold',
//                                  fontSize: 16.0,
//                                ),
                                  border: OutlineInputBorder(
                                      borderRadius:BorderRadius.circular(5.0)),
                                ),
                                maxLines: 2,
                                keyboardType: TextInputType.multiline,
                                onChanged: (String value) { setState(() => yourReview = value );},
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
