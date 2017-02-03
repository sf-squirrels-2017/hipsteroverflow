helpers do
  def vote_count(votable_instance)
    arr = votable_instance.votes
    if arr.length == 0
      0
    else
      arr.map{|vote| vote.value}.inject(:+)
    end
  end

  def vote_user_include(votable_instance)
    arr = votable_instance.votes.map{|vote| vote.user_id}

      if arr.include?(current_user)
        true
      else
        false
      end
  end

  def sort_by_vote(array_of_instances)
    new_arr = []
    arr = array_of_instances.map{|instance| vote_count(instance)}.sort.reverse.uniq

    arr.map do |votes|
      new_arr << array_of_instances.find_all{|instance| vote_count(instance) == votes}
    end
    new_arr.flatten
  end


end
