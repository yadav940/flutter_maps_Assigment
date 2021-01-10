import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/helful/color.dart';
import 'package:flutter_maps/model/buyer_iteam_resp.dart';
import 'package:flutter_maps/model/crop_iteam_resp.dart';
import 'package:flutter_maps/widget/buyer_iteam.dart';
import 'package:flutter_maps/widget/search_iteam.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<dynamic> listCrop;
  List<CropIteamResp> cropIteamRespList=[];
  List<CropIteamResp> cropIteamRespListAll=[];

  List<dynamic> listBuyer;
  List<BuyerIteamResp> buyerIteamRespList=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint('this is Dashboard initState------------');
    getCropList();
    getBuyerList();

  }

  @override
  Widget build(BuildContext context) {
    debugPrint('this is Dashboard build------------');
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Card(
            elevation: 4,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: TextFormField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              //controller: signInProvider.emailTextController,
              enableSuggestions: false,
              autofocus: false,
              onFieldSubmitted: (term) {
                /*signInProvider.emailFocusNode.unfocus();
                            FocusScope.of(context)
                                .requestFocus(signInProvider.passwordFocusNode);*/
              },
              validator: (data) {
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: progressColor)),
                suffixIcon: Icon(Icons.search),
                hintText: 'Search Specific Crop',
                contentPadding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              ),
              onSaved: (searchText) {
                filterCrop(searchText);
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
            itemCount: listCrop !=null?cropIteamRespList.length:0,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio:3),
            itemBuilder: (BuildContext context, int index) {
              return SearchIteam(cropIteamRespList[index]);
            },
          ),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Buyer',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 15),),
          ),
          Expanded(
            //flex: 2,
            child:
            SizedBox(
              height: 120,
              child:GridView.builder(
                itemCount: listBuyer!=null?listBuyer.length:0,
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio:0.33),
                itemBuilder: (BuildContext context, int index) {
                  return BuyerIteam(buyerIteamRespList[index]);
                },
              ),
            ),),

        ],
      ),
    );
  }

  Future<void> getCropList() async {
    var dio = Dio();
    Response receivedJson = await dio.get('https://firebasestorage.googleapis.com/v0/b/vesatogofleet.appspot.com/o/androidTaskApp%2FcommodityList.json?alt=media&token=9b9e5427-8769-4dec-83c4-52afe727dbf9');
    listCrop = receivedJson.data;
    debugPrint('${listCrop.length} ---------------');
    listCrop.forEach((element) {
      cropIteamRespList.add(CropIteamResp.fromJson(element));
      cropIteamRespListAll.add(CropIteamResp.fromJson(element));

    });
    setState(() {

    });
    print(receivedJson.data);
  }
  Future<void> getBuyerList() async {
    var dio = Dio();
    Response receivedJson = await dio.get('https://firebasestorage.googleapis.com/v0/b/vesatogofleet.appspot.com/o/androidTaskApp%2FbuyerList.json?alt=media&token=3dcc96c2-9309-4873-868d-bf0023f6266c');
    listBuyer = receivedJson.data;
    debugPrint('${listCrop.length} ---------------');
    listBuyer.forEach((element) {
      buyerIteamRespList.add(BuyerIteamResp.fromJson(element));
    });
    setState(() {

    });
    print(receivedJson.data);
  }

  void filterCrop(String text){

    cropIteamRespList.clear();
    cropIteamRespListAll.forEach((element) {
      if(element.commodityName.contains(text)){
        cropIteamRespList.add(element);
      }
    });
    setState(() {});
    debugPrint('filterCrop-------- lenth ${cropIteamRespList.length}');
  }
}
