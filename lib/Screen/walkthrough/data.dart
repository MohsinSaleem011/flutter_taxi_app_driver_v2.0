import 'package:easy_localization/easy_localization.dart';

class Items {
  final String pageNo, description, btnDescription;
  final String image;
  //IconData icon;

  Items({required this.pageNo,required this.description, required this.image,required this.btnDescription});
}

class ItemsListBuilder {
  List<Items> itemList = [];

  Items item1 = Items(
      pageNo: "acceptjob".tr(),
      description: "lorem Ipsum".tr(),
      image: "assets/image/icon/Layer_4.png",
      btnDescription: "skiptoapp".tr());
  Items item2 = Items(
      pageNo: "trackingrealtime".tr(),
      description: "lorem Ipsum".tr(),      
      image: "assets/image/icon/Layer_5.png",
      btnDescription: "skiptoapp".tr());
  Items item3 = Items(
      pageNo: "earnmoney".tr(),
      description: "lorem Ipsum".tr(),      
      image: "assets/image/icon/Layer_3.png",
      btnDescription: "continuetoapp".tr());

  ItemsListBuilder() {
    itemList.add(item1);
    itemList.add(item2);
    itemList.add(item3);
  }
}
