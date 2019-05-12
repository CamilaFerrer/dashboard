require 'dashing'

configure do
  set :auth_token, '100t3i4$'

  # See http://www.sinatrarb.com/intro.html > Available Template Languages on
  # how to add additional template languages.
  set :template_languages, %i[html erb]
  set :default_dashboard, 'services'

  helpers do
    def protected!
      # Put any authentication code you want in here.
      # This method is run before accessing any resource.
      #redirect('/auth/g') unless session[:user_id]
    end
  end
end

map Sinatra::Application.assets_prefix do
  run Sinatra::Application.sprockets
end

run Sinatra::Application

# require 'omniauth/google_oauth2'
# require 'dashing'
#
# configure do
#   use Rack::Session::Cookie, secret: 'SOME_SECRET'
#
#   # See http://www.sinatrarb.com/intro.html > Available Template Languages on
#   # how to add additional template languages.
#   set :template_languages, %i[html erb]
#
#   helpers do
#     def protected!
#       redirect '/auth/g' unless session[:user_id]
#     end
#   end
#
#   use OmniAuth::Builder do
#     provider :google_oauth2, '929113571726-3epoa809j0vuaip6ddsbuvvu4ikpo1kj.apps.googleusercontent.com', 'So-L2ltrZf9-1uvUDccykYnF', name: 'g', hd: 'http://localhost:3030'
#   end
#
#   get '/auth/g/callback' do
#     if auth = request.env['omniauth.auth']
#       session[:user_id] = auth['info']['email']
#       redirect '/'
#     else
#       redirect '/auth/failure'
#     end
#   end
#
#   get '/auth/failure' do
#     'Nope.'
#   end
# end
#
# map Sinatra::Application.assets_prefix do
#   run Sinatra::Application.sprockets
# end
#
# run Sinatra::Application
