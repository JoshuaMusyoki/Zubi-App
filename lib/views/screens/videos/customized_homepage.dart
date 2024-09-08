import 'package:flutter/material.dart';
import 'package:zubi/constants.dart';
import 'package:zubi/views/screens/notifications/NotificationPage.dart';
import 'package:zubi/views/screens/videos/zubi_add_video_page.dart';

class CustomizedHomepage extends StatefulWidget {
  const CustomizedHomepage({super.key});

  @override
  State<CustomizedHomepage> createState() => _CustomizedHomepageState();
}

class _CustomizedHomepageState extends State<CustomizedHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.search, color: Colors.black),
            onPressed: (){

            },
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: "Search",
            border: InputBorder.none
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_active, color: Colors.black),
              onPressed: (){
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context)=> const Notificationpage())
              );
              },
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          buildSection(
            // Birthday Section
            title: "Happy Birthday",
            images: [
              'assets/images/birthday1.png',
              'assets/images/birthday2.png'
            ],
          ),
          buildSection(
              // Popular Section
              title: 'Popular',
              images: [
                'assets/images/popular1.png',
                'assets/images/popular2.png'
              ]
          ),
          buildSection(
            // Emotional Section
            title: "Emotional",
            images: [
              'assets/images/emotional1.png',
              'assets/images/emotional2.png'
            ],
          ),
          buildSection(
              // ChristMas Section
              title: 'ChristMas',
              images: [
                'assets/images/christmas1.png',
                 'assets/images/christmas2.png'
              ]
          ),
          buildSection(
            // Funny Section
            title: "Funny",
            images: [
              'assets/images/funny1.png',
               'assets/images/funny2.png'
            ],
          ),
          buildSection(
              // Trending Section
              title: 'Trending',
              images: [
                'assets/images/trending1.png',
                 'assets/images/trending2.png'
              ]
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
              label: "Home"
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.search),
              label: "Search"
            ),
            
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
              label: ''
            ),
            
            BottomNavigationBarItem(
                icon: Icon(Icons.article),
              label: "Articles"
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.person),
              label: "Profile"
            ),
          ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        backgroundColor: customHeaderBg,
        onTap: (index){
        //     Handle Bottom Navigation tab Changes
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
          child: Icon(Icons.add, size: 32),
          onPressed: (){
          // Implementation of add post functionality
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ZubiAddNewVideoPage())
            );
          }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildSection({required String title, required List<String> images}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '# $title',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Implement See All functionality
                },
                child: Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                    width: 150,
                    height: 100,
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
