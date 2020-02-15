import 'package:douyin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:douyin/model/reply_model.dart';

class ReplyList extends StatelessWidget {
  const ReplyList({Key key, this.replyModel}) : super(key: key);

  final ReplyModel replyModel;

  @override
  Widget build(BuildContext context) {
    var rpx = MediaQuery.of(context).size.width / 750;
    List<ReplyModel> replies = List<ReplyModel>();
    replies.add(replyModel);
    replies.add(replyModel);
    replies.add(replyModel);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 100 * rpx,
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
        genReplyList(replies),
      ],
    );
  }
}

