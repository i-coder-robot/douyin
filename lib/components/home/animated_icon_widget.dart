import 'package:douyin/providers/recommend_provider.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class AnimatedIconWidget extends StatefulWidget {



  @override
  _AnimatedIconWidgetState createState() => _AnimatedIconWidgetState();

  AnimatedIconWidget({Key key,
    @required this.stageList,
    @required this.icon,
    @required this.size,
    this.callBack,
    this.callBackDelay,
    this.provider
  }):super(key:key);


  final List<IconAnimationStage> stageList;
  final IconData icon;
  final VoidCallback callBack;
  final double size;
  final RecommendProvider provider;
  final Duration callBackDelay;

}

class _AnimatedIconWidgetState extends State<AnimatedIconWidget> with TickerProviderStateMixin {

  List<IconAnimationStage> stageList =  List<IconAnimationStage>();
  List<AnimationController> controllerList= List<AnimationController>();
  List<Animation<double>> animations = List<Animation<double>>();
  Animation<double> currentAnimation;
  Color currentColor;
  int currentIndex;
  List<bool> isAdded = List<bool>();
  double currentSize;
  bool isInit = true;

  loopAnimation(index){
    currentColor = currentColor==null ? stageList.first.color:currentColor;
    if (index<controllerList.length-1 && !isAdded[index]){
      animations[index] = animations[index]..addStatusListener((status){
        if(status == AnimationStatus.completed){
          currentAnimation=animations[index+1];
          currentColor = stageList[index].color;

          controllerList[index+1].forward(from: 0);
          loopAnimation(index+1);
        }
      })..addListener((){
        setState(() {

        });
      });
      isAdded[index] = true;
    }else if (index == controllerList.length-1 && !isAdded[index]){
      animations[index] = animations[index]..addStatusListener((status){
        currentColor = stageList[index].color;
        if (status == AnimationStatus.completed){
          if (widget.callBack!=null){
            if (widget.callBackDelay!=null){
              Timer(widget.callBackDelay,(){
                widget.callBack();
              });
            }else{
              widget.callBack();
            }

          }
        }
      })..addListener((){
        setState(() {

        });
      });
      isAdded[index] = true;
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    stageList = widget.stageList;

    List.generate(stageList.length, (index){
      var curStage = stageList[index];
      isAdded.add(false);
      controllerList.add(AnimationController(vsync: this,duration: curStage.duration));
      animations.add(Tween(begin: curStage.start,end: curStage.end).animate(controllerList[index]));
    });
    currentAnimation = animations.first;
    loopAnimation(0);
  }



  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(0.0),
      onPressed: (){
        controllerList.first.forward(from: 0);
      },
      icon: Icon(
        widget.icon,
        size: widget.size*currentAnimation.value,
        color: currentColor,
      )
    );
  }
}


class IconAnimationStage{
  double start;
  double end;
  Color color;
  Duration duration;

  IconAnimationStage({this.start, this.end, this.color, this.duration});


}