require "pry"

# def get_first_name_of_season_winner(data, season)
#   winner = data.find {|season_num, player| season_num == season}
#   #binding.pry
#   winner = winner[1].find {|key| key["status"] == "Winner"}
#   #binding.pry
#   first_name, last_name = winner["name"].split
#   first_name
# end

# def get_contestants(data)
#   data.values.each do |contestants_array|
#     contestants_array.map do |contestant|
#       contestant
#     end
#   end.flatten
# end

def get_contestants(data)
  data.values.flatten
end

def get_first_name_of_season_winner(data, season)
  data[season].find {|contestant| contestant["status"]=="Winner"}["name"]
    .split
    .first
end


# def get_contestant_name(data, occupation)
#   # code here
#   output = {}
#   data.each do |key, inner_key| 
#     inner_key.each do |key|
#       if key["occupation"] == occupation
#         output = key
#       end
#     end
#   end
#   output["name"]
# end

def get_contestant_name(data, occupation)
  get_contestants(data).find do |contestant|
    occupation == contestant["occupation"]
  end["name"]
end

# def count_contestants_by_hometown(data, hometown)
#   # code here
#   index = 0
#   data.values.each do |key|
#     key.each do |inner_key|
#       #binding.pry
#       if inner_key["hometown"] == hometown
#         index += 1
#         #binding.pry
#       end
#     end
#   end
#   index
# end

# def count_contestants_by_hometown(data, hometown)
#   get_contestants(data).reduce(0) do |acc, contestant|
#     if contestant["hometown"] == hometown
#       acc += 1
#     else 
#       acc
#     end
#   end
# end

def count_contestants_by_hometown(data, hometown)
  get_contestants(data).count{ | contestant | contestant["hometown"] == hometown}
end

# def get_occupation(data, hometown)
#   output = ""
#   data.each do |seasons, contestants|
#     if output != ""
#       break
#     end
#     contestants.each do |contestant|
#       if contestant["hometown"] == hometown
#         output = contestant["occupation"]
#         break
#       end
#     end
#   end
#   output
# end

def get_occupation(data, hometown)
  get_contestants(data).find do |contestant|
    contestant["hometown"] == hometown
  end["occupation"]
end

# def get_average_age_for_season(data, season)
#   # code here
#   total = 0
#   index = 0
#   data[season].each do |contestant|
#     total += contestant["age"].to_f
#     index += 1
#     #binding.pry
#   end
#   #binding.pry
#   total = (total/index.to_f).round()
# end

def get_average_age_for_season(data, season)
  (data[season].reduce(0) do |sum_of_age, contestant|
    sum_of_age += contestant["age"].to_i
  end/data[season].size.to_f).round()
end