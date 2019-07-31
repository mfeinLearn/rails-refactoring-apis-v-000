class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    githubService = GithubService.new
    githubService.get_username

    redirect_to '/'

  end
end
