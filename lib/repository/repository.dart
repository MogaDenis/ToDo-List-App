abstract interface class Repository<T> {
  List<T> getItems();
  bool addItem(T item);
  bool contains(T item);
  bool removeItem(T item);
  T? removeItemByIndex(int index);
  int getIndexOf(T item);
  T getItemAtIndex(int index);
  bool replaceItem(T oldItem, T newItem);
}