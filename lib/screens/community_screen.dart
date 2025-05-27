import 'package:ecotrail/widgets/custom_heading.dart';
import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomHeading(title: "Community"),
        centerTitle: true,
        backgroundColor: const Color(0xFF8EE3E1), // Matching your app's color scheme
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 20),
        itemCount: dummyPosts.length,
        itemBuilder: (context, index) {
          final post = dummyPosts[index];
          return PostCard(post: post);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add functionality to create a new post
        },
        backgroundColor: const Color(0xFF3AA8A4),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class Post {
  final String userName;
  final String userAvatar;
  final String caption;
  final String imageUrl;
  final int likes;
  final int comments;
  final String timeAgo;
  final bool isLiked;

  Post({
    required this.userName,
    required this.userAvatar,
    required this.caption,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.timeAgo,
    this.isLiked = false,
  });
}

final List<Post> dummyPosts = [
  Post(
    userName: "EcoWarrior42",
    userAvatar: "assets/avatar1.jpg",
    caption: "Just completed my zero-waste challenge! Who's joining me next week? 🌱",
    imageUrl: "assets/post1.jpeg",
    likes: 124,
    comments: 23,
    timeAgo: "2 hours ago",
  ),
  Post(
    userName: "GreenThumb",
    userAvatar: "assets/avatar1.jpg",
    caption: "My homemade compost is finally ready! So rewarding to see food scraps turn into nutrient-rich soil.",
    imageUrl: "assets/grid1.jpeg",
    likes: 89,
    comments: 15,
    timeAgo: "5 hours ago",
  ),
  Post(
    userName: "SolarPowerUser",
    userAvatar: "assets/avatar1.jpg",
    caption: "One year with solar panels and we've reduced our carbon footprint by 40%!",
    imageUrl: "assets/grid2.jpeg",
    likes: 210,
    comments: 42,
    timeAgo: "1 day ago",
  ),
];

class PostCard extends StatefulWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLiked = false;
  int likeCount = 0;

  @override
  void initState() {
    super.initState();
    isLiked = widget.post.isLiked;
    likeCount = widget.post.likes;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info header
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(widget.post.userAvatar),
                  radius: 20,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.post.userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      widget.post.timeAgo,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {
                    // Show post options
                  },
                ),
              ],
            ),
          ),

          // Caption
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(widget.post.caption),
          ),
          const SizedBox(height: 8),

          // Post image
          AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              widget.post.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),

          // Like, comment, share buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : null,
                  ),
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                      likeCount = isLiked ? likeCount + 1 : likeCount - 1;
                    });
                  },
                ),
                Text(likeCount.toString()),
                const SizedBox(width: 16),
                IconButton(
                  icon: const Icon(Icons.comment),
                  onPressed: () {
                    // Navigate to comments screen
                  },
                ),
                Text(widget.post.comments.toString()),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    // Share functionality
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}