###### need to do these

def create_repo
                  ##POST /orgs/:org/repos
   resp = Faraday.post("https://api.github.com/user/repos") do |req|
                  ### params
     req.params['name'] = params[:name]
     req.params['oauth_token'] = session[:token]
     client_id = ENV['GITHUB_CLIENT_ID']
     client_secret = ENV['GITHUB_CLIENT_SECRET']
     code = params[:code]
     req.body = { 'client_id': nil, 'client_secret': nil, 'code': code }
     req.headers['Accept'] = 'application/json'
  end
   redirect_to '/'
end


  def create_repo
                    ##POST /orgs/:org/repos
     resp = Faraday.post("https://api.github.com/user/repos") do |req|
                    ### params
       req.params['name'] = params[:name]
       req.params['oauth_token'] = session[:token]
       client_id = ENV['GITHUB_CLIENT_ID']
       client_secret = ENV['GITHUB_CLIENT_SECRET']
       code = params[:code]
       req.body = { 'client_id': nil, 'client_secret': nil, 'code': code }
       req.headers['Accept'] = 'application/json'
    end
     redirect_to '/'
  end


def get_username
end

def get_repos
end
