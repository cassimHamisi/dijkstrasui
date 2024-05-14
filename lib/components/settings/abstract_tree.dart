import 'package:dijkstrasui/components/settings/node.dart';
import 'package:flutter/material.dart';

abstract class AbstractTree<T extends num> {
  AbstractTree({required this.root});
  Node<T>? root;

  void addNode(T value);
  void traverse(Map<Offset, Offset> map, Map<Offset, T> valueMap);
  void fromList(List<T> list);

  @override
  String toString() {
    return root.toString();
  }
}
