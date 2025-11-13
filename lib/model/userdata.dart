import 'package:socialmediaclone/model/account.dart';
import 'package:socialmediaclone/model/friend.dart';
import 'package:socialmediaclone/model/usercomment.dart';
import 'package:socialmediaclone/model/userpost.dart';

class Userdata {
  List<Userpost> userList = [
    Userpost(
    userImg: 'assets/person1.jfif',
    username: 'John Doe',
    time: '2 hrs ago',
    postcontent: 'Had a great day at the beach!',
    postimg: 'assets/pavlova.jpg',
    numcomments: '24',
    numshare: '5',
    isLiked: false,
    ),

     Userpost(
    userImg: 'assets/person2.jfif',
    username: 'Jane Smith',
    time: '3 hrs ago',
    postcontent: 'Lovin the new cafe in town',
    postimg: 'assets/pavlova_main.jfif',
    numcomments: '24',
    numshare: '5',
    isLiked: false,
    ),

     Userpost(
    userImg: 'assets/person3.jfif',
    username: 'Mike johnson',
    time: '3 hrs ago',
    postcontent: 'just finish 10km in 5 mins',
    postimg: 'assets/pavlova.jpg',
    numcomments: '30',
    numshare: '20',
    isLiked: true,
    ),

     Userpost(
    userImg: 'assets/person4.jfif',
    username: 'John Doe',
    time: '10 hrs ago',
    postcontent: 'Had a great day at the beach!',
    postimg: 'assets/pavlova.jpg',
    numcomments: '24',
    numshare: '5',
    isLiked: true,
    ),
  ];
  List<Friend> friendList =[

    Friend(img:'assets/person1.jfif', name: 'Alice'),
    Friend(img:'assets/person2.jfif', name: 'Bob'),
    Friend(img:'assets/person3.jfif', name: 'Charlie'),
    Friend(img:'assets/person4.jfif', name: 'Diana'),
    Friend(img:'assets/person5.jfif', name: 'Ethan'),
    Friend(img:'assets/person6.jfif', name: 'Michael'),
  ];

  List<Usercomment> commentList =[
    Usercomment(commenterImg: 'assets/person2.jfif',
                commenterName: 'Jane Smith',
                commenterTime: '6 hrs',
                commenterContent: 'Wow Beautiful!'),
   Usercomment(commenterImg: 'assets/person3.jfif',
                commenterName: 'Kenneth Vladimir',
                commenterTime: '2 hrs',
                commenterContent: 'Wow Beautiful!'),
   Usercomment(commenterImg: 'assets/person4.jfif',
                commenterName: 'Miko Rojo',
                commenterTime: '9 hrs',
                commenterContent: 'Wow Beautiful!'),
  ];

  Account myUserAccount = Account(
    name: 'Luis Daniel Panal',
    email: 'l.panal.547012@umindanao.edu.ph',
    img: 'assets/person2.jfif',
    numFollowers: '15',
    numPosts: '350',
    numFollowing: '150',
    numFriends: '50');
}