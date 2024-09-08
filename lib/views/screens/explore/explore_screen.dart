import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose(){
    super.initState();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Explore', style: TextStyle(fontSize: 24)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
            onPressed: (){
            Navigator.pop(context);
            },
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14.0),
                ),
              ),
            ),
          ),

          // TabBar
          TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.purple,
            tabs: const [
              Tab(text: 'Hot Audios'),
              Tab(text: 'Most liked'),
              Tab(text: 'Most shared'),
            ],
          ),

          // List of Audios
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                buildAudioList(),
                const Center(child: Text('Most Liked Audios')),
                const Center(child: Text('Most Shared Audios')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Audio List Builder
  Widget buildAudioList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: 10, // Number of items in the list
      itemBuilder: (context, index) {
        return buildAudioTile();
      },
    );
  }

  // Single Audio Tile
  Widget buildAudioTile() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          // child: Icon(
          //   Icons.music_note_outlined,
          //   fill: 50,
          //   weight: 50,
          // ),
          child: Image.asset(
            'assets/images/song_image.png',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: const Text(
          'Dil Galti Kar Betha Hai',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: const Text('Jubin Nautiyal'),
        trailing: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('04:45', style: TextStyle(color: Colors.grey)),
            Icon(Icons.favorite_border, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
