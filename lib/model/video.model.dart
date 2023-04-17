import 'package:short_video_app/model/customer.model.dart';

class Video {
  String? videoUrl;
  String? title;
  String? description;
  int? noOfComments;
  int? noOfLikes;
  bool liked;
  bool saved;
  String? songName;
  Customer? customer;
  Video(
      {this.customer,
      this.description,
      this.liked = false,
      this.noOfComments,
      this.noOfLikes,
      this.saved = false,
      this.songName,
      this.title,
      this.videoUrl});
}

List<Video> availableVideos = [
  Video(
      videoUrl:
          "https://assets.mixkit.co/videos/preview/mixkit-little-girl-next-to-baskets-of-easter-eggs-48596-large.mp4",
      description:
          "Big Buck Bunny tells the story of a giant rabbit with a heart bigger than himself. When one sunny day three rodents rudely harass him, something snaps and the rabbit ain't no bunny anymore! In the typical cartoon tradition he prepares the nasty rodents a comical revenge.Licensed under the Creative Commons Attribution license http://www.bigbuckbunny.org",
      title: "By Blender Foundation",
      noOfComments: 194,
      noOfLikes: 128,
      liked: false,
      saved: false,
      songName: "Contrary to popular belief, Lorem Ipsum is...",
      customer: Customer(
          name: "Anamika Kumari",
          userName: "@anamika",
          image:
              "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80")),
  Video(
      videoUrl:
          "https://assets.mixkit.co/videos/preview/mixkit-man-under-multicolored-lights-1237-large.mp4",
      description:
          "HBO GO now works with Chromecast -- the easiest way to enjoy online video on your TV. For when you want to settle into your Iron Throne to watch the latest episodes. Learn how to use Chromecast with HBO GO and more at google.com/chromecast.",
      title: "By Blender Foundation",
      noOfComments: 175,
      noOfLikes: 105,
      liked: false,
      saved: false,
      songName: "Contrary to popular belief, Lorem Ipsum is...",
      customer: Customer(
          name: "Anamika Kumari",
          userName: "@anamika",
          image:
              "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80")),
  Video(
      videoUrl:
          "https://assets.mixkit.co/videos/preview/mixkit-hand-takes-a-chocolate-bunny-from-beneath-the-bush-48604-large.mp4",
      description:
          "HBO GO now works with Chromecast -- the easiest way to enjoy online video on your TV. For when you want to settle into your Iron Throne to watch the latest episodes. Learn how to use Chromecast with HBO GO and more at google.com/chromecast.",
      title: "By Blender Foundation",
      noOfComments: 175,
      noOfLikes: 105,
      liked: false,
      saved: false,
      songName: "Contrary to popular belief, Lorem Ipsum is...",
      customer: Customer(
          name: "Anamika Kumari",
          userName: "@anamika",
          image:
              "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80")),
  Video(
      videoUrl:
          "https://assets.mixkit.co/videos/preview/mixkit-little-girl-laying-in-the-grass-enjoying-a-chocolate-bunny-49069-large.mp4",
      description:
          "HBO GO now works with Chromecast -- the easiest way to enjoy online video on your TV. For when you want to settle into your Iron Throne to watch the latest episodes. Learn how to use Chromecast with HBO GO and more at google.com/chromecast.",
      title: "By Blender Foundation",
      noOfComments: 175,
      noOfLikes: 105,
      liked: false,
      saved: false,
      songName: "Contrary to popular belief, Lorem Ipsum is...",
      customer: Customer(
          name: "Anamika Kumari",
          userName: "@anamika",
          image:
              "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80")),
  Video(
      videoUrl:
          "https://assets.mixkit.co/videos/preview/mixkit-little-girl-eating-easter-egg-chocolate-in-the-garden-48603-large.mp4",
      description:
          "HBO GO now works with Chromecast -- the easiest way to enjoy online video on your TV. For when you want to settle into your Iron Throne to watch the latest episodes. Learn how to use Chromecast with HBO GO and more at google.com/chromecast.",
      title: "By Blender Foundation",
      noOfComments: 175,
      noOfLikes: 105,
      liked: false,
      saved: false,
      songName: "Contrary to popular belief, Lorem Ipsum is...",
      customer: Customer(
          name: "Anamika Kumari",
          userName: "@anamika",
          image:
              "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80")),
  Video(
      videoUrl:
          "https://assets.mixkit.co/videos/preview/mixkit-urban-woman-with-a-smoke-bomb-at-a-forest-1861-large.mp4",
      description:
          "HBO GO now works with Chromecast -- the easiest way to enjoy online video on your TV. For when you want to settle into your Iron Throne to watch the latest episodes. Learn how to use Chromecast with HBO GO and more at google.com/chromecast.",
      title: "By Blender Foundation",
      noOfComments: 175,
      noOfLikes: 105,
      liked: false,
      saved: false,
      songName: "Contrary to popular belief, Lorem Ipsum is...",
      customer: Customer(
          name: "Anamika Kumari",
          userName: "@anamika",
          image:
              "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80")),
];
