import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  //const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  //String time = 'loading';

  void setupWorldTime() async {
    try {
      WorldTime instance = WorldTime(
          location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
      await instance.getTime();
      Navigator.pushReplacementNamed((context), '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDaytime': instance.isDaytime,

      });
    }
    catch(e)
    {
      Navigator.pushReplacementNamed(context, '/choose_location');
    }

  }

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();

    setupWorldTime();
    //print('Programme ran');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      body: Center(
        child: SpinKitFadingCircle(
          itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
    decoration: BoxDecoration(
    color: index.isEven ? Colors.red : Colors.green,
    ),
    );
    },
    ),



      ),
    );
  }
}
