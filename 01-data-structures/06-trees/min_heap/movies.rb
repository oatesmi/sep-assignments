require_relative 'min_heap'


movie_list = MinHeap.new

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
hellboy = Node.new("Hellboy", 81)

movie_list.insert(john_wick)
movie_list.insert(ragnarok)
movie_list.insert(wilderpeople)
movie_list.insert(j_park)
movie_list.insert(cool_luke)
movie_list.insert(g_room)
movie_list.insert(the_guide)
movie_list.insert(goon)
movie_list.insert(deadpool)
movie_list.insert(kumar)
movie_list.insert(popstar)
movie_list.insert(life_aquatic)
movie_list.insert(hellboy)

movie_list.print
