class GithubService
  attr_accessor :access_token

  def initialize(access_hash = nil)
    #binding.pry
    @access_token = access_hash["access_token"] if access_hash
  end

  def authenticate!(client_id, client_secret, code)
    resp = Faraday.post "https://github.com/login/oauth/access_token",
    {client_id:client_id,client_secret:client_secret, code:code},
    {"Accept" => "application/json"}

    body = JSON.parse(resp.body)
    @access_token = body["access_token"]
  end


def get_repos
response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{self.access_token}", 'Accept' => 'application/json'}
  @repos_array = JSON.parse(response.body)
  @repos_array.map do |repo|
    GithubRepo.new(repo)
  end
end

def create_repo
  response = Faraday.post "https://api.github.com/user/repos", {name: params[:name]}.to_json, {'Authorization' => "token #{self.access_token}", 'Accept' => 'application/json'}
  redirect_to '/'
end

def get_username 
  response = Faraday.post "https://github.com/login/oauth/access_token", {client_id: ENV["GITHUB_CLIENT"], client_secret: ENV["GITHUB_SECRET"],code: params[:code]}, {'Accept' => 'application/json'}
  access_hash = JSON.parse(response.body)
  session[:token] = access_hash["access_token"]

  user_response = Faraday.get "https://api.github.com/user", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
  user_json = JSON.parse(user_response.body)
  session[:username] = user_json["login"]

  redirect_to '/'
end


end
