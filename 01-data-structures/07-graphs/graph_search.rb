require_relative 'node'

class GraphSearch
  def initialize
    @checked_actors = []
    @films = []
  end

  def breadth_first_search(start_node, target_node)
    return "Kevin Bacon is Kevin Bacon." if start_node == target_node
    @checked_actors << start_node

    start_node.film_actor_hash.each do |title, actors|
      @films << title
      unless actors.include? target_node
        actors.each do |actor|
          unless @checked_actors.include?(actor)
            @checked_actors << actor
            breadth_first_search(actor, target_node)
          end
        end
      end
    end

    if @films.length == 0
      return "Can't find #{target_node.name}"
    elsif @films.length <= 6 && @films.length > 0
      return "#{start_node.name} is connected to #{target_node.name} by these films: #{@films.each {|x| x}}."
    else
      return "#{start_node.name} is connected to #{target_node.name} by more than 6 degrees of separation."
    end
  end
end
