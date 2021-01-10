import 'package:flutter/material.dart';
import 'package:flutter_maps/model/crop_iteam_resp.dart';
class SearchIteam extends StatelessWidget {
  CropIteamResp cropIteamResp;


  SearchIteam(this.cropIteamResp);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1,
      child: Card(
        elevation: 2,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 7,),
            SizedBox(
              height: 18,
              child: Image.network(
                cropIteamResp.photo,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 7,),
            Text(cropIteamResp.commodityName)
          ],
        ),
      ),
    );
  }
}
