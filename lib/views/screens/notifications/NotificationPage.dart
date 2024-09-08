import 'package:flutter/material.dart';

class Notificationpage extends StatefulWidget {
  const Notificationpage({super.key});

  @override
  State<Notificationpage> createState() => _NotificationpageState();
}

class _NotificationpageState extends State<Notificationpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Notification",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
              onPressed: (){
              // Search functionality
              },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text("Today", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
          SizedBox(height: 10),
          buildNotificationItem('Mirachel', 'followed you', '12m', true),
          buildNotificationItem('Dinda Mara', 'followed you.', '12m', true),
          buildNotificationItem('Sujiwono, Saroti21 and 15 others', 'liked your video.', '21m', false),

          SizedBox(height: 20),
          Text('Yesterday', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
          SizedBox(height: 10),
          buildNotificationItem('Doni Gabrika', 'followed you.', '12m', false),
          buildNotificationItem('Mirachel, Sujiwono and 15 others', 'liked your video.', '21m', false),
          buildNotificationItem('Dinda Mara, Mirachel and 15 others', 'liked your video.', '21m', false),
          buildNotificationItem('Selena', 'followed you.', '12m', true),
          buildNotificationItem('Papkin11', 'followed you.', '12m', false),
        ],
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0,
      //     selectedItemColor: Colors.purple,
      //     items: const [
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.home),
      //         label: "Home",
      //       ),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.search),
      //         label: "Search",
      //       ),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.add),
      //         label: '',
      //       ),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.article),
      //         label: "Articles",
      //       ),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.person),
      //         label: "Profile"
      //       ),
      //     ] ,
      // ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.purple,
      //     child: const Icon(Icons.add, size: 32),
      //     onPressed: (){
      //     // new post functionality
      //     }
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

Widget buildNotificationItem(String name, String action, String time, bool isFollowing){
  return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey[300],
          child: Icon(Icons.person, color: Colors.white),
        ),
        SizedBox(width: 12),
        Expanded(
            child: RichText(
                text: TextSpan(
                  text: '$name',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  children: [
                    TextSpan(
                      text: '$action',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    TextSpan(
                      text: '$time',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
            ),
        ),
        isFollowing
        ? ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18)
            ),
          ),
            onPressed: (){

            },
            child: Text("Follow"),
        )
            :OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.purple),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
            onPressed: (){
            // Unfollow Functionality
            },
            child: Text(
              "Followed",
              style: TextStyle(color: Colors.purple),
            )
        )
      ],
    ),
  );
}
