require_relative 'binary_search_tree'

root = Node.new("Hellboy", 81)
movie_list = BinarySearchTree.new(root)

john_wick = Node.new("John Wick", 86)
ragnarok = Node.new("Thor: Ragnarok", 92)
wilderpeople = Node.new("Hunt for the Wilderpeople", 97)
j_park = Node.new("Jurassic Park", 93)
cool_luke = Node.new("Cool Hand Luke", 100)
g_room = Node.new("Green Room", 90)
deadpool = Node.new("Deadpool", 83)
goon = Node.new("Goon", 82)
kumar = Node.new("Harold & Kumar Go to White Castle", 74)
popstar = Node.new("Popstar: Never Stop Never Stopping", 78)
life_aquatic = Node.new("The Life Aquatic with Steve Zissou", 56)
the_guide = Node.new("The Hitchhiker's Guide to the Galaxy", 60)

movie_list.insert(root, john_wick)
movie_list.insert(root, ragnarok)
movie_list.insert(root, wilderpeople)
movie_list.insert(root, j_park)
movie_list.insert(root, cool_luke)
movie_list.insert(root, g_room)
movie_list.insert(root, the_guide)
movie_list.insert(root, goon)
movie_list.insert(root, deadpool)
movie_list.insert(root, kumar)
movie_list.insert(root, popstar)
movie_list.insert(root, life_aquatic)

movie_list.printf
