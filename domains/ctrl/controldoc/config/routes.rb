Rails.application.routes.draw do

  get 'kurses/index'

  get 'kurses/nowy'

  get 'kurses/edycja'

  get 'kurses/edycja/:id', to: "kurses#edycja"

  get 'kurses/pdf'

  get 'kurses/pdf/:id', to: "kurses#pdf", :defaults => { :format => 'pdf' }
  
  get 'kurses/pierwsza_pdf'

  get 'kurses/pierwsza_pdf/:id', to: "kurses#pierwsza_pdf", :defaults => { :format => 'pdf' }

  #root to: 'kurses#dokument', format: 'docx'

  #root to: 'kurses#pierwszapomoc', format: 'docx'

  #root to: 'kurses#dziecipomoc', format: 'docx' 
 
  get 'kurses/dokument/:id', to: "kurses#dokument", :defaults => { :format => 'docx' }

  get 'kurses/pierwszapomoc/:id', to: "kurses#pierwszapomoc", :defaults => { :format => 'docx' }
  
  get 'kurses/dziecipomoc/:id', to: "kurses#dziecipomoc", :defaults => { :format => 'docx' }

  get 'kurses/usun'

  get 'szkolenias/index'

  get 'szkolenias/robotnicze'

  get 'szkolenias/biurowe'

  get 'szkolenias/pracodawcow'

  get 'szkolenias/inzynieryjne'

  #resource :kurses, format: 'docx'

root "public#index"

get 'admin', :to => "dostep#index"
 match ':controller(/:action(/id))', :via => [:get,:post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
