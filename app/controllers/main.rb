require 'tilt/haml'
require 'app/models/university/student'

class Main < Sinatra::Application

  get "/" do

    redirect '/login' unless session[:name]

    haml :list_students, :locals => { :time => Time.now ,
                                      :students => University::Student.all,
                                      :current_name => session[:name] }
  end

end
