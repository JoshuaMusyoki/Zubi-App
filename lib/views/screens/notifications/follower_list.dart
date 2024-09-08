import 'package:flutter/material.dart';

class Follower {
   final String name;
   final String imageUrl;
   final String followTime;
  bool isBlocked;

  Follower({required this.name, required this.imageUrl, required this.followTime, this.isBlocked = true});
}

class FollowerList extends StatefulWidget {
  const FollowerList({super.key});

  @override
  _FollowerListState createState() => _FollowerListState();}

class _FollowerListState extends State<FollowerList> {
  List<Follower> followers = [
    Follower(name: 'Mirachel', imageUrl: 'assets/images/Mirachel.png', followTime: '12m'),
    Follower(name: 'Mirachel', imageUrl: 'assets/images/Mirachel.png', followTime: '12m'),
    Follower(name: 'Mirachel', imageUrl: 'assets/images/Mirachel.png', followTime: '12m'),
    Follower(name: 'Mirachel', imageUrl: 'assets/images/Mirachel.png', followTime: '12m'),
    Follower(name: 'Mirachel', imageUrl: 'assets/images/Mirachel.png', followTime: '12m'),
    Follower(name: 'Mirachel', imageUrl: 'assets/images/Mirachel.png', followTime: '12m'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blocked Users"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
            onPressed: (){
            Navigator.pop(context);
            },
        ),
      ),
      body: ListView.builder(
        itemCount: followers.length,
          itemBuilder: (context, index){
          return _buildFollowerItem(followers[index]);
          }
      ),
    );
  }
  Widget _buildFollowerItem(Follower follower) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(follower.imageUrl),
      ),
      title: RichText(
        text: TextSpan(
          text: follower.name,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          children: [
            TextSpan(
              text: ' followed you. ',
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            TextSpan(
              text: follower.followTime,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
      trailing: ElevatedButton(
        onPressed: () {
          setState(() {
            // Toggle the blocked status
            follower.isBlocked = !follower.isBlocked;
          });
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: follower.isBlocked ? Colors.purple : Colors.grey, backgroundColor: follower.isBlocked ? Colors.purple.withOpacity(0.1) : Colors.grey.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: Text(
          follower.isBlocked ? 'UnBlock' : 'Blocked',
          style: TextStyle(color: follower.isBlocked ? Colors.purple : Colors.grey),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FollowerList(),
  ));
}
