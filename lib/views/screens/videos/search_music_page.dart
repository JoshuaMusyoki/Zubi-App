import 'package:flutter/material.dart';
import 'package:zubi/models/music/Music.dart';
import 'package:zubi/services/youtube_music_service.dart';

class SearchMusicPage extends StatefulWidget {
  const SearchMusicPage({super.key});


  @override
  _SearchMusicPageState createState() => _SearchMusicPageState();
}

class _SearchMusicPageState extends State<SearchMusicPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  final YouTubeMusicService _youTubeMusicService = YouTubeMusicService();
  List<Music> _musicList = [];

  @override
  void initState(){;
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Search Music"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        bottom: TabBar(
          controller: _tabController,
            tabs: const [
              Tab(text: 'Library',),
              Tab(text: 'Dialogue',),
              Tab(text: 'Favourite',)
            ]
        ),
        backgroundColor: Colors.purple,
      ),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                ),
                onSubmitted: (value) => _searchMusic(value),
              ),
            ),
           Expanded(
               child: TabBarView(
                 controller: _tabController,
                   children: [
                     _buildMusicList(),
                     const Center(child: Text('Dialogue')),
                     const Center(child: Text('Favourite')),
                   ],
               ),
           ),
          ],
        ),
    );
  }

  Widget _buildMusicList(){
   return ListView.builder(
     itemCount: _musicList.length,
       itemBuilder: (context, index){
       final music = _musicList[index];
       return ListTile(
         leading: Image.network(music.thumbnailUrl),
          title: Text(music.title),
         subtitle: Text(music.artist),
         trailing: Text(music.duration),
       );
       },
   );
  }

  void _searchMusic(String query) async {
    final musicList = await _youTubeMusicService.searchMusic(query);
    setState(() {
      _musicList = musicList;
    });
  }
}
