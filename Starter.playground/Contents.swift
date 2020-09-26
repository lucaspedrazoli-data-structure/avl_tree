// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
import Foundation

public func leafNodes(_ tree: AVLTree<Int>) -> Int {
  let leaves = Int(pow(2.0, Double(tree.root!.height)))
  return leaves
}

example(of: "repeated insertions") {
  var tree = AVLTree<Int>()
  for i in 0..<15 {
    tree.insert(i)
  }
  print(tree)
}
example(of: "removing value") {
  var tree = AVLTree<Int>()
  tree.insert(15)
  tree.insert(10)
  tree.insert(16)
  tree.insert(18)
  print(tree)
  tree.remove(10)
  print(tree)
}

example(of: "calculate leaf nodes for perfect balance") {
  var tree = AVLTree<Int>()
  for i in 0..<15 {
    tree.insert(i)
  }
  print(tree)
  print("height: \(tree.root!.height)")
  print("leaf nodes: \(leafNodes(tree))")
}
