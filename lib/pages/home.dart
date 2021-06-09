import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map finData = {};

  @override
  Widget build(BuildContext context) {

    finData = finData.isNotEmpty ? finData : ModalRoute.of(context).settings.arguments;
    print(finData);

    String bgImg =  finData['isDay'] ? 'day.png' : 'night.png';
    Color bgColor = finData['isDay'] ? Colors.blue : Colors.indigo[900];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0),
            child: Column(
              children: <Widget> [
                TextButton.icon(
                  onPressed: () async {
                    dynamic finRes = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      finData = {
                        'time': finRes['time'],
                        'location': finRes['location'],
                        'isDay': finRes['isDay'],
                        'flag': finRes['flag'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                      'Edit Location',
                       style: TextStyle(
                         color: Colors.white70,
                         fontSize: 20.0,
                       ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      finData['location'],
                      style: TextStyle(
                        fontSize: 32.0,
                        color: Colors.grey[300],
                        letterSpacing: 2.0,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30.0),
                Text(
                  finData['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
