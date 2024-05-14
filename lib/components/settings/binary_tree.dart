import 'dart:ui';

import 'package:dijkstrasui/components/settings/abstract_tree.dart';
import 'package:dijkstrasui/components/settings/node.dart';

class BinaryTree<T extends num> extends AbstractTree<T> {
  BinaryTree({required Node<T> node}) : super(root: node);

  //Helper function that converts a value of type A to a node value;
  factory BinaryTree.fromValue(T value) {
    return BinaryTree(node: Node(value: value));
  }

  @override
  void addNode(T value) {
    //Create a node if the root is null
    root ?? Node(value: value);
    //If the root is not null, add value
    if (root != null) {
      root!.add(value);
    }
  }

  @override
  void fromList(List<T> list) {
    //This function receives a list and  adds the list to the node
    for (var value in list) {
      this.addNode(value);
    }
  }

  @override
  void traverse(Map<Offset, Offset> map, Map<Offset, T> valueMap) {
    root!.visit(map, valueMap, root!);
  }
}
