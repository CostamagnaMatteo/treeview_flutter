class TreeViewEntryModel<T> {
  T item;
  List<TreeViewEntryModel<T>> childeren;

  TreeViewEntryModel({required this.item, required this.childeren});
  bool hasChildren() => childeren.isNotEmpty;
}
