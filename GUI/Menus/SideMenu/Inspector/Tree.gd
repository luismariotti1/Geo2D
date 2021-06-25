extends Tree

func _ready():
  var root = self.create_item()

  root.set_text(0,'')

  var child1 = self.create_item(root)

  child1.set_text(0, 'test-1')

  var child2 = self.create_item(root)

  child2.set_text(0, 'test-2')

  var subchild1 = self.create_item(child1)
  subchild1.set_text(0, "test-2")

  var _err = connect("item_selected", self, "_on_tree_item_selected")
  _err = connect("item_edited", self, "_on_tree_item_edited")


