import 'package:douyin/components/recommend/after_reply.dart';
import 'package:douyin/pages/reply_full_list.dart';
import 'package:flutter/material.dart';
import 'package:douyin/model/reply_model.dart';

genReplyList(List<ReplyModel> replies) {
  return ListView.builder(
    //对于这种ListView.builder也要给一个固定的高度，设置shrinkWrap: true,
    shrinkWrap: true,
    itemCount: replies.length,
    itemBuilder: (context, index) {
      return AfterReply(afterReply: replies[index]);
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
              //TODO:这句话干啥的？
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: ReplyFullList(pCtx: context),
          ),
        );
      });
}
