import "package:flutter/material.dart";
import 'package:social_app/models/post.dart';
import 'package:social_app/service/placeholder_service.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();

}

class _FeedState extends State<Feed> {
 final PlaceholderService _placeholderService = PlaceholderService();
 List<Post> _posts = [];
 @override
  void initState()
  {
    super.initState();
    _placeholderService.getPosts().then((resp){
      setState(() {
        _posts = resp;
      });
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.teal,
        title: Text("Feed - Studio Zaneti"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Post>>(
        future: _placeholderService.getPosts() ,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Text('Ok');
    }
          else if(snapshot.hasError){
            return Text('Erro');
    }
          return CircularProgressIndicator();
    },
    ),
    );
  }
}
