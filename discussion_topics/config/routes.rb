Refinery::Application.routes.draw do
  
  scope :path => 'forums' do
    get '/', :to => 'discussions#index'
    resources :discussion_topics, :path => 'topics', :as => 'topics' do
      resources :discussions do
        resources :discussion_replies, :path => 'replies', :as => 'replies', :only => [:new, :edit, :create, :update, :destroy]
        get :open_or_close, :on => :member
      end
    end
  end
  
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :discussion_topics do
      collection do
        post :update_positions
      end
    end
  end
end
