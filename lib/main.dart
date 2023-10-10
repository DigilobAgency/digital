import 'dart:async';
import 'dart:io';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:assignment_1/api_exceptions.dart';
import 'package:assignment_1/custom_image_view.dart';
import 'package:assignment_1/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';

import 'custom_textfield_new.dart';
import 'flick_video_player_widget.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, widget) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: widget!,
        );
      },
      home: const SplashView(),
    );
  }
}


class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {

  int? selectedIndex = 0;

  var listOfScreens = [
    const Page1View(),
    const Page2View(),
    const Page3View(),
    const Page4View(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listOfScreens[selectedIndex!],
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 60.0,
        // color: const Color(0xff0600ff),
        color: Colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
              child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Center(
                    child: Row(
                      // mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: ,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState((){
                              selectedIndex = 0;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text("Шта смо урадили?", style: TextStyle(color: (selectedIndex == 0) ? Colors.black : Colors.grey, fontSize: 17.0),),
                          ),
                        ),

                        const SizedBox(width: 15.0,),

                        GestureDetector(
                          onTap: (){
                            setState((){
                              selectedIndex = 1;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text("Урадићемо заједно", style: TextStyle(color: (selectedIndex == 1) ? Colors.black : Colors.grey, fontSize: 17.0),),
                          ),
                        ),

                        const SizedBox(width: 15.0,),

                        GestureDetector(
                          onTap: (){
                            setState((){
                              selectedIndex = 2;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text("Играј квиз", style: TextStyle(color: (selectedIndex == 2) ? Colors.black : Colors.grey, fontSize: 17.0),),
                          ),
                        ),

                        const SizedBox(width: 15.0,),

                        GestureDetector(
                          onTap: (){
                            setState((){
                              selectedIndex = 3;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text("Придружи се", style: TextStyle(color: (selectedIndex == 3) ? Colors.black : Colors.grey, fontSize: 17.0),),
                          ),
                        ),

                        const SizedBox(width: 15.0,),

                      ],
                    ),
                  ),

                  Positioned(
                    right: 25.0,
                      top: 5.0,
                      bottom: 5.0,
                      child: GestureDetector(
                        onTap: (){
                          setState((){
                            selectedIndex = 0;
                          });
                        },
                          child: CustomImageView(imagePath: "assets/images/sign.png", height: 25.0,)))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Page1View extends StatefulWidget {
  const Page1View({Key? key}) : super(key: key);

  @override
  State<Page1View> createState() => _Page1ViewState();
}

class _Page1ViewState extends State<Page1View> {

  List<Media> listOfMedia = [];

  @override
  void initState() {
    super.initState();


    listOfMedia.add(Media(filePath: "assets/images/main/1.mp4", fileType: "video"));
    listOfMedia.add(Media(filePath: "assets/images/main/2.mp4", fileType: "video"));
    listOfMedia.add(Media(filePath: "assets/images/main/3.mp4", fileType: "video"));
    listOfMedia.add(Media(filePath: "assets/images/main/4.mp4", fileType: "video"));
    listOfMedia.add(Media(filePath: "assets/images/main/5.mp4", fileType: "video"));

    listOfMedia.add(Media(filePath: "assets/images/main/6.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/main/7.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/main/8.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/main/9.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/main/10.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/main/11.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/main/12.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/main/13.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/main/14.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/main/15.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/main/16.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/main/17.jpg", fileType: "image"));

    listOfMedia.add(Media(filePath: "assets/images/main/18.mp4", fileType: "video"));
    listOfMedia.add(Media(filePath: "assets/images/main/19.mp4", fileType: "video"));
    listOfMedia.add(Media(filePath: "assets/images/main/20.mp4", fileType: "video"));
    listOfMedia.add(Media(filePath: "assets/images/main/21.mp4", fileType: "video"));
    listOfMedia.add(Media(filePath: "assets/images/main/22.mp4", fileType: "video"));
    listOfMedia.add(Media(filePath: "assets/images/main/23.mp4", fileType: "video"));
    listOfMedia.add(Media(filePath: "assets/images/main/24.mp4", fileType: "video"));
    listOfMedia.add(Media(filePath: "assets/images/main/25.mp4", fileType: "video"));
    listOfMedia.add(Media(filePath: "assets/images/main/26.mp4", fileType: "video"));
    listOfMedia.add(Media(filePath: "assets/images/main/27.mp4", fileType: "video"));
    listOfMedia.add(Media(filePath: "assets/images/main/28.mp4", fileType: "video"));
    listOfMedia.add(Media(filePath: "assets/images/main/29.mp4", fileType: "video"));
    listOfMedia.add(Media(filePath: "assets/images/main/30.mp4", fileType: "video"));
    listOfMedia.add(Media(filePath: "assets/images/main/31.mp4", fileType: "video"));

    listOfMedia.add(Media(filePath: "assets/images/main/32.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/main/33.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/main/34.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/main/35.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/main/36.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/main/37.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/main/38.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/main/39.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/main/40.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/main/41.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/main/42.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/main/43.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/main/44.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/main/45.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/main/46.jpg", fileType: "image"));

    listOfMedia.add(Media(filePath: "assets/images/main/47.mp4", fileType: "video"));


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff01106c),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: CarouselSlider.builder(
              options: CarouselOptions(
                  height: double.maxFinite,
                  enlargeCenterPage: true,
                  enlargeFactor: 1,
                  reverse: false,
                  autoPlay: false,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  onPageChanged: (index, _) {
                    // controller.selectedIndex!.value = index;
                  }),
              itemCount: listOfMedia.length,
              itemBuilder: (BuildContext context, int itemIndex,
                  int pageViewIndex) {
                Media media = listOfMedia[itemIndex];

                return (media.fileType == "image") ? CustomImageView(
                  imagePath: media.filePath,
                  fit: BoxFit.fill,
                  width: double.maxFinite,
                  // height: double.maxFinite,
                ) : LandscapePlayer(path: media.filePath!,);
              }),
        ),
      ),
    );
  }
}

class Page2View extends StatefulWidget {
  const Page2View({Key? key}) : super(key: key);

  @override
  State<Page2View> createState() => _Page2ViewState();
}

class _Page2ViewState extends State<Page2View> {

  List<Media> listOfMedia = [];

  @override
  void initState() {
    super.initState();

    listOfMedia.add(Media(filePath: "assets/images/other/s1.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/other/s2.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/other/s3.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/other/s4.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/other/s5.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/other/s6.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/other/s7.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/other/s8.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/other/s9.jpg", fileType: "image"));
    listOfMedia.add(Media(filePath: "assets/images/other/s10.jpg", fileType: "image"));

    listOfMedia.add(Media(filePath: "assets/images/other/s11.mp4", fileType: "video"));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff01106c),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: CarouselSlider.builder(
              options: CarouselOptions(
                  height: double.maxFinite,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.5,
                  reverse: false,
                  autoPlay: false,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  onPageChanged: (index, _) {
                    // controller.selectedIndex!.value = index;
                  }),
              itemCount: listOfMedia.length,
              itemBuilder: (BuildContext context, int itemIndex,
                  int pageViewIndex) {
                Media media = listOfMedia[itemIndex];

                return (media.fileType == "image") ? CustomImageView(
                  imagePath: media.filePath,
                  fit: BoxFit.fill,
                  width: double.maxFinite,
                ) : LandscapePlayer(path: media.filePath!,);
              }),
        ),
      ),
    );
  }
}

class Page3View extends StatefulWidget {
  const Page3View({Key? key}) : super(key: key);

  @override
  State<Page3View> createState() => _Page3ViewState();
}

class _Page3ViewState extends State<Page3View> {

  List<Quiz> listOfQuiz = [];

  int? selectedIndex = 0;

  int? score = 0;

  bool isAllQuestionsEnd = false;

  int q1 = -1;
  int q2 = -1;
  int q3 = -1;
  int q4 = -1;
  int q5 = -1;

  PageController controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();

    listOfQuiz.add(Quiz(question: "Koliko kilometara auto-puta je izgrađeno od 2012 do danas?", opt1: "50", opt2: "150", opt3: "600", correct: "600"));
    listOfQuiz.add(Quiz(question: "U kojoj svetskoj metropoli će se održati World Expo 2027?", opt1: "New York", opt2: "Doha", opt3: "Belgrade", correct: "Belgrade"));
    listOfQuiz.add(Quiz(question: "Koliko fabrika je otvoreno u Srbiji u periodu od 2012. do 2023. Godine?", opt1: "70", opt2: "124", opt3: "260", correct: "260"));
    listOfQuiz.add(Quiz(question: "Koja od navedenih evropskih političkih stranaka je najveća?", opt1: "CDU (Nemačka)", opt2: "SNS (Srbija)", opt3: "1M5S (Italija)", correct: "SNS (Srbija)"));
    listOfQuiz.add(Quiz(question: "Sa kojom susednom državom je Srbija osnovala kompaniju za trgovinu gasom?", opt1: "Mađarska", opt2: "Crna Gora", opt3: "Hrvatska", correct: "Mađarska"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff01106c),
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 10.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0)
            ),
            child: SingleChildScrollView(
              child: Container(
                height: 350.0,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  children: [
                    const Text("Igraj kviz", style: TextStyle(color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),),

                    const SizedBox(height: 15.0,),

                    Expanded(
                        child: (!isAllQuestionsEnd) ? PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: listOfQuiz.length,
                        controller: controller,
                        onPageChanged: (ind){
                        setState((){
                          selectedIndex = ind;
                        });
                        },
                        itemBuilder: (ctx, index){
                        return quizTile(model: listOfQuiz[index]);
                        }) : Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Quiz Completed!", style: const TextStyle(color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.w600),),

                              const SizedBox(height: 15.0,),

                              Text("Your score is $score", style: const TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.w600),),

                            ],
                          ),
                        )
                    ),

                    (!isAllQuestionsEnd) ?  Text("Score $score", style: const TextStyle(color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),) : Offstage(),

                    (!isAllQuestionsEnd) ?  const SizedBox(height: 15.0,) : Offstage(),

                    GestureDetector(
                      onTap: (){
                        setState((){
                          score = 0;
                          isAllQuestionsEnd = false;
                        });
                        controller.jumpToPage(0);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const Text("Nova igra", style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w600),),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget quizTile({required Quiz model}){
    return Container(
      // color: Colors.red,
      height: 270.0,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(model.question!, style: const TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w600), textAlign: TextAlign.center,),

            const SizedBox(height: 10.0,),

            optionButton(
                opt: model.opt1!, onTap: (){
                  if(model.opt1! == model.correct){
                    setState((){
                      score = score! + 1;
                    });
                  }
                  if(controller.page == 4){
                    setState(() {
                      isAllQuestionsEnd = true;
                    });
                  } else {
                    controller.nextPage(duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
                  }
            }),

            const SizedBox(height: 5.0,),

            optionButton(opt: model.opt2!, onTap: (){
              if(model.opt2! == model.correct){
                setState((){
                  score = score! + 1;
                });
              }
              if(controller.page == 4){
                setState(() {
                  isAllQuestionsEnd = true;
                });
              } else {
                controller.nextPage(duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
              }
            }),

            const SizedBox(height: 5.0,),

            optionButton(opt: model.opt3!, onTap: (){
              if(model.opt3! == model.correct){
                setState((){
                  score = score! + 1;
                });
              }
              if(controller.page == 4){
                setState(() {
                  isAllQuestionsEnd = true;
                });
              } else {
                controller.nextPage(duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget optionButton({required String opt, required Function() onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: Color(0xff0600ff),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(opt, style: const TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w600),),
      ),
    );
  }
}

class OptionButton extends StatefulWidget {
  final String opt;
  final Function() onTap;

  final int type;

  const OptionButton({Key? key, required this.opt, required this.onTap, required this.type,}) : super(key: key);

  @override
  State<OptionButton> createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: (widget.type == -1) ? const Color(0xff0600ff) : (widget.type == 1) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(widget.opt, style: const TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w600),),
      ),
    );
  }
}


class Page4View extends StatefulWidget {
  const Page4View({Key? key}) : super(key: key);

  @override
  State<Page4View> createState() => _Page4ViewState();
}

class _Page4ViewState extends State<Page4View> {

  var imeController = TextEditingController();
  var datumController = TextEditingController();
  var mestoController = TextEditingController();
  var kontaktController = TextEditingController();
  var postaController = TextEditingController();
  var adresaController = TextEditingController();
  var optsinaController = TextEditingController();
  var zaniController = TextEditingController();

  var focus1 = FocusNode();
  var focus2 = FocusNode();
  var focus3 = FocusNode();
  var focus4 = FocusNode();
  var focus5 = FocusNode();
  var focus6 = FocusNode();
  var focus7 = FocusNode();
  var focus8 = FocusNode();

  bool isShowLoader = false;

  @override
  Widget build(BuildContext context) {
    return  ModalProgressHUD(
      inAsyncCall: isShowLoader,
      dismissible: false,
      progressIndicator: const CircularProgressIndicator(),
      child: Scaffold(
        backgroundColor: const Color(0xff01106c),
        body: Center(
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width * 0.6,
            height: MediaQuery
                .of(context)
                .size
                .height * 0.8,
            margin: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 10.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0)
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 15.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 10.0,),

                    const Text("Ime", style:  TextStyle(color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600),),
                    const SizedBox(height: 10.0,),

                    CustomTextField(
                      fieldText: "",
                      hintText: "",
                      controller: imeController,
                      isFinal: false,
                      focusNode: focus1,
                      nextFocusNode: focus2,
                      keyboardType: TextInputType.text,
                      limit: 100,
                      // validator: (value) {
                      //   return HelperFunction.stringValidate(value!, fieldName: "Task Name");
                      // },
                    ),

                    const SizedBox(height: 15.0,),

                    const Text("Datum rodjenja", style:  TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600),),
                    const SizedBox(height: 10.0,),

                    CustomTextField(
                      fieldText: "",
                      hintText: "10/04/2023",
                      controller: datumController,
                      isFinal: false,
                      enabled: false,
                      onTap: () {
                        showIOSDatePicker(context, (date) {
                          datumController.text = DateFormat('dd/MM/yyyy').format(date);
                        });
                      },
                      focusNode: focus2,
                      nextFocusNode: focus3,
                      keyboardType: TextInputType.text,
                      limit: 100,
                      // validator: (value) {
                      //   return HelperFunction.stringValidate(value!, fieldName: "Task Name");
                      // },
                    ),

                    const SizedBox(height: 15.0,),

                    const Text("Mesto rodjenja", style:  TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600),),
                    const SizedBox(height: 10.0,),

                    CustomTextField(
                      fieldText: "",
                      hintText: "",
                      controller: mestoController,
                      isFinal: false,
                      focusNode: focus3,
                      nextFocusNode: focus4,
                      keyboardType: TextInputType.text,
                      limit: 100,
                      // validator: (value) {
                      //   return HelperFunction.stringValidate(value!, fieldName: "Task Name");
                      // },
                    ),

                    const SizedBox(height: 15.0,),

                    const Text("Kontakt telefon", style:  TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600),),
                    const SizedBox(height: 10.0,),

                    CustomTextField(
                      fieldText: "",
                      hintText: "",
                      controller: kontaktController,
                      isFinal: false,
                      focusNode: focus4,
                      nextFocusNode: focus5,
                      keyboardType: TextInputType.text,
                      limit: 100,
                      // validator: (value) {
                      //   return HelperFunction.stringValidate(value!, fieldName: "Task Name");
                      // },
                    ),

                    const SizedBox(height: 15.0,),

                    const Text("Elektronska pošta", style:  TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600),),
                    const SizedBox(height: 10.0,),

                    CustomTextField(
                      fieldText: "",
                      hintText: "",
                      controller: postaController,
                      isFinal: false,
                      focusNode: focus5,
                      nextFocusNode: focus6,
                      keyboardType: TextInputType.text,
                      limit: 100,
                      // validator: (value) {
                      //   return HelperFunction.stringValidate(value!, fieldName: "Task Name");
                      // },
                    ),

                    const SizedBox(height: 15.0,),

                    const Text("Adresa stanovanja", style:  TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600),),
                    const SizedBox(height: 10.0,),

                    CustomTextField(
                      fieldText: "",
                      hintText: "",
                      controller: adresaController,
                      isFinal: false,
                      focusNode: focus6,
                      nextFocusNode: focus7,
                      keyboardType: TextInputType.text,
                      limit: 100,
                      // validator: (value) {
                      //   return HelperFunction.stringValidate(value!, fieldName: "Task Name");
                      // },
                    ),

                    const SizedBox(height: 15.0,),

                    const Text("Opstina/Mesto", style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600),),
                    const SizedBox(height: 10.0,),

                    CustomTextField(
                      fieldText: "",
                      hintText: "",
                      controller: optsinaController,
                      isFinal: false,
                      focusNode: focus7,
                      nextFocusNode: focus8,
                      keyboardType: TextInputType.text,
                      limit: 100,
                      // validator: (value) {
                      //   return HelperFunction.stringValidate(value!, fieldName: "Task Name");
                      // },
                    ),

                    const SizedBox(height: 15.0,),

                    const Text("Zanimanje", style: TextStyle(color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600),),
                    const SizedBox(height: 10.0,),

                    CustomTextField(
                      fieldText: "",
                      hintText: "",
                      controller: zaniController,
                      isFinal: true,
                      focusNode: focus8,
                      keyboardType: TextInputType.text,
                      limit: 2000,
                      maxLines: 8,
                      // validator: (value) {
                      //   return HelperFunction.stringValidate(value!, fieldName: "Task Name");
                      // },
                    ),

                    const SizedBox(height: 20.0,),

                    GestureDetector(
                      onTap: () async {

                        callAPI();
                        // String email = 'digilob.com@gmail.com';
                        // String title = 'The subject';
                        // String message = '\nIme: ${imeController.text.trim()}\nDatum rodjenja: ${datumController.text.trim()}\nMesto rodjenja: ${mestoController.text.trim()}\nKontakt telefon: ${kontaktController.text.trim()}\nElektronska pošta: ${postaController.text.trim()}\nAdresa stanovanja: ${adresaController.text.trim()}\nOpstina/Mesto: ${optsinaController.text.trim()}\nZanimanje: ${zaniController.text.trim()}\n';
                        //
                        // final Uri params = Uri(
                        //   scheme: 'mailto',
                        //   path: email,
                        //   query: 'subject=$title&body=$message',
                        // );
                        //
                        // if (!await launchUrl(params)) {
                        //   throw Exception('Could not launch $params');
                        // }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: const Color(0xff0600ff),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const Text(
                          "Pošalji", style: TextStyle(color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600),),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  void callAPI()  {

    checkInternetConnection().then((value) async {
     if(value){

       setState((){
         isShowLoader = true;
       });

       var map = {
         'to_do': imeController.text.trim(),
         'date_of_birth': datumController.text.trim(),
         'place_of_birth': mestoController.text.trim(),
         'phone': kontaktController.text.trim(),
         'email': postaController.text.trim(),
         'address': adresaController.text.trim(),
         'city': optsinaController.text.trim(),
         'interest': zaniController.text.trim(),
       };

       print(map);

       await BaseClient.post(
           "https://dusan.digilob.com/send-email.php",
           onSuccess: (response) async {

             print('[ RESPONSE ===> ${response}]');

             setState((){
               isShowLoader = false;
             });

             FlutterToastr.show(response.data['message'], context, duration: FlutterToastr.lengthShort, position:  FlutterToastr.bottom);

             clearAllFields();
           },
           onError: (error) {
             setState((){
               isShowLoader = false;
             });
             FlutterToastr.show(error.message, context, duration: FlutterToastr.lengthShort, position:  FlutterToastr.bottom);
           },
           headers: {
             // 'Authorization': 'Bearer $token',
             "Accept":"application/json",
             "Content-Type":"application/json"
           },
           data: FormData.fromMap(map)
       );
     } else {
       setState((){
         isShowLoader = false;
       });
       FlutterToastr.show('No internet connection.', context, duration: FlutterToastr.lengthShort, position:  FlutterToastr.bottom);
     }
    });
  }

  void clearAllFields(){
    imeController.text = '';
    datumController.text = '';
    mestoController.text = '';
    kontaktController.text = '';
    postaController.text = '';
    adresaController.text = '';
    optsinaController.text = '';
    zaniController.text = '';
  }

  showIOSDatePicker(BuildContext context, Function(DateTime)? onConfirm){
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        theme: const DatePickerTheme(
          backgroundColor: Colors.white,
          cancelStyle: TextStyle(color: Colors.grey),
          itemStyle: TextStyle(color: Colors.black),
          //  containerHeight: 20.0.h,
        ),
        minTime: DateTime(1920, 1, 1) ,
        // minTime: DateTime.now().subtract(const Duration(days: 2)),
        maxTime: DateTime(DateTime.now().year + 5, 12, 31), onChanged: (date) {
        // maxTime: DateTime.now()/*.add(Duration(days: 1))*/, onChanged: (date) { //DateTime(DateTime.now().year, 12, 31).add(Duration(days: 1825)), onChanged: (date) {
          print('change $date');
        }, onConfirm: onConfirm,
        currentTime: DateTime.now(), locale: LocaleType.en);
  }

}


class Media{
  String? filePath;
  String? fileType;

  Media({this.filePath, this.fileType});
}

class Quiz{
  String? question;

  String? opt1;
  String? opt2;
  String? opt3;
  String? correct;

  Quiz({this.question, this.opt1, this.opt2, this.opt3, this.correct});
}

class BaseClient{

  static final Dio _dio = Dio();
  static const int TIME_OUT_DURATION = 120; // in milliseconds

  // POST request
  static post(
      String url, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        required Function(Response response) onSuccess,
        Function(ApiException)? onError,
        Function(int total, int progress)? onSendProgress, // while sending (uploading) progress
        Function(int total, int progress)? onReceiveProgress, // while receiving data(response)
        Function? onLoading,
        dynamic data,
      }) async {
    try {
      print('[===============$url============]');
      // 1) indicate loading state
      onLoading?.call();
      // 2) try to perform http request
      var response = await _dio.post(
        url,
        data: data,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        queryParameters: queryParameters,
        options: Options(headers: headers,receiveTimeout: const Duration(seconds: TIME_OUT_DURATION), sendTimeout: const Duration(seconds: TIME_OUT_DURATION)),
      );
      // 3) return response (api done successfully)
      await onSuccess.call(response);
    } on DioError catch (error) { // dio error (api reach the server but not performed successfully

      // no internet connection
      print(error.response);

      // no response
      if(error.response!.data['message'] == null){

        var exception = ApiException(url: url, message: error.message!,);
        return onError?.call(exception) ?? handleApiError(exception);
      }

      // check if the error is 500 (server problem)
      if(error.response?.statusCode == 500){
        print(error.message);

        var exception = ApiException(message: "Something went wrong. Please try again.", url: url, statusCode: 500,);
        return onError?.call(exception) ?? handleApiError(exception);
      }

      var exception = ApiException(message: error.response!.data['message'], url: url, statusCode: error.response?.statusCode ?? 404,);
      return onError?.call(exception) ?? handleApiError(exception);
    }on SocketException { // No internet connection
      onError?.call(ApiException(message: "No internet connection. Please try again.", url: url,));
    } on TimeoutException { // Api call went out of time
      onError?.call(ApiException(message: "Something went wrong. Please try again.", url: url,));
    } catch (error) {
      // unexpected error for example (parsing json error)
      onError?.call(ApiException(message: error.toString(), url: url,));
    }
  }

  static handleApiError(ApiException apiException){

    String msg = apiException.response?.data?['message'] ?? apiException.message;
    print( apiException.response?.data );
    // CustomSnackBar.showCustomErrorToast(message: msg);
  }
}