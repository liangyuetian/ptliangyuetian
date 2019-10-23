import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ptliangyuetian/ui/helper/refresh_helper.dart';
import 'package:ptliangyuetian/ui/widget/article_skeleton.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:ptliangyuetian/provider/privider_widget.dart';
import 'package:ptliangyuetian/provider/view_state_widget.dart';
import 'package:ptliangyuetian/utils/status_bar_utils.dart';
import 'package:ptliangyuetian/view_model/home_model.dart';
import 'package:ptliangyuetian/view_model/scroll_controller_model.dart';
import 'package:ptliangyuetian/widget/skeleton.dart';
import 'package:ptliangyuetian/model/article.dart';
import 'package:ptliangyuetian/ui/widget/article_list_Item.dart';

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
    var bannerHeight = MediaQuery.of(context).size.width * 5 / 11;

    return ProviderWidget2<HomeModel, TapToTopModel>(
        model1: HomeModel(),
        // 使用PrimaryScrollController保留iOS点击状态栏回到顶部的功能
        model2: TapToTopModel(PrimaryScrollController.of(context),
            height: bannerHeight - kToolbarHeight),
        onModelReady: (homeModel, tapToTopModel) {
          homeModel.initData();
          tapToTopModel.init();
        },
        builder: (context, homeModel, tapToTopModel, child) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              heroTag: 'homeFab',
              key: ValueKey(Icons.search),
              child: Icon(
                Icons.search,
              ),
            ),
            body: Builder(builder: (_) {
              if (homeModel.error) {
                return AnnotatedRegion<SystemUiOverlayStyle>( // 改变状态栏颜色
                  value: StatusBarUtils.systemUiOverlayStyle(context),
                  child: ViewStateWidget(
                    onPressed: homeModel.initData,
                    message: homeModel.errorMessage,
                  ),
                );
              }
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
                  footer: RefresherFooter(),
                  enablePullDown: homeModel.idle,
                  onRefresh: homeModel.refresh,
                  onLoading: homeModel.loadMore,
                  enablePullUp: homeModel.list.isNotEmpty,
                  child: CustomScrollView(
                    controller: tapToTopModel.scrollController,
                    slivers: <Widget>[
                      SliverToBoxAdapter(),
                      SliverAppBar(),
                      if (homeModel.empty)
                        SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: ViewStateEmptyWidget(
                                  onPressed: homeModel.initData),
                            )),
                      if (homeModel.idle) HomeTopArticleList(),
                      HomeArticleList(),
                    ],
                  )
                )
              );
            },),
          );
        });
  }
}

class HomeTopArticleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(child: new Text('HomeTopArticleList'));
  }
}

class HomeArticleList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    HomeModel homeModel = Provider.of(context);
    if (homeModel.busy) {
      return SliverToBoxAdapter(
        child: SkeletonList(
          builder: (context, index) => ArticleSkeletonItem(),
        ),
      );
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          Article item = homeModel.list[index];
          return ArticleItemWidget(
            item,
            index: index,
          );
        },
        childCount: homeModel.list?.length ?? 0,
      ),
    );
  }
}

