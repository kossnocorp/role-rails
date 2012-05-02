Dummy::Application.routes.draw do
  match '/h' => "application#index_h"
  root :to => "application#index"
end
