import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../theme/style.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ItemRequest extends StatelessWidget {
  final String avatar;
  final String userName;
  final String date;
  final String price;
  final String distance;
  final String addFrom;
  final String addTo;
  final VoidCallback onTap;
  final LatLng? locationForm;
  final LatLng? locationTo;

  const ItemRequest({
    Key? key,
    required this.avatar,
    required this.userName,
    required this.date,
    required this.price,
    required this.distance,
    required this.addFrom,
    required this.addTo,
    required this.onTap,
    this.locationForm,
    this.locationTo

}): super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Card(
      margin: EdgeInsets.all(10.0),
      elevation: 10.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
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
                      imageUrl: avatar,
                      fit: BoxFit.cover,
                      width: 50.0,
                      height: 50.0,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(userName,
                        style: textBoldBlack,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(date,
                        style: textGrey,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 25.0,
                              padding: EdgeInsets.all(5.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: primaryColor
                              ),
                              child: Text('ApplePay',style: textBoldWhite,),
                            ),
                            SizedBox(width: 10),
                            Container(
                              height: 25.0,
                              padding: EdgeInsets.all(5.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: primaryColor
                              ),
                              child: Text('Discount',style: textBoldWhite,),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(price,style: textBoldBlack,),
                      Text(distance,style: textGrey,),
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
                      Text(addFrom,
                        style: textStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Divider(),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("DROP OFF".toUpperCase(),style: textGreyBold,),
                        Text(addTo,
                          style: textStyle,
                          overflow: TextOverflow.ellipsis,
                        ),

                      ],
                    ),
                  ),
                ],
              )
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0,right: 10.0),
            child: ButtonTheme(
              minWidth: screenSize.width ,
              height: 45.0,
              child: MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                elevation: 0.0,
                color: primaryColor,
                child: Text('Accept',style: headingWhite,
                ),
                onPressed: onTap,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
