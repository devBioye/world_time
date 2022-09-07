import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  //const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
List<WorldTime> locations = [
  WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
 // WorldTime(url: 'Africa/Nigeria', location: 'Nigeria', flag: 'nigeria.png'),
  WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
 // WorldTime(url: 'Europe/Germany', location: 'Germany', flag: 'germany.png'),
  WorldTime(url: 'America/New_York', location: 'Chicago', flag: 'usa.png'),
  WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),

];

void updateTime(index) async {
  try {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,


    });
  }
  catch(e){

  }

}


int counter = 0;
  @override
  Widget build(BuildContext context) {
    //print('Programme started successfully');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0.0,
      ),

      body: ListView.builder(itemCount: locations.length,
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 1.0),
          child: Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          ),
        );

      },)

    );
  }
}

