import 'package:flutter/material.dart';
class SearchIteam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1,
      child: Card(
        elevation: 2,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 10,),
            SizedBox(
              height: 20,
              child: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/vesatogofleet.appspot.com/o/androidTaskApp%2Fbanana.png?alt=media&token=77d836a0-7bda-439b-94d1-a022b9781949",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10,),
            Text("Banana ")
          ],
        ),
      ),
    );
  }
}
