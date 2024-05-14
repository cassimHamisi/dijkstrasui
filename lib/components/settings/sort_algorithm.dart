import 'dart:math';

import 'package:dijkstrasui/components/settings/binary_tree.dart';
import 'package:flutter/material.dart';

class TreeBloc {
  Map<Offset, Offset> treeMap = {};
  Map<Offset, int> valueMap = {};

  //Create a tree stream and give a delay of on second for each node
  Stream<Offset> get treeStream =>
      Stream.fromIterable(treeMap.keys).asyncMap((event) async {
        await Future.delayed(const Duration(seconds: 1));
        return event;
      });

  binarySearch() {
    //Create a binary tree
    BinaryTree<int> binaryTree = BinaryTree.fromValue(1);
    //Create a tree just a random tree
    binaryTree.fromList(List.generate(20, (index) => Random().nextInt(20)));
    //Traverse the tree
    binaryTree.traverse(treeMap, valueMap);
  }
}
