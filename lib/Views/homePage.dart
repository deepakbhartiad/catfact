import 'package:flutter/material.dart';

import '../APIs/Api.dart';
import '../model/model.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var catLoader = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ccaa0d45-4815-4caa-bafc-e6b8973e4b1f/d8jd1ek-5d07ccc6-a47e-4ef8-aa76-ea062d79c648.gif?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2NjYWEwZDQ1LTQ4MTUtNGNhYS1iYWZjLWU2Yjg5NzNlNGIxZlwvZDhqZDFlay01ZDA3Y2NjNi1hNDdlLTRlZjgtYWE3Ni1lYTA2MmQ3OWM2NDguZ2lmIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.m6fAi9UOe3TkyJNhckPcc1tmjp68ovE72ZH0Ha4HX0Q";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492_1280.jpg"))
        ),
        child: FutureBuilder(
        future: APIs.catFactApi(),
        builder: (context,snap){
          if(snap.connectionState == ConnectionState.waiting){
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492_1280.jpg"))
              ),
              child: Center(
                child: Container(
                  height: 100,
                    width: 100,
                  decoration:BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(catLoader)
                    ),
                        border:Border.all(color: Colors.white,width: 3),
                      borderRadius: BorderRadius.circular(60),
                    // boxShadow: [
                    //   BoxShadow(
                    //     // color: Colors.grey,
                    //     offset: Offset(0, 2),
                    //     blurRadius: 6.0,
                    //   ),
                    // ],
                  ),
                ) ,),
            );
          }else if(snap.hasError){
            return Center(child: Text("Error Data"),);
          }else if(snap.hasData){
            factModel data = snap.data!;
            return Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey,
                      //     offset: Offset(0, 2),
                      //     blurRadius: 6.0,
                      //   ),
                      // ],
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 30,vertical: 100),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(child: Text(data.fact.toString(),style: TextStyle(
                        fontWeight: FontWeight.bold,fontSize: 18,
                        color: Colors.black.withOpacity(0.8)
                      ),)),
                    ),
                  ),
                  Positioned(
                    bottom: 2.0,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30,bottom: 20),
                      child: CircleAvatar(
                        child: IconButton(onPressed: (){
                          setState(() {});
                        }, icon: Icon(Icons.arrow_forward_ios_rounded)),
                      ),
                    ),
                  )
                ],
              ),
            );
          }else{
            return Center(child: Text("No Any Fact"),);
          }
        },
    ),
      ),
        );
  }
}
