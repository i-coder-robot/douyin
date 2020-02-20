import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyRefresh extends StatefulWidget {
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  RefreshController controller = RefreshController(initialRefresh:false);
  var currentNum = 0;


  @override
  _MyRefreshState createState() => _MyRefreshState();
}

class _MyRefreshState extends State<MyRefresh> {


  _onRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      widget.controller.refreshCompleted();
      setState(() {
        widget.items.add((widget.items.length + 1).toString());
      });
    });
  }

  _onLoading() async {
    await Future.delayed(Duration(seconds: 1));
    widget.controller.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("上拉加载");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("加载失败！点击重试！");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("松手,加载更多!");
            } else {
              body = Text("没有更多数据了!");
            }
            return Container(
              height: 55.0,
              child: body,
            );
          },
        ),
        controller: widget.controller,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
            itemCount:  widget.items.length,
            itemExtent: 100.0,
            itemBuilder: (BuildContext context, int index){
          return Card(child: Center(child: Text(widget.items[index]),),);
        }),
      ),
    );
  }
}
