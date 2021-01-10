import 'package:flutter/material.dart';
import 'package:flutter_maps/model/buyer_iteam_resp.dart';
class BuyerIteam extends StatelessWidget {
  BuyerIteamResp buyerIteamResp;


  BuyerIteam(this.buyerIteamResp);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1,
      child: Card(
        elevation: 2,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //const SizedBox(width: 10,),
            SizedBox(
              height: 80,
              child: Image.network(
                buyerIteamResp.photo,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 15,
                          child: Image.network(
                            buyerIteamResp.cropInfo.photo,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Text( buyerIteamResp.cropInfo.crop),
                      ],
                    ),
                    /*Text('21 KM/45 mins')*/

                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(buyerIteamResp.buyerName,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 20),),

                const SizedBox(
                  height: 3,
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    priceWidget(buyerIteamResp.price[0]),
                    const SizedBox(width: 10,),
                    priceWidget(buyerIteamResp.price[1]),
                    const SizedBox(width: 10,),
                    priceWidget(buyerIteamResp.price[2]),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget priceWidget(Price price){

    return Container(
      color: Color(0x1D000000),
      child: Column(
        children: [
          const SizedBox(height: 5,),
          Text(price.date),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              const SizedBox(width: 5,),
              Text('\u20B9',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w700,fontSize: 20),),
              Text(price.price,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w700,fontSize: 20)),
              Text(price.sku,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w700,fontSize: 10)),
              const SizedBox(width: 5,),
            ],
          ),
          const SizedBox(height: 5,)
        ],
      ),
    );
  }

}
