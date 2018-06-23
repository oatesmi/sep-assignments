include RSpec

require_relative 'min_heap'

RSpec.describe MinHeap, type: Class do
  let (:tree) { MinHeap.new }

  let (:matrix) { Node.new("The Matrix", 87) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly inserts a new node" do
      tree.insert(pacific_rim)
      expect(tree.heap[0].title).to eq "Pacific Rim"
    end

    it "maintains the min heap property" do
      tree.insert(braveheart)
      tree.insert(pacific_rim)
      tree.insert(martian)
      tree.insert(hope)
      tree.insert(empire)
      tree.insert(shawshank)
      expect(tree.heap[0].rating).to eq 72
      expect(tree.heap[1].rating).to eq 78
      expect(tree.heap[2].rating).to eq 91
      expect(tree.heap[3].rating).to eq 93
      expect(tree.heap[4].rating).to eq 94
      expect(tree.heap[5].rating).to eq 92
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      tree.insert(empire)
      tree.insert(mad_max_2)
      expect(tree.find(nil)).to eq nil
    end

    it "finds the correct node" do
      tree.insert(braveheart)
      tree.insert(pacific_rim)
      tree.insert(martian)
      tree.insert(hope)
      tree.insert(empire)
      tree.insert(shawshank)

      expect(tree.find("Pacific Rim")).to eq "Pacific Rim"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(tree.delete(nil)).to eq nil
    end

    it "properly deletes a node" do
      tree.insert(braveheart)
      tree.insert(pacific_rim)
      tree.insert(martian)
      tree.insert(hope)
      tree.insert(empire)
      tree.insert(shawshank)

      tree.delete(hope.title)
      expect(tree.find(hope.title)).not_to include(hope.title)
    end
  end

  describe "#print" do
     specify {
       expected_output = "Pacific Rim: 72\nBraveheart: 78\nInception: 86\nStar Wars: Return of the Jedi: 80\nDistrict 9: 90\nThe Martian: 92\nStar Wars: A New Hope: 93\nThe Shawshank Redemption: 91\nStar Wars: The Empire Strikes Back: 94\nMad Max 2: The Road Warrior: 98\n"
       tree.insert(hope)
       tree.insert(empire)
       tree.insert(jedi)
       tree.insert(martian)
       tree.insert(pacific_rim)
       tree.insert(inception)
       tree.insert(braveheart)
       tree.insert(shawshank)
       tree.insert(district)
       tree.insert(mad_max_2)
       expect { tree.print }.to output(expected_output).to_stdout
     }

     specify {
       expected_output = "Pacific Rim: 72\nBraveheart: 78\nInception: 86\nStar Wars: Return of the Jedi: 80\nStar Wars: A New Hope: 93\nDistrict 9: 90\nThe Martian: 92\nThe Shawshank Redemption: 91\nMad Max 2: The Road Warrior: 98\nStar Wars: The Empire Strikes Back: 94\n"
       tree.insert(mad_max_2)
       tree.insert(district)
       tree.insert(shawshank)
       tree.insert(braveheart)
       tree.insert(inception)
       tree.insert(pacific_rim)
       tree.insert(martian)
       tree.insert(jedi)
       tree.insert(empire)
       tree.insert(hope)
       expect { tree.print }.to output(expected_output).to_stdout
     }
  end
  end
