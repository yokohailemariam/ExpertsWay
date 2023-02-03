import 'package:learncoding/models/lesson.dart';
import 'package:learncoding/theme/box_icons_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:learncoding/theme/config.dart' as config;
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class LessonPage extends StatefulWidget {
  final List<LessonElement?> lessonData;
  final List<LessonContent?> contents;
  final String section;
  final String lesson;
  const LessonPage({
    super.key,
    required this.section,
    required this.contents,
    required this.lesson,
    required this.lessonData,
  });

  @override
  State<LessonPage> createState() => _LessonState();
}

class _LessonState extends State<LessonPage> {
  lessonContent(lessonData, lesson, section) {
    for (var element in lessonData) {
      if (element.title == lesson && element.section == section) {
        final lessonHtml = element.content;
        // final String lessonHtml = element.content.join();
        return lessonHtml;
      }
    }
    return null;
  }
    @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    for (var i = 0; i < widget.contents.length; i++) {
      var val = widget.contents[i];
      getContent.add(val!.content);
    }
  }

  final getContent = [];
  int index = 0;
  bool finishLesson = false;

  @override
  Widget build(BuildContext context) {
    // final lessonHtml =
    //     lessonContent(widget.lessonData, widget.lesson, widget.section);
    // String lesson = lessonHtml[index];
    String content = getContent[index];
    // double progress = index / lessonHtml.length;
    double progress = index / getContent.length;
    int remainingHearts = 3;
    return CupertinoPageScaffold(
      backgroundColor: config.Colors().secondColor(1),
      navigationBar: CupertinoNavigationBar(
        border: const Border(bottom: BorderSide(color: Colors.transparent)),
        padding: const EdgeInsetsDirectional.only(
          start: 0,
          end: 20,
        ),
        previousPageTitle: "Back",
        backgroundColor: config.Colors().secondColor(1),
        leading: CupertinoButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.close,
            color: Colors.black87,
            size: 30,
          ),
        ),
        trailing: Container(
          margin: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(
                BoxIcons.bxs_heart,
                color: Color.fromARGB(255, 246, 33, 82),
                size: 25,
              ),
              const SizedBox(width: 5),
              Text(
                "$remainingHearts",
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 25, 20, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.green,
                  value: finishLesson ? 1 : progress,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                      Color.fromARGB(255, 4, 67, 33)),
                  minHeight: 18,
                ),
              ),
            ),
            Html(
              data: content,
            ),
            CupertinoButton(
                child: const Text("Next lesson"),
                onPressed: () {
                  print(getContent.length);
                  print(index);
                  index < getContent.length - 1
                      ? setState(() {
                          index++;
                        })
                      : setState(() {
                          finishLesson = true;
                        });
                })
          ],
        ),
      ),
    );
  }
}









// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:learncoding/models/lesson.dart';
// import 'package:learncoding/theme/box_icons_icons.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:learncoding/theme/config.dart' as config;
// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:learncoding/ui/widgets/box.dart';
// import 'package:learncoding/utils/color.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class LessonPage extends StatefulWidget {
//   final List<LessonContent?> contents;
//   final String section;
//   final String lesson;
//   const LessonPage({
//     super.key,
//     required this.section,
//     required this.lesson,
//     required this.contents,
//   });

//   @override
//   State<LessonPage> createState() => _LessonState();
// }

// class _LessonState extends State<LessonPage> {
//   lessonContent(lessonData, lesson, section) {
//     for (var element in lessonData) {
//       if (element.title == lesson && element.section == section) {
//         final lessonHtml = element.content;
//         // final String lessonHtml = element.content.join();
//         return lessonHtml;
//       }
//     }
//     return null;
//   }

//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }

//   getData() {
//     for (var i = 0; i < widget.contents.length; i++) {
//       var val = widget.contents[i];
//       getContent.add(val!.content);
//     }
//   }

//   final getContent = [];
//   int index = 0;
//   bool finishLesson = false;
//   final pageController = PageController();
//   bool isLastPage = false;
//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(
//                 top: 60,
//                 left: 20,
//                 right: 20,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Box(
//                           onTap: () => Navigator.pop(context),
//                           icon: FontAwesomeIcons.arrowLeft,
//                           size: 20),
//                       SizedBox(width: 15),
//                       Text(
//                         widget.lesson,
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.w600),
//                       )
//                     ],
//                   ),
//                   Box(icon: FontAwesomeIcons.ellipsisVertical, size: 20)
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Expanded(
//               child: PageView.builder(
//                   controller: pageController,
//                   itemCount: getContent.length,
//                   onPageChanged: (index) {
//                     // if()
//                     setState(() {
//                       isLastPage = index == getContent.length - 1;
//                     });
//                   },
//                   itemBuilder: (_, index) => SingleChildScrollView(
//                         child: Container(
//                           alignment: Alignment.center,
//                           padding: EdgeInsets.all(15),
//                           margin: EdgeInsets.only(left: 15),
//                           decoration: BoxDecoration(
//                               color: Color.fromARGB(120, 216, 216, 216),
//                               borderRadius: BorderRadius.circular(20)),
//                           child: Html(
//                             data: '${getContent[index]}',
//                           ),
//                         ),
//                       )),
//             ),
//             SizedBox(
//               width: double.infinity,
//               height: 80,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     ElevatedButton(
//                         onPressed: () {
//                           pageController.previousPage(
//                               duration: const Duration(milliseconds: 500),
//                               curve: Curves.easeOut);
//                         },
//                         style: ElevatedButton.styleFrom(
//                             elevation: 0,
//                             shadowColor: Colors.transparent,
//                             backgroundColor: seccolor,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(5))),
//                         child: const Text(
//                           "Prev",
//                           style: TextStyle(fontFamily: 'Red Hat Display'),
//                         )),
//                     SmoothPageIndicator(
//                       controller: pageController,
//                       count: widget.contents.length,
//                       effect: ExpandingDotsEffect(
//                           dotHeight: 10,
//                           dotWidth: 10,
//                           dotColor: seccolor,
//                           activeDotColor: maincolor),
//                       onDotClicked: (index) => pageController.animateToPage(
//                           index,
//                           duration: const Duration(milliseconds: 500),
//                           curve: Curves.easeIn),
//                     ),
//                     !isLastPage
//                         ? ElevatedButton(
//                             onPressed: () {
//                               pageController.nextPage(
//                                   duration: const Duration(milliseconds: 500),
//                                   curve: Curves.easeOut);
//                             },
//                             style: ElevatedButton.styleFrom(
//                                 elevation: 0,
//                                 shadowColor: Colors.transparent,
//                                 backgroundColor: maincolor,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(5))),
//                             child: const Text(
//                               "Next",
//                               style: TextStyle(fontFamily: 'Red Hat Display'),
//                             ))
//                         : Container()
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
 
//   }
// }
