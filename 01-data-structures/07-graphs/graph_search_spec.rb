include RSpec

require_relative 'node'
require_relative 'graph_search'

RSpec.describe GraphSearch, type: Class do
  let(:graph) { GraphSearch.new }

  let(:kevin_bacon) { Node.new('Kevin Bacon') }
  let(:chris_pratt) { Node.new('Chris Pratt') }
  let(:michelle_gunn) { Node.new('Michelle Gunn') }
  let(:omar_khayyam) { Node.new('Omar Khayyam') }
  let(:tizar_purbaya) { Node.new('Tizar Purbaya') }
  let(:rengga_takengon) { Node.new('Rengga Takengon') }
  let(:mick_o_rourke) { Node.new('Mick O Rourke') }
  let(:jean_gabin) { Node.new('Jean Gabin') }
  let(:annie_cordy) { Node.new('Annie Cordy') }
  let(:vittorio_gassman) { Node.new('Vittorio Gassman') }
  let(:ryan_reynolds) { Node.new('Ryan Reynolds') }
  let(:john_wilkes_booth) { Node.new('John Wilkes Booth') }
  let(:louisa_lane_drew) { Node.new('Louisa Lane Drew') }
  let(:lionel_barrymore) { Node.new('Lionel Barrymore') }
  let(:jimmy_stewart) { Node.new('Jimmy Stewart') }
  let(:jack_lemmon) { Node.new('Jack Lemmon') }
  let(:fake_actor) { Node.new('Fake Actor') }
  let(:second_fake_actor) { Node.new('Second Fake Actor') }

  before do
    ryan_reynolds.film_actor_hash['R.I.P.D.'] = [ryan_reynolds, kevin_bacon]
    chris_pratt.film_actor_hash['Movie 43'] = [michelle_gunn, chris_pratt]
    rengga_takengon.film_actor_hash['Jakarta'] = [mick_o_rourke, rengga_takengon]
    michelle_gunn.film_actor_hash['Super'] = [michelle_gunn, kevin_bacon]
    mick_o_rourke.film_actor_hash['Sleepers'] = [mick_o_rourke, vittorio_gassman, kevin_bacon]
    vittorio_gassman.film_actor_hash['Sleepers'] = [mick_o_rourke, vittorio_gassman, kevin_bacon]
    omar_khayyam.film_actor_hash['Djakarta 1966'] = [omar_khayyam, tizar_purbaya]
    tizar_purbaya.film_actor_hash['Kemilau cinta di langit jingga'] = [rengga_takengon, tizar_purbaya]
    jean_gabin.film_actor_hash['Le chat'] = [jean_gabin, annie_cordy]
    john_wilkes_booth.film_actor_hash['Macbeth'] = [john_wilkes_booth, louisa_lane_drew]
    fake_actor.film_actor_hash['Fake Movie'] = [john_wilkes_booth, fake_actor]
    second_fake_actor.film_actor_hash['Another Fake Movie'] = [second_fake_actor, fake_actor]
    louisa_lane_drew.film_actor_hash['The Rivals'] = [lionel_barrymore, louisa_lane_drew]
    lionel_barrymore.film_actor_hash['Its a Wonderful Life'] = [lionel_barrymore, jimmy_stewart]
    jimmy_stewart.film_actor_hash['Airport 77'] = [jack_lemmon, jimmy_stewart]
    jack_lemmon.film_actor_hash['JFK'] = [jack_lemmon, kevin_bacon]
    annie_cordy.film_actor_hash['La donna piu bella del mondo'] = [annie_cordy, vittorio_gassman]
  end

  describe "using GraphSearch to search for Kevin Bacon" do
    it "has a Bacon number of 0" do
      expect(graph.breadth_first_search(kevin_bacon, kevin_bacon)).to eq('Kevin Bacon is Kevin Bacon.')
    end

    it "has a Bacon number of 1" do
      expect(graph.breadth_first_search(ryan_reynolds, kevin_bacon)).to eq("Ryan Reynolds is connected to Kevin Bacon by these films: [\"R.I.P.D.\"].")
    end

    it "has a Bacon number of 2" do
      expect(graph.breadth_first_search(chris_pratt, kevin_bacon)).to eq("Chris Pratt is connected to Kevin Bacon by these films: [\"Movie 43\", \"Super\"].")
    end

    it "has a Bacon number of 3" do
      expect(graph.breadth_first_search(jean_gabin, kevin_bacon)).to eq("Jean Gabin is connected to Kevin Bacon by these films: [\"Le chat\", \"La donna piu bella del mondo\", \"Sleepers\"].")
    end

    it "has a Bacon number of 4" do
      expect(graph.breadth_first_search(omar_khayyam, kevin_bacon)).to eq("Omar Khayyam is connected to Kevin Bacon by these films: [\"Djakarta 1966\", \"Kemilau cinta di langit jingga\", \"Jakarta\", \"Sleepers\"].")
    end

    it "has a Bacon number of 5" do
      expect(graph.breadth_first_search(john_wilkes_booth, kevin_bacon)).to eq("John Wilkes Booth is connected to Kevin Bacon by these films: [\"Macbeth\", \"The Rivals\", \"Its a Wonderful Life\", \"Airport 77\", \"JFK\"].")
    end

    it "has a Bacon number of 6" do
      expect(graph.breadth_first_search(fake_actor, kevin_bacon)).to eq("Fake Actor is connected to Kevin Bacon by these films: [\"Fake Movie\", \"Macbeth\", \"The Rivals\", \"Its a Wonderful Life\", \"Airport 77\", \"JFK\"].")
    end

    it "has a Bacon number greater than 6" do
      expect(graph.breadth_first_search(second_fake_actor, kevin_bacon)).to eq("Second Fake Actor is connected to Kevin Bacon by more than 6 degrees of separation.")
    end
  end
end
