import 'package:douyin/model/reply_model.dart';
import 'package:flutter/material.dart';

class RecommendProvider with ChangeNotifier{
  bool isFav = false;
  int favCount = 0;

  ReplyModel reply;

  RecommendProvider(){
    getReply();
  }

  getReply(){
    reply = ReplyModel(
        isFav: true,
        afterReplies: List<ReplyModel>(),
        replyContent: "真可爱，真好看，真厉害~真可爱，真好看，真厉害~",
        replyMakerAvatar:
        "https://pic2.zhimg.com/v2-a88cd7618933272ca681f86398e6240d_xll.jpg",
        replyMakerName: "ABC",
        whenReplied: "3小时前");
    return reply;
  }

  tapFav(){
    this.isFav=!this.isFav;
    if(isFav){
      this.favCount--;

    }else{
      this.favCount++;
    }
    notifyListeners();
  }


}

