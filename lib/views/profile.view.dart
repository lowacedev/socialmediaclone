import 'package:flutter/material.dart';
import 'package:socialmediaclone/model/usercomment.dart';
import 'package:socialmediaclone/model/userdata.dart';
import 'package:socialmediaclone/model/userpost.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.userPost});

  final Userpost userPost;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final Userdata userData = Userdata();
  final TextEditingController commentController = TextEditingController();
  List<Usercomment> postComments = [];
  final FocusNode commentFocusNode = FocusNode();

  var nametxtstyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  var boldtxtstyle = const TextStyle(fontWeight: FontWeight.bold);
  var boldtxtstyle1 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  @override
  void initState() {
    super.initState();
    // Initialize with existing comments
    postComments = List.from(userData.commentList);
  }

  @override
  void dispose() {
    commentController.dispose();
    commentFocusNode.dispose();
    super.dispose();
  }

  void addComment() {
    if (commentController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a comment'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    setState(() {
      final newComment = Usercomment(
        commenterImg: userData.myUserAccount.img,
        commenterName: userData.myUserAccount.name,
        commenterTime: 'Just now',
        commenterContent: commentController.text.trim(),
      );
      postComments.insert(0, newComment); // Add to beginning of list
      
      // Update comment count
      int currentCount = int.tryParse(widget.userPost.numcomments) ?? 0;
      widget.userPost.numcomments = (currentCount + 1).toString();
      
      commentController.clear();
      commentFocusNode.unfocus();
    });

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Comment added!'),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget commentBtn(Usercomment userComment) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(userComment.commenterTime),
            const SizedBox(width: 15),
            const Text('Like'),
            const SizedBox(width: 15),
            const Text('Reply')
          ],
        ),
      );

  Widget commentDesc(Usercomment userComment) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userComment.commenterName,
              style: boldtxtstyle,
            ),
            const SizedBox(height: 5),
            Row(children: [
              Flexible(child: Text(userComment.commenterContent))
            ]),
          ],
        ),
      );

  Widget commentSpace(Usercomment userComment) => Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(108, 158, 158, 158),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: commentDesc(userComment),
      );

  Widget commenterPic(Usercomment userComment) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CircleAvatar(
          backgroundImage: AssetImage(userComment.commenterImg),
          radius: 20,
        ),
      );

  Widget usercommenterline(Userpost userPost, Usercomment userComment) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          commenterPic(userComment),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [commentSpace(userComment), commentBtn(userComment)],
            ),
          )
        ],
      );

  Widget userpostDetails(Usercomment userComment) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          usercommenterline(widget.userPost, userComment),
        ],
      );

  Widget commenters(Userpost userPost) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  '${userPost.numcomments} Comments',
                  style: boldtxtstyle,
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text('All comments', style: boldtxtstyle1),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          )
        ],
      );

  Widget buttons(Userpost userPost) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor:
                          userPost.isLiked ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        userPost.isLiked = !userPost.isLiked;
                      });
                    },
                    icon: const Icon(Icons.thumb_up, size: 20),
                    label: const Text('Like')),
                TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.grey,
                    ),
                    onPressed: () {
                      // Focus on comment input
                      commentFocusNode.requestFocus();
                    },
                    icon: const Icon(Icons.chat_bubble, size: 20),
                    label: const Text('Comment')),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey,
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.share, size: 20),
                  label: const Text('Share'),
                ),
              ],
            ),
          ),
        ],
      );

  Widget userline(Userpost userpost) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage(widget.userPost.userImg),
              radius: 20,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.userPost.username,
                style: nametxtstyle,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(widget.userPost.time),
                  const Text('.'),
                  const Icon(Icons.group, size: 15, color: Colors.grey),
                ],
              ),
            ],
          ),
        ],
      );

  Widget postimage(Userpost userPost) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(children: [Text(userPost.postcontent)]),
            const SizedBox(height: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                userPost.postimg,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      );

  // Comment input widget
  Widget commentInput() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(userData.myUserAccount.img),
                radius: 18,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: commentController,
                  focusNode: commentFocusNode,
                  decoration: InputDecoration(
                    hintText: 'Write a comment...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                  ),
                  maxLines: null,
                  textInputAction: TextInputAction.send,
                  onSubmitted: (_) => addComment(),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: addComment,
                icon: const Icon(Icons.send),
                color: Colors.blue,
                iconSize: 28,
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
        ),
        title: const Text('Post'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                userline(widget.userPost),
                postimage(widget.userPost),
                buttons(widget.userPost),
                commenters(widget.userPost),
                const SizedBox(height: 10),
                ...postComments.map((userComment) => userpostDetails(userComment)),
                const SizedBox(height: 20),
              ],
            ),
          ),
          commentInput(),
        ],
      ),
    );
  }
}