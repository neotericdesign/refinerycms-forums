Refinery::Application.routes.draw do
  
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :discussions do
      collection do
        post :update_positions
      end
    end
  end
end
