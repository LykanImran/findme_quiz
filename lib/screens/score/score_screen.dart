import 'package:avatar_glow/avatar_glow.dart';
import 'package:findme_quiz/constants.dart';
import 'package:findme_quiz/controllers/question_controller.dart';
import 'package:findme_quiz/screens/quiz/components/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          //  WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Center(
            child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 35,),
              //  Spacer(flex: 3),
                AvatarGlow(
                  // glowColor: Colors.blue,
                  endRadius: 120.0,
                  duration: Duration(milliseconds: 1000),
                  repeat: true,
                  showTwoGlows: true,
                  repeatPauseDuration: Duration(milliseconds: 500),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    padding: EdgeInsets.all(kDefaultPadding + 25),
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      // borderRadius: new BorderRadius.circular(15.0),
                      boxShadow: <BoxShadow>[
                        new BoxShadow(
                            color: Colors.black38,
                            blurRadius: 2.0,
                            spreadRadius: 1.0,
                            offset: new Offset(0.0, 1.0)),
                      ],
                      // borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text.rich(
                      TextSpan(
                        text: "Your Score\n",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: primaryColor),
                        children: [
                          TextSpan(
                            text:
                                "${_qnController.correctAns }/${_qnController.questions.length}",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(color: primaryColor),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                analysisBuilder(context, _qnController),
                btnBuilder(context)
              //  Spacer(),
               // Spacer(flex: 3),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget analysisBuilder(BuildContext context, QuestionController questionController) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Container(
        height: MediaQuery.of(context).size.height*0.20,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                textBuilder("${(questionController.correctAns/questionController.questions.length)*100} %", "Result", primaryColor),
                textBuilder("${questionController.questions.length}", "Total Question", primaryColor),

              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.start,

              children: [
              textBuilder("${questionController.correctAns}", "Correct", Colors.green),
              textBuilder("${questionController.questions.length-questionController.correctAns}", "Wrong", Colors.red)

            ],)

          ],
        ),
      ),
    );
  }

  Widget textBuilder(String title, String subtitle, Color color) {
    return Container(
      //color: Colors.indigo,
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,

        children: [
          Icon(
            Icons.circle,
            color: color,
          ),
          SizedBox(
            width: 10,
          ),
          Text.rich(
            TextSpan(
              text: "${title}\n",
              style: TextStyle(fontSize: 20, color: color),
              children: [
                TextSpan(
                  text: "${subtitle}",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget btnBuilder(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height*0.30,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.start,

            children: [
            iconBuilder(Icons.replay, "Play Again", Colors.teal),

              iconBuilder(Icons.remove_red_eye_outlined, "Review Answer", Colors.brown),
              iconBuilder(Icons.share, "Share Score", Colors.deepPurpleAccent),
            ],
          ),
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              iconBuilder(Icons.picture_as_pdf, "Generate Pdf", Colors.blue),
              iconBuilder(Icons.home_outlined, "Home", Colors.pink),
              iconBuilder(Icons.leaderboard_outlined, "Leader Board", Colors.blueGrey),

            ],)

        ],
      ),
    );
  }

  Widget iconBuilder(IconData icon, String title, Color bgColor){
    return Column(
      children: [
       CircleAvatar(
         radius: 25,
         backgroundColor: bgColor,
         child: Icon(icon , color: Colors.white,),
       ),
        SizedBox(height: 5,),
        Text(title)
      ],
    );
  }
}
