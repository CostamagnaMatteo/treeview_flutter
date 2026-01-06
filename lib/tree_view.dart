import 'package:flutter/material.dart';
import 'package:treeview/model/tree_view_entry.dart';
import 'package:treeview/tree_view_entry.dart';
import 'package:treeview/typedef.dart';

class TreeView<T> extends StatefulWidget {
  List<TreeViewEntryModel<T>> data;

  final FnBuildNode<T> buildNodeFn;
  final FnOnDoubleTap<T>? onDoubleTap;

  TreeView({
    super.key,
    required this.data,
    required this.buildNodeFn,
    this.onDoubleTap,
  });

  @override
  State<StatefulWidget> createState() => _TreeViewState<T>();
}

class _TreeViewState<T> extends State<TreeView<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.data
          .map(
            (e) => TreeViewEntry<T>(
              data: e,
              buildNodeFn: widget.buildNodeFn,
              isCollapsable: e.hasChildren(),
              isCollapsed: false,
              onDoubleTap: widget.onDoubleTap,
            ),
          )
          .toList(),
    );
  }
}
