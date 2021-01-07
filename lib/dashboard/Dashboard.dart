import 'package:flutter/material.dart';
import 'package:flutter_maps/helful/color.dart';
import 'package:flutter_maps/widget/buyer_iteam.dart';
import 'package:flutter_maps/widget/search_iteam.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
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
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
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
              onSaved: (email) {},
            ),
          ),
          Flexible(
            flex: 3,
            child: GridView.builder(
            itemCount: 6,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio:3),
            itemBuilder: (BuildContext context, int index) {
              return SearchIteam();
            },
          ),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Buyer',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 15),),
          ),
          Flexible(
            flex: 2,
            child:
            SizedBox(
              height: 120,
              child:GridView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio:0.33),
                itemBuilder: (BuildContext context, int index) {
                  return BuyerIteam();
                },
              ),
            ),),

        ],
      ),
    );
  }
}
