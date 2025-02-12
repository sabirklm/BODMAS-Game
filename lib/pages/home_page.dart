import '/data/game_status.dart';
import '/pages/pages.dart';

import '/controllers/utills.dart';
import '/widgets/widgets.dart';
import '/controllers/controllers.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GameController gameController = Get.put(GameController());
  final _confAnimationContriller = ConfettiController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Obx(() => Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.to(const RulesPage(), routeName: "/gamerules");
                          },
                          icon: const Icon(
                            Icons.info_rounded,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: width * 0.080),
                          child: Text(
                            "B O D M A S",
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 4,
                                    ),
                          ),
                        ),
                        CupertinoSwitch(
                          activeColor: Colors.black,
                          value: gameController.isDarkTheme.value,
                          onChanged: (value) {
                            gameController.isDarkTheme.value =
                                !gameController.isDarkTheme.value;
                            Get.changeTheme(gameController.isDarkTheme.value
                                ? ThemeData.dark()
                                : ThemeData.light());
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.008),
                          child: Icon(
                            gameController.isDarkTheme.value
                                ? Icons.dark_mode
                                : Icons.light_mode,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                //fIRST ROW
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DisplayedChar(
                      char: gameController.roun1UserPattern[0] ?? " ",
                      fillColor: gameController.round1Color[0],
                    ),
                    DisplayedChar(
                      char: gameController.roun1UserPattern[1] ?? " ",
                      fillColor: gameController.round1Color[1],
                    ),
                    DisplayedChar(
                      char: gameController.roun1UserPattern[2] ?? " ",
                      fillColor: gameController.round1Color[2],
                    ),
                    DisplayedChar(
                      char: gameController.roun1UserPattern[3] ?? " ",
                      fillColor: gameController.round1Color[3],
                    ),
                    DisplayedChar(
                      char: gameController.roun1UserPattern[4] ?? " ",
                      fillColor: gameController.round1Color[4],
                    ),
                    DisplayedChar(
                      char:
                          "${convertExpression(gameController.randomPattern)}",
                      fillColor: const Color(0xff4E4E4E),
                    ),
                  ],
                ),
                //SECOND ROW

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DisplayedChar(
                      char: gameController.roun2UserPattern[0] ?? " ",
                      fillColor: gameController.round2Color[0],
                    ),
                    DisplayedChar(
                      char: gameController.roun2UserPattern[1] ?? " ",
                      fillColor: gameController.round2Color[1],
                    ),
                    DisplayedChar(
                      char: gameController.roun2UserPattern[2] ?? " ",
                      fillColor: gameController.round2Color[2],
                    ),
                    DisplayedChar(
                      char: gameController.roun2UserPattern[3] ?? " ",
                      fillColor: gameController.round2Color[3],
                    ),
                    DisplayedChar(
                      char: gameController.roun2UserPattern[4] ?? " ",
                      fillColor: gameController.round2Color[4],
                    ),
                    DisplayedChar(
                      char:
                          "${convertExpression(gameController.randomPattern)}",
                      fillColor: const Color(0xff4E4E4E),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DisplayedChar(
                      char: gameController.roun3UserPattern[0] ?? " ",
                      fillColor: gameController.round3Color[0],
                    ),
                    DisplayedChar(
                      char: gameController.roun3UserPattern[1] ?? " ",
                      fillColor: gameController.round3Color[1],
                    ),
                    DisplayedChar(
                      char: gameController.roun3UserPattern[2] ?? " ",
                      fillColor: gameController.round3Color[2],
                    ),
                    DisplayedChar(
                      char: gameController.roun3UserPattern[3] ?? " ",
                      fillColor: gameController.round3Color[3],
                    ),
                    DisplayedChar(
                      char: gameController.roun3UserPattern[4] ?? " ",
                      fillColor: gameController.round3Color[4],
                    ),
                    DisplayedChar(
                      char:
                          "${convertExpression(gameController.randomPattern)}",
                      fillColor: const Color(0xff4E4E4E),
                    ),
                  ],
                ),

                if (gameController.isGameOwn.value)
                  ConfettiWidget(
                    confettiController: _confAnimationContriller,
                    emissionFrequency: 0.1,
                    blastDirectionality: BlastDirectionality.explosive,
                    numberOfParticles: 100,
                    blastDirection: 0.2,
                  ),
                if (gameController.round.value > 3 &&
                    !gameController.isGameOwn.value)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Oops!! Try again",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          DisplayedChar(
                            char: gameController.randomPattern[0],
                            fillColor: Colors.green,
                          ),
                          DisplayedChar(
                            char: gameController.randomPattern[1],
                            fillColor: Colors.green,
                          ),
                          DisplayedChar(
                            char: gameController.randomPattern[2],
                            fillColor: Colors.green,
                          ),
                          DisplayedChar(
                            char: gameController.randomPattern[3],
                            fillColor: Colors.green,
                          ),
                          DisplayedChar(
                            char: gameController.randomPattern[4],
                            fillColor: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ),

                Container(
                  width: width > 1230
                      ? width * 0.4 + 57
                      : (width < 434)
                          ? width * 0.99
                          : width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          KeyChar(
                            charWidget: Text(
                              "1",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            onTap: () {
                              gameController.enterNumber(
                                  gameController.round.value, "1");
                            },
                          ),
                          KeyChar(
                            charWidget: Text(
                              "2",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            onTap: () {
                              gameController.enterNumber(
                                  gameController.round.value, "2");
                            },
                          ),
                          KeyChar(
                            charWidget: Text(
                              "3",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            onTap: () {
                              gameController.enterNumber(
                                  gameController.round.value, "3");
                            },
                          ),
                          KeyChar(
                            charWidget: Text(
                              "4",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            onTap: () {
                              gameController.enterNumber(
                                  gameController.round.value, "4");
                            },
                          ),
                          KeyChar(
                            charWidget: Text(
                              "5",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            onTap: () {
                              gameController.enterNumber(
                                  gameController.round.value, "5");
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          KeyChar(
                            charWidget: Text(
                              "6",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            onTap: () {
                              gameController.enterNumber(
                                  gameController.round.value, "6");
                            },
                          ),
                          KeyChar(
                            charWidget: Text(
                              "7",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            onTap: () {
                              gameController.enterNumber(
                                  gameController.round.value, "7");
                            },
                          ),
                          KeyChar(
                            charWidget: Text(
                              "8",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            onTap: () {
                              gameController.enterNumber(
                                  gameController.round.value, "8");
                            },
                          ),
                          KeyChar(
                            charWidget: Text(
                              "9",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            onTap: () {
                              gameController.enterNumber(
                                  gameController.round.value, "9");
                            },
                          ),
                          KeyChar(
                            charWidget: Text(
                              "0",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            onTap: () {
                              gameController.enterNumber(
                                  gameController.round.value, "0");
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          KeyChar(
                            charWidget: Text(
                              "÷",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            onTap: () {
                              //gameController.removeNumber(gameController.round.value);
                              gameController.enterNumber(
                                  gameController.round.value, "÷");
                            },
                          ),
                          KeyChar(
                            charWidget: Text(
                              "×",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            onTap: () {
                              // gameController.removeNumber(gameController.round.value);
                              gameController.enterNumber(
                                  gameController.round.value, "×");
                            },
                          ),
                          KeyChar(
                            charWidget: Text(
                              "+",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            onTap: () {
                              // gameController.removeNumber(gameController.round.value);
                              gameController.enterNumber(
                                  gameController.round.value, "+");
                            },
                          ),
                          KeyChar(
                            charWidget: Text(
                              "-",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            onTap: () {
                              // gameController.removeNumber(gameController.round.value);
                              gameController.enterNumber(
                                  gameController.round.value, "-");
                            },
                          ),
                          KeyChar(
                            charWidget: const Icon(
                              Icons.backspace_rounded,
                            ),
                            onTap: () {
                              gameController
                                  .removeNumber(gameController.round.value);
                            },
                          ),
                          KeyChar(
                            charWidget: Text(
                              "Enter",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            onTap: () {
                              //
                              AnalyticsController().logGameInfo();
                              var myPattern = gameController.randomPattern;
                              //gameController.isValidPattern(myEnterPattern);
                              if (gameController.round.value == 1) {
                                var userPattern =
                                    gameController.roun1UserPattern;
                                if (!gameController
                                    .isValidPattern(userPattern)) {
                                  Get.snackbar("Invalid Equation",
                                      "Please Enter a valid equation");
                                  return;
                                }

                                gameController.giveResult(
                                    1, myPattern, userPattern);
                                if (gameController.isMathGenius(
                                    userPattern, myPattern)) {
                                  gamePlayingStatus(GameStatus(
                                      round: 1,
                                      playedAt: DateTime.now(),
                                      isWon: true));
                                  _confAnimationContriller.play();
                                } else {
                                  gamePlayingStatus(GameStatus(
                                      round: 1,
                                      playedAt: DateTime.now(),
                                      isWon: false));
                                }
                              } else if (gameController.round.value == 2) {
                                var userPattern =
                                    gameController.roun2UserPattern;
                                if (!gameController
                                    .isValidPattern(userPattern)) {
                                  Get.snackbar("Invalid Equation",
                                      "Please Enter a valid equation");
                                  return;
                                }
                                gameController.giveResult(
                                    2, myPattern, userPattern);
                                if (gameController.isMathGenius(
                                    userPattern, myPattern)) {
                                  _confAnimationContriller.play();
                                  gamePlayingStatus(GameStatus(
                                      round: 2,
                                      playedAt: DateTime.now(),
                                      isWon: true));
                                } else {
                                  gamePlayingStatus(GameStatus(
                                      round: 2,
                                      playedAt: DateTime.now(),
                                      isWon: false));
                                }
                              } else if (gameController.round.value == 3) {
                                var userPattern =
                                    gameController.roun3UserPattern;
                                if (!gameController
                                    .isValidPattern(userPattern)) {
                                  Get.snackbar("Invalid Equation",
                                      "Please Enter a valid equation");
                                  return;
                                }
                                gameController.giveResult(
                                    3, myPattern, userPattern);
                                if (gameController.isMathGenius(
                                    userPattern, myPattern)) {
                                  _confAnimationContriller.play();
                                  gamePlayingStatus(GameStatus(
                                      round: 3,
                                      playedAt: DateTime.now(),
                                      isWon: true));
                                } else {
                                  gamePlayingStatus(GameStatus(
                                      round: 3,
                                      playedAt: DateTime.now(),
                                      isWon: false));
                                  String originalPattern = "";
                                  for (int i = 0; i < myPattern.length; i++) {
                                    originalPattern += myPattern[i];
                                  }
                                }
                              }

                              if (gameController.round.value <= 3) {
                                gameController.round.value++;
                              }
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}


/*




  Get.dialog(
                                    Container(
                                      padding: const EdgeInsets.all(32),
                                      margin: EdgeInsets.only(
                                          left: width * 0.3,
                                          right: width * 0.3,
                                          top: height * 0.2,
                                          bottom: height*0.1),
                                      color: Theme.of(context).backgroundColor,
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Material(
                                              child: IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: const Icon(
                                                  Icons.close,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Oops!!\n Try again",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5,
                                          ),
                                          Text(
                                            originalPattern,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.all(16)),
                                            child: const Text(
                                              "Try Again",
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
 */