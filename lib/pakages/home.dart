import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Map data ={};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty?data :ModalRoute.of(context)?.settings.arguments as Map;
    print(data);


    //set background
    String bgimage= data['isDaytime'] ? 'dayimage.png' : 'nightimage';
     Color? bgcolor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgimage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget> [
                TextButton.icon(
                    onPressed: () async {
                      dynamic result=await Navigator.pushNamed(context,'/location');
                      setState(() {
                        data= {
                          'time': result['time'],
                          'location' : result['location'],
                          'isDaytime' : result['isDaytime'],
                          'flag' : result['flag']
                        };
                      });
                    },
                    icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey[300],
                    ),
                    label: Text(
                      'edit location'



                    )
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white,

                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
