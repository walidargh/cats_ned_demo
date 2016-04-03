Rails.application.routes.draw do
  resources :cats do
    # /cats/:cat_id/toys/:id
    resources :toys, only: [:index, :new]
  end
  # resources :toys
  # /toys/:id
  resources :toys, only: [:show, :create, :update, :destroy]

  root to: redirect("/cats")
end
