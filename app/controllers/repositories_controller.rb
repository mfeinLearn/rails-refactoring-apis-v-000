class RepositoriesController < ApplicationController
  def index
    githubService = GithubService.new
    githubService.get_repos
  end

  def create
    githubService = GithubService.new
    githubService.create_repo
  end
end
