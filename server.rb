require 'sinatra'
require 'csv'
require 'pry'

def csv_import
  @teams = []

  CSV.foreach('public/lackp_starting_rosters.csv', headers: true, :header_converters => :symbol) do |row|
    @teams << row.to_hash
  end
end

def init
  csv_import

  @slammers = []
  @jets = []
  @stone = []
  @goats = []

  @catchers = []
  @pitchers = []
  @first = []
  @second = []
  @third = []
  @shortstop = []
  @left_f = []
  @center_f = []
  @right_f = []

  @pos = []
  @name = []

  @teams.each do |member|
    @slammers << member if member[:team] == 'Simpson Slammers'
    @jets << member if member[:team] == 'Jetson Jets'
    @stone << member if member[:team] == 'Flinestone Fire'
    @goats << member if member[:team] == 'Griffin Goats'

    @catchers << member if member[:position] == 'Catcher'
    @pitchers << member if member[:position] == 'Pitcher'
    @first << member if member[:position] == '1st Base'
    @second << member if member[:position] == '2nd Base'
    @third << member if member[:position] == '3rd Base'
    @shortstop << member if member[:position] == 'Shortstop'
    @left_f << member if member[:position] == 'Left Field'
    @center_f << member if member[:position] == 'Center Field'
    @right_f << member if member[:position] == 'Right Field'

    @name << member[:team]
    @team_name = @name.uniq
    @pos << member[:position]
    @position = @pos.uniq
  end
end

# TEAMS

get '/' do
  init
  erb :index
end

get '/Simpson Slammers' do
  init
  erb :slammers
end

get '/Jetson Jets' do
  init
  erb :jets
end

get '/Flinestone Fire' do
  init
  erb :stone
end

get '/Griffin Goats' do
  init
  erb :goats
end

# POSITIONS

get '/Catcher' do
  init
  erb :catchers
end

get '/Pitcher' do
  init
  erb :pitchers
end

get '/1st Base' do
  init
  erb :first
end

get '/2nd Base' do
  init
  erb :second
end

get '/3rd Base' do
  init
  erb :third
end

get '/Shortstop' do
  init
  erb :shortstop
end

get '/Left Field' do
  init
  erb :left_f
end

get '/Center Field' do
  init
  erb :center_f
end

get '/Right Field' do
  init
  erb :right_f
end
