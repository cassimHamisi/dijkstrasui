import 'dart:ui';

// A constant for the node radius
const radius = 20;
const radiusDivide10 = radius / 10;

// Generic node class for the binary search tree
class Node<T extends num> {
  Node({required this.value});

  //Value of the node
  T value;

  // Default offset of the node position
  Offset offset = const Offset(500, 50);

  // References to the left and right node
  Node? left;
  Node? right;

  //Add a node to the bst
  void add(T value) {
    //Check if the value is less than current node's value
    // It should go to the left
    if (value < this.value) {
      if (this.left == null) {
        //1.If left child node is null, create a new node and set its position
        this.left = Node(value: value);
        //2.Specify the position
        this.left!.offset = this.offset +
            const Offset(-50 * radiusDivide10, 30 * radiusDivide10);
      } else {
        // If left child node exists, recursively add the value to it
        this.left!.add(value);
      }
    } else if (value > this.value) {
      // If the new value is greater than the current node's value
      if (this.right == null) {
        //If the right node is null, create the right node and specify  it's position
        this.right = Node(value: value);
        this.right!.offset = this.offset +
            const Offset(50 * radiusDivide10, 30 * radiusDivide10);
      } else {
        // If right child node exists, recursively add the value to it
        this.right!.add(value);
      }
    }
  }

// TODO: Later changed to inorder traversal method.
// Visit node in the bst (This is inOrder traversal)
  void visit(Map<Offset, Offset> map, Map<Offset, T> valueMap, Node<T> node) {
    //How will I transverse each node
    if (this.left != null) {
      //Traverse the left subtree recursively.
      this.left!.visit((map), valueMap, this);
    }
    // Map the current node's position and value
    map[this.offset] = node.offset;
    valueMap[this.offset] = value;

    if (this.right != null) {
      //Traverse the right subtree recursively
      this.right!.visit(map, valueMap, this);
    }
  }

  //THIS IS THE POST ORDER TRAVERSAL
  void postOrder(
      Map<Offset, Offset> map, Map<Offset, T> valueMap, Node<T> node) {
    map[this.offset] = node.offset;
    if (this.left != null) {
      //If left tree is not null traverse the left tree recursively
      this.left!.postOrder(map, valueMap, node);
    }
    if (this.right != null) {
      //If the right tree is not null traverse the right tree recursively
      this.right!.postOrder(map, valueMap, node);
    }
    // map the current node position and value
    map[this.offset] = node.offset;
    valueMap[this.offset] = value;
  }

// This is the pre-order traversal
  void preOrder(
      Map<Offset, Offset> map, Map<Offset, T> valueMap, Node<T> node) {
    // map the current node position and value;
    map[this.offset] = node.offset;
    valueMap[this.offset] = value;
    if (this.left != null) {
      //if the left is not null traverse it recursively
      this.left!.preOrder(map, valueMap, node);
    }
    if (this.right != null) {
      //if the right is not null traverse it recursively
      this.right!.preOrder(map, valueMap, node);
    }
  }
}
