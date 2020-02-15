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
          Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 100 * rpx,
                  ),
                  Container(
                    width: 550 * rpx,
                    child: Row(
                      //让一行紧凑一些，在纵向的排列
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 15 * rpx),
                          width: 70 * rpx,
                          height: 70 * rpx,
                          padding: EdgeInsets.all(10 * rpx),
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage("${afterReply.replyMakerAvatar}"),
                          ),
                        ),
                        Container(
                          width: 480 * rpx,
                          child: ListTile(
                            title: Text("${afterReply.replyMakerName}"),
                            //让多个文本连接在一起的一个控件RichText,里面的TextSpan,类似html的span
                            subtitle: RichText(
                              text:
                                  TextSpan(text: "${afterReply.replyContent}",
                                  style: TextStyle(color: Colors.grey[500]),
                                  children:[TextSpan(text: "  ${afterReply.whenReplied}")],
                                  ),
                            ),
//                            subtitle: Text(
//                              "${afterReply.replyContent}",
//                              maxLines: 2,
//                              overflow: TextOverflow.ellipsis,
//                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: 100 * rpx,
                child: IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
