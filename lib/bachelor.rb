require "pry"

# def get_first_name_of_season_winner(data, season)
#   winner = data.find {|season_num, player| season_num == season}
#   #binding.pry
#   winner = winner[1].find {|key| key["status"] == "Winner"}
#   #binding.pry
#   first_name, last_name = winner["name"].split
#   first_name
# end

def get_first_name_of_season_winner(data, season)
  data[season].find {|contestant| contestant["status"]=="Winner"}["name"].split()[0]
end


def get_contestant_name(data, occupation)
  # code here
  output = {}
  data.each do |key, inner_key| 
    inner_key.each do |key|
      if key["occupation"] == occupation
        output = key
      end
    end
  end
  output["name"]
end

def count_contestants_by_hometown(data, hometown)
  # code here
  index = 0
  data.values.each do |key|
    key.each do |inner_key|
      #binding.pry
      if inner_key["hometown"] == hometown
        index += 1
        #binding.pry
      end
    end
  end
  index
end

def get_occupation(data, hometown)
  output = ""
  data.each do |seasons, contestants|
    if output != ""
      break
    end
    contestants.each do |contestant|
      if contestant["hometown"] == hometown
        output = contestant["occupation"]
        break
      end
    end
  end
  output
end

def get_average_age_for_season(data, season)
  # code here
  total = 0
  index = 0
  data[season].each do |contestant|
    total += contestant["age"].to_f
    index += 1
    #binding.pry
  end
  #binding.pry
  total = (total/index.to_f).round()
end
