import 'package:flutter/material.dart';
class BuyerIteam extends StatelessWidget {
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
              height: 100,
              child: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/vesatogofleet.appspot.com/o/androidTaskApp%2FsahyadriFarms.png?alt=media&token=b12dd45f-e47a-4d13-aa46-34cd742ef744",
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
                            "https://firebasestorage.googleapis.com/v0/b/vesatogofleet.appspot.com/o/androidTaskApp%2Ftomato.png?alt=media&token=5707768d-f26d-45a0-a6f6-b170127069b5",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Text("Banana "),
                      ],
                    ),
                    Text('21 KM/45 mins')

                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                Text("Sahyadri Farms ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 20),),

              ],
            )
          ],
        ),
      ),
    );
  }
}
