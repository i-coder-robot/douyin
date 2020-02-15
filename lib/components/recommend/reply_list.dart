import 'package:douyin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:douyin/model/reply_model.dart';

class ReplyList extends StatelessWidget {
  const ReplyList({Key key, @required this.replyModel,@required this.controller}) : super(key: key);

  final ReplyModel replyModel;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    var rpx = MediaQuery.of(context).size.width / 750;
    List<ReplyModel> replies = List<ReplyModel>();
    replies.add(replyModel);
    replies.add(replyModel);
    replies.add(replyModel);
    //Column下面溢出了，证明下面是有内容的，所以要用SingleChildScrollView包起来，可以滚动。
    //不通的滚动控件有自己的滚动行为，要想让他们有一致的滚动行为，就要使用一个contrller来控制起来。
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 100 * rpx,
                height: 100 * rpx,
                padding: EdgeInsets.all(10*rpx),
                child: CircleAvatar(
                  backgroundImage: NetworkImage("${replyModel.replyMakerAvatar}"),
                ),
              ),
              Container(
                width: 550 * rpx,
                child: ListTile(
                  title: Text(
                    "${replyModel.replyMakerName}",
                  ),
                  subtitle: Text(
                    "${replyModel.replyContent}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Container(
                width: 100 * rpx,
                child: IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ],
          ),
          genAfterReplyList(replies,controller),
        ],
      ),
    );
  }
}

