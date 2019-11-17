import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'facts.dart';
import 'colors.dart';

void main() =>
    runApp(
        new MaterialApp(
          home: new Home(),
          debugShowCheckedModeBanner: false,
        )
    );


class Home extends StatefulWidget{
  @override
  _HomeState createState() => new _HomeState();

}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  Animation animation;
  AnimationController animationController;

  @override
  void initState(){
    super.initState();
    animationController = new AnimationController(vsync: this, duration: new Duration(seconds: 2));
    animation = new CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn);
    animation.addListener((){
      this.setState((){

      });
    });
    animationController.forward();
  }

  @override
  void dispose(){
  animationController.dispose();
  super.dispose();

  }


  int factCounter = 0;
  int colorCounter = 0;
  void showFacts(){
    setState(() {

      dispfact = facts[factCounter];
      dispColors = bgColors[colorCounter];

      factCounter = factCounter < facts.length - 1 ? factCounter + 1 : 0;
      colorCounter = colorCounter < bgColors.length - 1 ? colorCounter + 1 : 0;

      animationController.reset();
      animationController.forward();


    });
  }









  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: dispColors,
      body: new Padding(padding: const EdgeInsets.symmetric(vertical: 75.0),

        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              new Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: new Text(
                      "Did You Know?",
                      style: new TextStyle(color: Colors.white, fontSize: 30.0),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 60.0),
                child: new Opacity(
                  opacity: animation.value * 1,
                  child: new Transform(
                    transform: new Matrix4.translationValues(0.0, animation.value*-50.0, 0.0),
                    child: new Text(dispfact, style: new TextStyle(color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w300),),
                  ),
                ),
              ),
              new MaterialButton(
                color: Colors.white,
                minWidth: 160.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 60.0, vertical: 18.0),
                  child: new Text("Show Another Fun Fact",
                    style: new TextStyle(fontSize: 15.0, color: dispColors),),
                ),
                onPressed: showFacts,

              )
            ],
          ),
        ),
      ),


    );
  }

}