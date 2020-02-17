import 'package:douyin/providers/AtUserProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';

class FriendList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var rpx = MediaQuery.of(context).size.width / 750;
    ScrollController controller = ScrollController();
    AtUserProvider provider = Provider.of<AtUserProvider>(context);
    List<String> groupList = provider.groupList;
    return provider != null
        ? Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text('@好友'),
              //设置AppBar的高度，如果想变动appBar的高度，就可以用PreferredSize包起来，就可以
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(80 * rpx),
                child: Container(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 20.0 * rpx),
                  padding: EdgeInsets.symmetric(horizontal: 20 * rpx),
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.search,
                          color: Colors.grey[500],
                        ),
                        hintText: '搜索用户备注或名字',
                        hintStyle: TextStyle(color: Colors.grey[500])),
                  ),
                ),
              ),
            ),
            //StrickyHeader不能放到SingleChildScrollView里，否则没有吸顶效果,
            //放到ListViewBuilder里
            body: ListView.builder(
              shrinkWrap: true,
              controller: controller,
              itemCount: groupList.length,
              itemBuilder: (BuildContext context, int index) {
                return StickyHeader(
                  header: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 20 * rpx),
                    height: 50,
                    decoration: BoxDecoration(color: Colors.black),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      groupList[index].toString(),
                      style: TextStyle(color: Colors.white, fontSize: 35 * rpx),
                    ),
                  ),
                  content: genContactList(
                      provider.result[provider.groupList[index]],
                      context,
                      controller),
                );
              },
            ))
        : Scaffold();
  }
}

getUserList(BuildContext context, ScrollController controller) {
  AtUserProvider provider = Provider.of<AtUserProvider>(context);

  var data = provider.result;
  List<String> groupList = provider.groupList;
  return ListView.builder(
      shrinkWrap: true,
      controller: controller,
      itemCount: groupList.length,
      itemBuilder: (BuildContext context, int index) {
        return StickyHeader(
          header: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(color: Colors.black),
            child: Text(
              groupList[index].toString(),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          content: genContactList(
              provider.result[provider.groupList[index]], context, controller),
        );
      });
}

genContactList(
    List<dynamic> friends, BuildContext context, ScrollController controller) {
  var rpx = MediaQuery.of(context).size.width / 750;
  return ListView.builder(
      shrinkWrap: true,
      controller: controller,
      itemCount: friends.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          //加Container背景色
          decoration: BoxDecoration(color: Colors.black),
          height: 130 * rpx,
          child: Row(
            children: <Widget>[
              Container(
                width: 100 * rpx,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(friends[index]["avatarUrl"]),
                ),
              ),
              Container(
                width: 500 * rpx,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        friends[index]["userName"],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 32 * rpx, color: Colors.white),
                      ),
                    ),
                    friends[index]["desc"].toString().length == 0
                        ? Container(
                            child: Text(""),
                          )
                        : Container(
                            child: Text(
                              friends[index]["desc"],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.grey[500]),
                            ),
                          )
                  ],
                ),
              ),
              Container(
                width: 150 * rpx,
                child: Icon(
                  Icons.phone,
                  color: Colors.grey[500],
                ),
              )
            ],
          ),
        );
      });
}
