
import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: Home()
    );
  }
}

class Home extends StatelessWidget {
  final StoryController controller = StoryController();

  @override
  Widget build(BuildContext context) {
    //Widget are use to Press and hold on any homescreen on your Android phone
    return Scaffold(
      appBar: AppBar(
        title: Text("Story view example"),
      ),
      body: Container(
        margin: EdgeInsets.all(
          0,
        ),
        child: ListView(
          children: <Widget>[
            Container(
              height: 300,
              child: StoryView(
                controller: controller,
                storyItems: [
                  StoryItem.text(
                    title:
                    "hello word!\"nhave a look at name grate package of flutter.\n\nTap!",
                    backgroundColor: Colors.orange,
                    roundedTop: false,
                  ),


                  StoryItem.inlineImage(
                    url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQD5dm37Wcy4QwCmzLd9MbrBugcO6t6S1-1oQ&usqp=CAU",
                    controller: controller,
                    caption: Text(
                      "Rock Concert; you will love this show if taken as supper.",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  StoryItem.inlineImage(
                    url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOzqNU-EM4Q-VbkYZKU04NiBewAkjwf0_zEA&usqp=CAU",
                    controller: controller,
                    caption: Text(
                      "My Welcome chartbot",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  )
                ],
                onStoryShow: (s) {
                  print("showing  a story");
                },
                onComplete: () {
                  print("Complted a cycle");
                },
                progressPosition: ProgressPosition.bottom,
                repeat: false,
                inline: true,
              ),
            ),
            Material(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MoreStories()
                      )
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(8))),
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "View More Story",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoreStories extends StatefulWidget{
  @override
  _MoreStoriesState createState()=>_MoreStoriesState();

}

class _MoreStoriesState extends State<MoreStories> {
  final storyController = StoryController();

  @override
  void dispose() {
  ///hold a refrence to the Disposable when create and cell the dispose function
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //the WidgetCotext is used to locate a prticuler Widget in a Widget tree and every Widget has its own BuildCotext that is particuler BuildContext is associate with only one Widget.
    return Scaffold(
      body: StoryView(
        storyItems: [
          StoryItem.text(
            title:
            "I guess you'd love to see more of food that'a great",
            backgroundColor: Colors.blue,
          ),
          StoryItem.text(
            title: "Nice !\n\nTap to Continue.",
            backgroundColor: Colors.red,
            textStyle: TextStyle(
              fontFamily: 'Dancing',
              fontSize: 40,
            ),
          ),
          StoryItem.pageImage(
            url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlA4b3_uIc4SkaTGcqEFZsSRMjEJ016L8qyA&usqp=CAU",
            caption: "Still Sampling",
            controller: storyController,
          ),
          StoryItem.pageImage(
              url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR19pmDg7z1Ky7XAORqjH7twUqIvbRXyNgqmQ&usqp=CAU",
              caption: "Working with gifs",
              controller: storyController),
          StoryItem.pageImage(
            url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNICBfe_1tgmsn15zY-RMDsXLvPnICn0E6UQ&usqp=CAU",
            caption: "from the other size",
            controller: storyController,
          ),
          StoryItem.pageImage(
            url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVOKmBnf7KzgO_bCH9e8VVQUBahrg9A-2QzQ&usqp=CAU",
            caption: "Hello from the other side2",
            controller: storyController,
          ),
        ],
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          print("Complete a Cycle");
        },
        progressPosition: ProgressPosition.top,
        repeat: true,
        controller: storyController,
      ),
    );
  }
}