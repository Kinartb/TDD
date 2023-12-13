class HomeController
  def index
    if Time.now.tuesday?
      'special_index'
    else
      'index'
    end
  end
end
 
