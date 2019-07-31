class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create

    response = Faraday.post 'https://github.com/login/oauth/access_token',
      {client_id: ENV['GITHUB_CLIENT_ID'],
        client_secret: ENV['GITHUB_CLIENT_SECRET'],
        code: params[:code]}, {'Accept' => 'application/json'} 
        access_hash = JSON.parse(response.body) 
        session[:token] = access_hash["access_token"]

    githubService = GithubService.new
    githubService.get_username

    redirect_to '/'
  end

end
