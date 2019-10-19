import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:provider/provider.dart';

import 'package:ptliangyuetian/config/router_manger.dart';

import 'package:ptliangyuetian/provider/provider_widget.dart';
import 'package:ptliangyuetian/view_model/home_model.dart';
import 'package:ptliangyuetian/view_model/scroll_controller_model.dart';
import 'package:ptliangyuetian/ui/helper/refresh_helper.dart';

const double kHomeRefreshHeight = 180.0;

class HomePage extends StatefulWidget {

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    var bannerHeight = MediaQuery
        .of(context)
        .size
        .width * 5 / 11;

    return ProviderWidget2<HomeModel, TapToTopModel>(
      model1: HomeModel(),
      model2: TapToTopModel(PrimaryScrollController.of(context),
          height: bannerHeight - kToolbarHeight),
      onModelReady: (homeModel, tapToTopModel) {
        homeModel.initData();
        tapToTopModel.init();
      },
      builder: (context, homeModel, tapToTopModel, child) {
        return Scaffold(
            body: MediaQuery.removePadding(
                context: context,
                removeTop: false,
                child: Builder(builder: (_) {
                  return RefreshConfiguration.copyAncestor(
                      context: context,
                      // 下拉触发二楼距离
                      twiceTriggerDistance: kHomeRefreshHeight - 15,
                      //最大下拉距离,android默认为0,这里为了触发二楼
                      maxOverScrollExtent: kHomeRefreshHeight,
                      child: SmartRefresher(
                          controller: homeModel.refreshController,
                          header: HomeRefreshHeader(),
                          enableTwoLevel: homeModel.idle,
                          onTwoLevel: () async {
                            await Navigator.of(context)
                                .pushNamed(RouteName.homeSecondFloor);
                            await Future.delayed(Duration(milliseconds: 300));
                            Provider
                                .of<HomeModel>(context)
                                .refreshController
                                .twoLevelComplete();
                          },
                          footer: RefresherFooter(),
                          enablePullDown: homeModel.idle,
                          onRefresh: homeModel.refresh,
                          onLoading: homeModel.loadMore,
                          enablePullUp: homeModel.list.isNotEmpty,
                          child: CustomScrollView(
                              controller: tapToTopModel.scrollController,
                              slivers: <Widget>[
                                SliverToBoxAdapter(),
                              ]
                          )
                      )
                  );
                })
            )
        );
      },
    );
  }
}