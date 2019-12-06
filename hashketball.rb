def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets", 
      :colors => ["Black", "White"], 
      :players => [
        {:player_name => "Alan Anderson", :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1}, 
        {:player_name => "Reggie Evans", :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
        {:player_name => "Brook Lopez", :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
        {:player_name => "Mason Plumlee", :number => 1, :shoe => 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
        {:player_name => "Jason Terry", :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
        ]}, 
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {:player_name => "Jeff Adrien", :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2}, 
        {:player_name => "Bismack Biyombo", :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10},
        {:player_name => "DeSagna Diop", :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
        {:player_name => "Ben Gordon", :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
        {:player_name => "Kemba Walker", :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12}
        ]}}
        return hash 
end 

def num_points_scored(player_name)
  game_hash.values.each do |team|  
    team[:players].each do |player|
      return player[:points] if player.has_value?(player_name)
    end
  end
end

def shoe_size(player_name)
  game_hash.values.each do |team|  
    team[:players].each do |player|
      return player[:shoe] if player.has_value?(player_name)
    end
  end
end 

def team_colors(team_name)
  if team_name == "Brooklyn Nets"
    game_hash[:home][:colors]
  else 
    game_hash[:away][:colors]
  end
end

def team_names
  game_hash.values.map {|value| value[:team_name]}
end 

def player_numbers(team)
  game_hash.values.each do |team_info|
    if team_info.has_value?(team)
      return team_info[:players].map { |player| player[:number]}
    end
  end
end

def player_stats(player_name)
  hash = {}
   game_hash.values.each do |team_info|
    team_info[:players].each do |player|
      if player.has_value?(player_name)
         player.delete(:player_name) 
         hash = player
      end
    end
  end
  hash 
end 

def big_shoe_rebounds
    biggest_shoe = 0
  player_rebounds = 0
  game_hash.values.each do |team_info|
    team_info[:players].each do |player|
      if player[:shoe] > biggest_shoe
        biggest_shoe = player[:shoe] 
        player_rebounds = player[:rebounds] 
      end
    end
  end
  return player_rebounds
end

def most_points_scored
  most_points = 0
  name = "name"
  game_hash.values.each do |team_info|
    team_info[:players].each do |player|
      if player[:points] > most_points
        most_points = player[:points] 
        name = player[:player_name] 
      end
    end
  end
  return name
end 

def winning_team
   top_team = {}
  game_hash.values.each do |team_info|
    team_points = 0
    team_info[:players].each do |player|
      team_points += player[:points]
    end
    top_team[team_info[:team_name]] = team_points
  end
  top_team.key(top_team.values.max) 
end

def player_with_longest_name
  longest_name = []
  game_hash.values.each do |team_info|
    team_info[:players].each do |player|
      longest_name << player[:player_name]
    end
  end
longest_name.max_by{|name| name.length}
end

def long_name_steals_a_ton?
hash = {}
  game_hash.values.each do |team_info|
    team_info[:players].each do |player|
      hash[player[:player_name]] = player[:steals]
    end
  end
max_steals = hash.values.max
hash[hash.key(max_steals)] == max_steals
end
