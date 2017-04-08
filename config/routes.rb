Rails.application.routes.draw do
  root 'palindrome#input'
  
  get '/last' => 'palindrome#last'

  get '/output' => 'palindrome#output'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
