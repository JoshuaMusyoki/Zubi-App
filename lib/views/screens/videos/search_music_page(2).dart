import 'package:flutter/material.dart';

class Music {
  final String title;
  final String artist;
  final String duration;
  final thumbnailUrl = Image.asset("");

  Music({
    required this.title,
    required this.artist,
    required this.duration,
    required Image thumbnailUrl,
  });
}

class SearchForMusicPage extends StatefulWidget {
  const SearchForMusicPage({super.key});

  @override
  _SearchMusicForPageState createState() => _SearchMusicForPageState();
}

class _SearchMusicForPageState extends State<SearchForMusicPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  // Music Data
  final List<Music> _musicList = [
    Music(
      title: "Song A",
      artist: "Artist A",
      duration: "03:45",
      thumbnailUrl: Image.asset("assets/images/profile_images/img_2.png"),
    ),
    Music(
      title: "Song B",
      artist: "Artist B",
      duration: "04:12",
      thumbnailUrl: Image.asset("assets/images/profile_images/img_2.png"),
    ),
    Music(
      title: "Song C",
      artist: "Artist C",
      duration: "02:58",
      thumbnailUrl: Image.asset("assets/images/profile_images/img_2.png"),
    ),
  ];

  //Dialogues' Data
  final List<String> _dialogueList = [
    "Famous Dialogue 1",
    "Famous Dialogue 2",
    "Famous Dialogue 3",
  ];

  // Favourites' Data
  final List<Music> _favouriteList = [
    Music(
      title: "Favourite Song X",
      artist: "Artist X",
      duration: "03:30",
      thumbnailUrl: Image.asset("assets/images/profile_images/img_2.png"),
    ),
    Music(
      title: "Favourite Song Y",
      artist: "Artist Y",
      duration: "04:00",
      thumbnailUrl: Image.asset("assets/images/profile_images/img_2.png"),
    ),
  ];

  @override
  void initState() {
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
        title: const Text("Search Music"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Library'),
            Tab(text: 'Dialogue'),
            Tab(text: 'Favourite'),
          ],
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
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onSubmitted: (value) => _searchMusic(value),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildMusicList(_musicList), // Music tab
                _buildDialogueList(), // Dialogue tab
                _buildMusicList(_favouriteList), // Favourite tab
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Music List Builder
  Widget _buildMusicList(List<Music> musicList) {
    return ListView.builder(
      itemCount: musicList.length,
      itemBuilder: (context, index) {
        final music = musicList[index];
        return ListTile(
          leading: Icon(Icons.music_note_outlined),
          title: Text(music.title),
          subtitle: Text(music.artist),
          trailing: Text(music.duration),
        );
      },
    );
  }

  // Dialogue List Builder
  Widget _buildDialogueList() {
    return ListView.builder(
      itemCount: _dialogueList.length,
      itemBuilder: (context, index) {
        final dialogue = _dialogueList[index];
        return ListTile(
          title: Text(dialogue),
          leading: Icon(Icons.mic, color: Colors.purple),
        );
      },
    );
  }

  // Simulating search for Music
  void _searchMusic(String query) {
    // For simplicity, filtering manually added music by title
    final filteredMusic = _musicList
        .where((music) => music.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      // Update the list with filtered music
      _musicList.clear();
      _musicList.addAll(filteredMusic);
    });
  }
}
