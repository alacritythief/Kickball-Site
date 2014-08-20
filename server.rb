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
  @team = []
  @name = []
  @positions = []
  @pos = []

  csv_import
  request = params[:name]
  @teams.each do |member|
    @team << member if member[:team] == request
    @positions << member if member[:position] == request
    @name << member[:team]
    @team_name = @name.uniq
    @pos << member[:position]
    @position = @pos.uniq
  end
end

get '/' do
  init
  erb :index
end

get '/t/:name' do
  init
  erb :team
end

get '/p/:name' do
  init
  erb :positions
end
