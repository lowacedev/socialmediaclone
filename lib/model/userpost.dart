class Userpost {
  final String userImg;
  final String username;
  final String time;
  final String postcontent;
  final String postimg;
  final String numcomments;
  final String numshare;
  bool isLiked;


  Userpost({
    required this.userImg,
    required this.username,
    required this.time,
    required this.postcontent,
    required this.postimg,
    required this.numcomments,
    required this.numshare,
    required this.isLiked,
  });
}