import 'dart:ui';

const radius = 20;
const radiusDivide10 = radius / 10;

class Node<T extends num> {
  Node({required this.value});
  // This is the node that we need.
  T value;
  Offset offset = const Offset(500, 50);
  Node? left;
  Node? right;

  //Add a node to the bst
  void add(T value) {
    //Check if the value is less than current value
    if (value < this.value) {
      //Check if there is a value on the left is null
      if (this.left == null) {
        //1.Create a left node for the value.
        this.left = Node(value: value);
        //2.Specify the offset of the node.
        //Which is the offset of the class plus a negative offset
        this.left!.offset = this.offset +
            const Offset(-50 * radiusDivide10, 30 * radiusDivide10);
      } else {
        //left side not  null add to the right
        this.left!.add(value);
      }
    } else if (value > this.value) {
      // The value is greater than the current value. We need to add this value to the right
      if (this.right == null) {
        // Create a node to the right to the bst using the node class
        this.right = Node(value: value);
        //Create an offset for the node
        this.right!.offset = this.offset +
            const Offset(50 * radiusDivide10, 30 * radiusDivide10);
      } else {
        // Add the node a fresh
        this.right!.add(value);
      }
    }
  }

// Visit node in the bst
  void visit(Map<Offset, Offset> map, Map<Offset, T> valueMap, Node<T> node) {
    //How will I transverse each node
    if (this.left != null) {
      // if not null visit it
      this.left!.visit((map), valueMap, this);
    }
    map[this.offset] = node.offset;
    valueMap[this.offset] = value;
    if (this.right != null) {
      // if not null visit it
      this.right!.visit(map, valueMap, this);
    }
  }
}
