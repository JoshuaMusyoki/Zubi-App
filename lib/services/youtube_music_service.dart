
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:zubi/models/music/Music.dart';

class YouTubeMusicService {
  final YoutubeExplode _youtubeExplode = YoutubeExplode();

  Future<List<Music>> searchMusic(String query) async {
    var searchClient = _youtubeExplode.search;
    var searchResults = await searchClient.search(query);
    // return searchResults.whereType<Music>().toList();

    List<Music> musicList = searchResults.map((video){
      return Music(
          title: video.title,
          artist: video.author,
          thumbnailUrl: video.thumbnails.highResUrl,
          duration: video.duration?.toString().substring(2, 7) ?? "Unknown"
      );
    }).toList();
    return musicList;
  }
}