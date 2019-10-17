import 'view_state_model.dart';

abstract class ViewStateListModel<T> extends ViewStateModel {
  List<T> list = [];

  /// 第一次进入页面 loading skeleton
  initData() async {
    setBusy();
    await refresh(init: true);
  }

  refresh({bool init = false}) async {
    try {
      list.clear();
      List<T> data = await loadData();
      if (data.isEmpty) {
        setEmpty();
      } else {
        onCompleted(data);
        list.addAll(data);
        setIdle();
      }
    } catch (e, s) {
      handleException(e, s);
    }
  }

  // 加载数据
  Future<List<T>> loadData();

  onCompleted(List<T> data) {}
}