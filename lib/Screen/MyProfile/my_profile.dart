import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_app_driver/Components/ink_well_custom.dart';
import 'package:flutter_taxi_app_driver/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_taxi_app_driver/Components/input_dropdown.dart';

const double _kPickerSheetHeight = 216.0;

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final GlobalKey<FormState>? formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, dynamic>> listGender = [{"id": '0',"name" : 'Male',},{"id": '1',"name" : 'Female',}];
  String? selectedGender;
  String? lastSelectedValue;
  DateTime date = DateTime.now();
  var _image;

  Future getImageLibrary() async {
    ///todo
    // var gallery = await ImagePicker(source: ImageSource.gallery,maxWidth: 700);
    // setState(() {
    //   _image = gallery;
    // });
  }

  Future cameraImage() async {
    // var image = await ImagePicker.pickImage(source: ImageSource.camera,maxWidth: 700);
    // setState(() {
    //   _image = image;
    // });
  }


  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: _kPickerSheetHeight,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }

  void showDemoActionSheet({required BuildContext context,required Widget child}) {
    showCupertinoModalPopup<String>(
      context: context,
      builder: (BuildContext context) => child,
    ).then((value) {
      if (value != null) {
        setState(() { lastSelectedValue = value; });
      }
    });
  }

  selectCamera () {
    showDemoActionSheet(
      context: context,
      child: CupertinoActionSheet(
          title: const Text('Select Camera'),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: const Text('Camera'),
              onPressed: () {
                Navigator.pop(context, 'Camera');
                cameraImage();
              },
            ),
            CupertinoActionSheetAction(
              child: const Text('Photo Library'),
              onPressed: () {
                Navigator.pop(context, 'Photo Library');
                getImageLibrary();
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text('Cancel'),
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context, 'Cancel');
            },
          )
      ),
    );
  }

  submit(){
    // final FormState form = formKey!.currentContext;
    // form.save();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: whiteColor,
        title: const Text(
          'My profile',
          style: TextStyle(color: blackColor),
        ),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: InkWellCustom(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: Form(
                key: formKey,
                child: Container(
                  color: const Color(0xffeeeeee),
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: whiteColor,
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.only(bottom: 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Material(
                              elevation: 5.0,
                              borderRadius: BorderRadius.circular(50.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child:_image == null
                                      ?GestureDetector(
                                      onTap: (){selectCamera();},
                                      child: Container(
                                          height: 80.0,
                                          width: 80.0,
                                          color: primaryColor,
                                          child: Image.asset('assets/image/icon/avatar.png',fit: BoxFit.cover, height: 80.0,width: 80.0,)
                                      )
                                  ): GestureDetector(
                                      onTap: () {selectCamera();},
                                      child: SizedBox(
                                        height: 80.0,
                                        width: 80.0,
                                        child: Image.file(_image,fit: BoxFit.cover, height: 800.0,width: 80.0,),
                                      )
                                  )
                              ),
                            ),
                            Expanded(
                              child: Container(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  TextField(
                                    style: textStyle,
                                    decoration: InputDecoration(
                                        fillColor: whiteColor,
                                        labelStyle: textStyle,
                                        hintStyle: const TextStyle(color: Colors.white),
                                        counterStyle: textStyle,
                                        hintText: "name".tr(),
                                        border: const UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white))),
                                    controller:
                                        TextEditingController.fromValue(
                                      const TextEditingValue(
                                        text: "Name",
                                        selection: TextSelection.collapsed(
                                            offset: 11),
                                      ),
                                    ),
                                    onChanged: (String _firstName) {

                                    },
                                  ),
                                  // TextField(
                                  //   style: textStyle,
                                  //   decoration: InputDecoration(
                                  //       fillColor: whiteColor,
                                  //       labelStyle: textStyle,
                                  //       hintStyle: const TextStyle(color: Colors.white),
                                  //       counterStyle: textStyle,
                                  //       hintText: "Last Name",
                                  //       border: const UnderlineInputBorder(
                                  //           borderSide:
                                  //               BorderSide(color: Colors.white))),
                                  //   controller:
                                  //       TextEditingController.fromValue(
                                  //     const TextEditingValue(
                                  //       text: "Last Name",
                                  //       selection: TextSelection.collapsed(
                                  //           offset: 11),
                                  //     ),
                                  //   ),
                                  //   onChanged: (String _lastName) {

                                  //   },
                                  // ),
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                      Container(
                        color: whiteColor,
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      "phonenumber".tr(),
                                      style: textStyle,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: TextField(
                                    style: textStyle,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                        fillColor: whiteColor,
                                        labelStyle: textStyle,
                                        hintStyle: const TextStyle(color: Colors.white),
                                        counterStyle: textStyle,
                                        border: const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white))
                                    ),
                                    controller: TextEditingController.fromValue(
                                      const TextEditingValue(
                                        text: "03584565656",
                                        selection: TextSelection.collapsed(
                                            offset: 11),
                                      ),
                                    ),
                                    onChanged: (String _phone) {

                                    },
                                  ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      "emial".tr(),
                                      style: textStyle,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    style: textStyle,
                                    decoration: InputDecoration(
                                        fillColor: whiteColor,
                                        labelStyle: textStyle,
                                        hintStyle:
                                        const TextStyle(color: Colors.white),
                                        counterStyle: textStyle,
                                        border: const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white))
                                    ),
                                    controller: TextEditingController.fromValue(
                                      const TextEditingValue(
                                        text: "abc@example.com",
                                        selection: TextSelection.collapsed(
                                            offset: 11),
                                      ),
                                    ),
                                    onChanged: (String _email) {

                                    },
                                  ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      "gender".tr(),
                                      style: textStyle,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: DropdownButtonHideUnderline(
                                      child: InputDecorator(
                                        decoration: const InputDecoration(
                                        ),
                                        isEmpty: selectedGender == null,
                                        child: DropdownButton<String>(
                                          hint: Text("gender".tr(),style: textStyle,),
                                          value: selectedGender,
                                          isDense: true,
                                          onChanged: (newValue) {
                                            setState(() {
                                              selectedGender = newValue;
                                            });
                                          },
                                          items: listGender.map((value) {
                                            return DropdownMenuItem<String>(
                                              value: value['id'],
                                              child: Text(value['name'],style: textStyle,),
                                            );
                                          }).toList(),
                                        ),
                                      )
                                  ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      'birthday'.tr(),
                                      style: textStyle,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child:  GestureDetector(
                                      onTap: () {
                                        showCupertinoModalPopup<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return _buildBottomPicker(
                                              CupertinoDatePicker(
                                                mode: CupertinoDatePickerMode.date,
                                                initialDateTime: date,
                                                onDateTimeChanged: (DateTime newDateTime) {
                                                  setState(() {
                                                    date = newDateTime;
                                                  });
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: InputDropdown(
                                        valueText: DateFormat.yMMMMd().format(date),
                                        valueStyle: const TextStyle(color: blackColor),
                                        onPressed: () {  },
                                        labelText: '',
                                        child: const SizedBox(),
                                      )
                                  ),
                                )
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: ButtonTheme(
                                height: 45.0,
                                minWidth: MediaQuery.of(context).size.width-50,
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                  elevation: 0.0,
                                  color: primaryColor,
                                  // icon: const Text(''),
                                  child: Text('Save'.tr(), style: headingBlack,),
                                  onPressed: (){
                                    submit();
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ),
        ),
      ),
    );
  }
}
