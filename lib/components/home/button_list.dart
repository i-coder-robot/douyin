import 'package:douyin/providers/recommend_provider.dart';
import 'package:douyin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'animated_icon_widget.dart';
import 'icon_text.dart';

class ButtonList extends StatefulWidget {
  @override
  _ButtonListState createState() => _ButtonListState();
}

class _ButtonListState extends State<ButtonList> {
  @override
  Widget build(BuildContext context) {
    var rpx = MediaQuery.of(context).size.width / 750;
    RecommendProvider provider = Provider.of<RecommendProvider>(context);
    double iconSize = 70 * rpx;

    List<IconAnimationStage> stage1 = List<IconAnimationStage>();
    stage1.add(IconAnimationStage(
      color: Colors.grey[100],
      start: 1.0,
      end: 0.0,
      duration: Duration(milliseconds: 200)
    ));
    stage1.add(IconAnimationStage(
      color: Colors.redAccent,
      start: 0.0,
      end: 1.3,
      duration: Duration(milliseconds: 300)
    ));
    stage1.add(IconAnimationStage(
      color: Colors.redAccent,
      start: 1.3,
      end: 1.0,
      duration: Duration(milliseconds: 100)
    ));

    List<IconAnimationStage> stage2 = List<IconAnimationStage>();
    stage2.add(IconAnimationStage(
      color: Colors.grey[100],
      start: 1.0,
      end: 1.2,
      duration: Duration(milliseconds: 200)
    ));
    stage2.add(IconAnimationStage(
      color: Colors.grey[100],
      start: 1.2,
      end: 1.0,
      duration: Duration(milliseconds: 200)
    ));

    List<IconAnimationStage> stage3 = List<IconAnimationStage>();
    stage3.add(IconAnimationStage(
        color: Colors.redAccent,
        start: 1.0,
        end: 1.2,
        duration: Duration(milliseconds: 200)
    ));
    stage3.add(IconAnimationStage(
        color: Colors.grey[100],
        start: 1.2,
        end: 1.0,
        duration: Duration(milliseconds: 200)
    ));


    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 90*rpx,
            height: 105*rpx,
            child: Stack(
              children: <Widget>[
                Container(
                  width: 90*rpx,
                  height: 90*rpx,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://pic3.zhimg.com/v2-28ccd0256a1ff532bab628f913bea219_im.jpg"),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 25*rpx,
                  child: Container(
                    width: 40*rpx,
                    height: 40*rpx,
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(25)),
                    child: Icon(
                      Icons.add,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          //红心
          IconText(
              text: "${provider.favCount}",
              icon: !provider.isFav ? AnimatedIconWidget(
                key:UniqueKey(),
                stageList: stage1,
                icon: Icons.favorite,
                size: iconSize,
                provider: provider,
                callBack: (){
                  provider.tapFav();
                },
            ):AnimatedIconWidget(
                key:UniqueKey(),
                stageList: stage3,
                icon: Icons.favorite,
                size: iconSize,
                provider: provider,
                callBack: (){
                  provider.tapFav();
                },
              ),
          ),
          //回复
          IconText(
            text: "111",
              icon: AnimatedIconWidget(
                stageList: stage2,
                icon:Icons.comment,
                size: iconSize,
                callBackDelay: Duration(milliseconds: 200),
                callBack: (){
                  showBottom(context, provider);
                },
              ),
             ),
          IconText(
            text: "888",
              icon: AnimatedIconWidget(
                stageList: stage2,
                icon: Icons.reply,
                size: iconSize,
              ),
              ),
        ],
      ),
    );
  }
}
