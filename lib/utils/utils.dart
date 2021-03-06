import 'package:douyin/components/recommend/after_reply.dart';
import 'package:douyin/components/recommend/reply_list.dart';
import 'package:douyin/pages/reply_full_list.dart';
import 'package:flutter/material.dart';
import 'package:douyin/model/reply_model.dart';

genReplyList(List<ReplyModel> replies,ScrollController controller) {
  return ListView.builder(
    //对于这种ListView.builder也要给一个固定的高度，设置shrinkWrap: true,
    shrinkWrap: true,
    controller: controller,
    itemCount: replies.length,
    itemBuilder: (context, index) {
      return ReplyList(replyModel: replies[index],controller: controller,);
    },
  );
}

genAfterReplyList(List<ReplyModel> replies,ScrollController controller) {
  return ListView.builder(
    controller: controller,
    shrinkWrap: true,
    itemCount: replies.length,
    itemBuilder: (context, index) {
      return AfterReply(
        afterReply: replies[index],
      );
    },
  );
}

showBottom(context, provider) {
  var h = MediaQuery.of(context).size.height;
  provider.setScreenHeight(h);
  provider.hideBottomBar();
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(10.0),
      ),
      context: context,
      builder: (_) {
        return Container(
          height: 600,
          child: GestureDetector(
            onTap: () {
              //监控焦点的 主要用处就是当用户点击回复框后，键盘弹起，当用户点击键盘以外的地方，键盘消失
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: ReplyFullList(pCtx: context),
          ),
        );
      });
}
