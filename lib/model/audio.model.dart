
class TrendingAudioModel {
  String? audioImageUrl;
  String? audioTitle;
  // Icon? audioIcon;
  String? audioUrl;
  bool isPlaying = false;

  TrendingAudioModel(this.audioImageUrl, this.audioTitle,  this.audioUrl);
}

List<TrendingAudioModel> audioLists = [
  
  TrendingAudioModel(
    'assets/trendingpage/Group68.png',
    'Perfect\n15.2k videos',
    // Icon(Feather.play, size: 20, color: AppColors.white),
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'
    
  ),
  TrendingAudioModel(
    'assets/trendingpage/Group71.png',
    'Eyes closed\n23k videos',
    // Icon(Feather.play, size: 20, color: AppColors.white),
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3'
  ),
  TrendingAudioModel(
    'assets/trendingpage/Group68.png',
    'Perfect\n15.2k videos',
    // Icon(Feather.play, size: 20, color: AppColors.white),
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3'
  ),
  TrendingAudioModel(
    'assets/trendingpage/Group71.png',
    'Eyes closed\n23k videos',
    // Icon(Feather.play, size: 20, color: AppColors.white),
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-13.mp3'
  )
];
