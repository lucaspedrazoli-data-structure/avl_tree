// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public class AVLNode<Element> {
  
  public var value: Element
  public var leftChild: AVLNode?
  public var rightChild: AVLNode?
  
  public init(value: Element) {
    self.value = value
  }

  public var height = 0

  public var leftHeight: Int {
    leftChild?.height ?? -1
  }

  public var rightHeight: Int {
    rightChild?.height ?? -1
  }

  public var balanceFactor: Int {
    leftHeight - rightHeight
  }

  private func leftRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
    let pivot = node.rightChild!
    node.rightChild = pivot.leftChild
    pivot.leftChild = node
    node.height = max(node.leftHeight, node.rightHeight) + 1
    pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
    return pivot
  }

  private func rightRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
    let pivot = node.leftChild!
    node.leftChild = pivot.rightChild
    pivot.rightChild = node
    node.height = max(node.leftHeight, node.rightHeight) + 1
    pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
    return pivot
  }
}

extension AVLNode: CustomStringConvertible {
  
  public var description: String {
    diagram(for: self)
  }
  
  private func diagram(for node: AVLNode?,
                       _ top: String = "",
                       _ root: String = "",
                       _ bottom: String = "") -> String {
    guard let node = node else {
      return root + "nil\n"
    }
    if node.leftChild == nil && node.rightChild == nil {
      return root + "\(node.value)\n"
    }
    return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ")
      + root + "\(node.value)\n"
      + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")
  }
}

extension AVLNode {
  
  public func traverseInOrder(visit: (Element) -> Void) {
    leftChild?.traverseInOrder(visit: visit)
    visit(value)
    rightChild?.traverseInOrder(visit: visit)
  }
  
  public func traversePreOrder(visit: (Element) -> Void) {
    visit(value)
    leftChild?.traversePreOrder(visit: visit)
    rightChild?.traversePreOrder(visit: visit)
  }
  
  public func traversePostOrder(visit: (Element) -> Void) {
    leftChild?.traversePostOrder(visit: visit)
    rightChild?.traversePostOrder(visit: visit)
    visit(value)
  }
}
