import 'package:douyin/model/reply_model.dart';
import 'package:flutter/material.dart';

class AfterReply extends StatelessWidget {
  const AfterReply({Key key, this.afterReply}) : super(key: key);

  final ReplyModel afterReply;

  @override
  Widget build(BuildContext context) {
    var rpx = MediaQuery.of(context).size.width / 750;
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 100 * rpx,
          ),
          Container(
            width: 550 * rpx,
            child: Row(
              children: <Widget>[
                Container(
                  width: 70 * rpx,
                  child: CircleAvatar(
                    backgroundImage:
                    NetworkImage("${afterReply.replyMakerAvatar}"),
                  ),
                ),
                Container(
                  width: 480 * rpx,
                  child: ListTile(
                    title: Text("${afterReply.replyMakerName}"),
                    subtitle: Text("${afterReply.replyContent}",maxLines: 2,overflow: TextOverflow.ellipsis,),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 100 * rpx,
            child: IconButton(
              icon:Icon(Icons.favorite_border),
              onPressed: (){},
            ),
          ),
        ],
      ),
    );
  }
}
