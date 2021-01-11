import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ku_app/core/data/models/base_model.dart';

import '../data/models/base_model.dart';

const SCROLL_REMAINING_OFFSET = 300;
const PROGRESS_HEIGHT = 200.0;

enum PostListState { onSuccess, onFailure, onSortUpdated, onRefresh }

class PostLisViewListener {
  var currentPage = 1;
  var isNoMoreData = false;
  PostListState state;

  VoidCallback _listener;

  void onLoadSuccess({bool isNoMoreData}) {
    this.state = PostListState.onSuccess;
    this.currentPage++;
    this.isNoMoreData = isNoMoreData;
    _listener?.call();
  }

  void onLoadFailure() {
    this.state = PostListState.onFailure;
    this.isNoMoreData = false;
    _listener?.call();
  }

  void onSortUpdated() {
    this.state = PostListState.onSortUpdated;
    this.isNoMoreData = false;
    this.currentPage = 1;
    _listener?.call();
  }

  void onRefreshData() {
    this.state = PostListState.onRefresh;
    this.isNoMoreData = false;
    this.currentPage = 1;
    _listener?.call();
  }

  void addListener(VoidCallback listener) {
    this._listener = listener;
  }

  void dispose() {
    this._listener = null;
  }
}

typedef LazyItem<T extends BaseModel> = Widget Function(T item);

class LazyListView<T extends BaseModel> extends StatefulWidget {
  final List<T> list;
  final Function(int page) onLoadData;
  final PostLisViewListener notifier;
  final LazyItem<T> lazyItem;

  LazyListView({
    Key key,
    @required this.list,
    @required this.onLoadData,
    @required this.lazyItem,
    this.notifier,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<LazyListView> {
  final scrollController = ScrollController();

  var isLoading = false;
  var extentAfter = 0.0;
  var isAddedListener = false;

  PostListState get listState => widget.notifier.state;

  bool get isNoMoreData => widget.notifier.isNoMoreData;

  int get currentPage => widget.notifier.currentPage;

  @override
  void initState() {
    if (widget.list.isEmpty) {
      _setLoading();
    }

    widget.notifier?.addListener(_notifierListener);

    super.initState();
  }

  _notifierListener() {
    switch (listState) {
      case PostListState.onSuccess:
        _loadDone();
        break;
      case PostListState.onFailure:
        break;
      case PostListState.onSortUpdated:
        _refreshData();
        break;
      case PostListState.onRefresh:
        _refreshData();
        break;
    }
  }

  _addScrollListener() {
    if (!isAddedListener) {
      this.isAddedListener = true;
      this.scrollController.addListener(_scrollListener);
    }
  }

  _removeScrollListener() {
    if (isAddedListener) {
      this.isAddedListener = false;
      this.scrollController.removeListener(_scrollListener);
    }
  }

  _scrollListener() {
    isAddedListener = true;
    extentAfter = this.scrollController.position.extentAfter;
    if (extentAfter < SCROLL_REMAINING_OFFSET && !this.isLoading && !this.isNoMoreData) {
      _setLoading();
    }
  }

  void _refreshData() {
    this.widget.list.clear();
    _setLoading();
  }

  void _setLoading() {
    _removeScrollListener();
    this.isLoading = true;
    setState(() {
      widget.list.add(null);
    });
    widget.onLoadData.call(currentPage);
  }

  void _loadDone() {
    setState(() {
      widget.list.remove(null);
    });
    this.isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return _listView();
  }

  Widget _listView() {
    return new RefreshIndicator(
      key: widget.key,
      onRefresh: () async {
        widget.notifier.onRefreshData();
      },
      child: ListView.builder(
        controller: scrollController,
        physics: BouncingScrollPhysics(),
        itemCount: widget.list.length,
        itemBuilder: (ctx, index) {
          if (widget.list[index] == null) {
            return _loading();
          } else {
            _addScrollListener();
            return widget.lazyItem(widget.list[index]);
          }
        },
      ),
    );
  }

  Widget _loading() {
    return Container(
      width: double.infinity,
      height: PROGRESS_HEIGHT,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void dispose() {
    widget.notifier.dispose();
    super.dispose();
  }
}
