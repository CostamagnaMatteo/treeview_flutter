import 'package:flutter/material.dart';
import 'package:treeview/model/tree_view_entry.dart';
import 'package:treeview/typedef.dart';

/**
 * Task to do:
 * 
 * 1. Esporre le gesture per il widget
 * 2. Terminare la grfica
 */

class TreeViewEntry<T> extends StatefulWidget {
  TreeViewEntryModel<T> data;
  final FnBuildNode<T> buildNodeFn;

  final FnOnDoubleTap<T>? onDoubleTap;

  bool isCollapsed;
  bool isCollapsable;

  TreeViewEntry({
    super.key,
    required this.data,
    required this.buildNodeFn,
    this.isCollapsable = true,
    this.isCollapsed = true,

    this.onDoubleTap,
  });

  @override
  State<StatefulWidget> createState() => _TreeViewEntryState<T>();
}

class _TreeViewEntryState<T> extends State<TreeViewEntry<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          child: widget.buildNodeFn(widget.data.item),
          onDoubleTap: () {
            setState(() {
              widget.isCollapsed = !widget.isCollapsed;
            });

            if (widget.onDoubleTap != null) {
              widget.onDoubleTap!(widget.data.item);
            }
          },
        ),
        widget.isCollapsed
            ? Padding(
                padding: EdgeInsets.only(left: 50),
                child: Column(
                  children: [
                    ...widget.data.childeren.map(
                      (e) => TreeViewEntry(
                        data: e,
                        buildNodeFn: widget.buildNodeFn,
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
