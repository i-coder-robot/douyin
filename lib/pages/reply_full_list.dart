import 'package:douyin/components/recommend/after_reply.dart';
import 'package:douyin/model/reply_model.dart';
import 'package:douyin/providers/recommend_provider.dart';
import 'package:douyin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReplyFullList extends StatelessWidget {

  const ReplyFullList({Key key,this.pCtx}):super(key:key);
  final BuildContext pCtx;

  @override
  Widget build(BuildContext context) {
    var rpx = MediaQuery
        .of(context)
        .size
        .width / 750;
    //TODO 注意，这个地方要放入传递过来的Context，否则抛错
    RecommendProvider provider = Provider.of<RecommendProvider>(pCtx);
    ReplyModel replyModel = provider.replyModel;
    List<ReplyModel> replies = List<ReplyModel>();
    replies.add(replyModel);
    replies.add(replyModel);
    replies.add(replyModel);

    ScrollController _controller = ScrollController();

    return SingleChildScrollView(
      child: Column(
        //对于Column加载是无限延长的，所以要给他一个最小高度
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 80 * rpx,
            child: ListTile(
              title: Center(child: Text("10条评论")),
              //头部位置
              leading: Container(width: 10 * rpx,),
              //尾部位置
              trailing: IconButton(icon: Icon(Icons.close), onPressed: () {},),
            ),
          ),
          genReplyList(replies,_controller),
        ],
      ),
    );
  }
}

