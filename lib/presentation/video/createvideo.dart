import 'package:clay_containers/clay_containers.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:short_video_app/model/font.model.dart';

class CreateVideo extends StatefulWidget {
  const CreateVideo({
    super.key,
  });

  @override
  State<CreateVideo> createState() => _CreateVideoState();
}

class _CreateVideoState extends State<CreateVideo> {
  bool? isSelected = true;
  List icondata = [
    Feather.heart,
    Feather.message_square,
    Feather.bookmark,
    Feather.share_2
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: [
            bgImage,
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 300,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Container(child: firstSection)),
                          // middlesection,
                          list
                         
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  // background image
  Widget get bgImage => Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/background.png'))));
  // bottom nav items
  // row first section
  Widget get firstSection => Container(
        
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 100,
          ),
          name,
          caption,
          hashtag,
          music
        ]),
      );

  // image + name in first section
  Widget get name => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircleAvatar(
              radius: 25, backgroundImage: AssetImage('assets/background.png')),
          const SizedBox(
            width: 20,
          ),
          Center(
            child: Text(
              'Quiche Fresco',
              style: TextStyle(
                  fontFamily: Fonts.medium,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );

  // caption in first section
  Widget get caption => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          '“Love is composed of a single soul inhabiting two bodies.” - Aristotle',
          style: TextStyle(
            fontFamily: Fonts.light,
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
      );

  // hashtag in first section
  Widget get hashtag => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          '#dance #party #trending',
          style: TextStyle(
            fontFamily: Fonts.regular,
            color: Colors.white70,
          ),
        ),
      );

  // music name in first section
  Widget get music => Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          children: [
            const Icon(
              Feather.music,
              color: Colors.white,
            ),
            Text(
              '  Contrary to popular..',
              style: TextStyle(
                fontFamily: Fonts.regular,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      );

  Widget get list => Column(
    children: 
      List.generate(icondata.length, (index)  {
   return  Padding(
     padding: const EdgeInsets.only(top: 20.0),
     child: ClayContainer( height: 50,
              width: 50,
              //  spread: 10,
              depth: 60,
              borderRadius: 50,
              color:  const Color.fromARGB(255, 152, 70, 64),
              curveType: CurveType.concave,
              child: Center(
                  child: Icon(
                icondata[index],
                color: Colors.white,
              ))),
   );
  }));
    
  

}
