Rails.application.routes.draw do
  get 'notes_slim/index'

  get 'notes_haml/index'

  get 'notes_erb/index'

end
