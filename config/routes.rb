Myapp::Application.routes.draw do
  resources :carts do
    collection do
    get 'add_to_cart_item/:product_id' => 'carts#add_to_cart_item', as: :add_to_cart_item
    get 'cart_item' => 'carts#cart_item', as: :cart_item

    get 'cart_item/increse_decrease/:cart_item_id/:status' => 'carts#increse_decrease_quantity', as: :increse_decrease_quantity
    get 'delete_cart_item'
   
  end
  end
  devise_for :users
  devise_scope :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :images
  resources :discounts
  resources :data
  resources :products do
   
  end

  resources :addresses
  resources :checkouts do 
    collection do

      get 'review_order' => 'checkouts#review_order', as: :review_order
      get 'make_payment' => 'checkouts#make_payment', as: :make_payment
      get 'make_order' => 'checkouts#make_order', as: :my_order
      get 'review_order/increase_decrease/:review_order_id/:status' => 'checkouts#increase_decrease_quantityy', as: :increase_decrease_quantityy
    end
  end
get 'delete/address/:address_id', :to => 'addresses#addressdelete', as: :address_destroy
  

  resources :blogs
  # You can have the root of your site routed with "root"
  root to: 'dashboards#dashboard_1'

  # All routes
  get "dashboards/dashboard_1"
  get "dashboards/dashboard_2"
  get "dashboards/dashboard_3"
  get "dashboards/dashboard_4"
  get "dashboards/dashboard_4_1"
  get "dashboards/dashboard_5"


  get "layoutsoptions/index"
  get "layoutsoptions/off_canvas"

  get "graphs/flot"
  get "graphs/morris"
  get "graphs/rickshaw"
  get "graphs/chartjs"
  get "graphs/chartist"
  get "graphs/peity"
  get "graphs/sparkline"
  get "graphs/c3charts"

  get "mailbox/inbox"
  get "mailbox/email_view"
  get "mailbox/compose_email"
  get "mailbox/email_templates"
  get "mailbox/basic_action_email"
  get "mailbox/alert_email"
  get "mailbox/billing_email"

  get "metrics/index"

  get "widgets/index"

  get "forms/basic_forms"
  get "forms/advanced"
  get "forms/wizard"
  get "forms/file_upload"
  get "forms/text_editor"
  get "forms/markdown"

  get "appviews/contacts"
  get "appviews/profile"
  get "appviews/profile_two"
  get "appviews/contacts_two"
  get "appviews/projects"
  get "appviews/project_detail"
  get "appviews/file_menager"
  get "appviews/vote_list"
  get "appviews/calendar"
  get "appviews/faq"
  get "appviews/timeline"
  get "appviews/pin_board"
  get "appviews/teams_board"
  get "appviews/social_feed"
  get "appviews/clients"
  get "appviews/outlook_view"
  get "appviews/blog"
  get "appviews/article"
  get "appviews/issue_tracker"

  get "pages/search_results"
  get "pages/lockscreen"
  get "pages/invoice"
  get "pages/invoice_print"
  get "pages/login"
  get "pages/login_2"
  get "pages/forgot_password"
  get "pages/register"
  get "pages/not_found_error"
  get "pages/internal_server_error"
  get "pages/empty_page"

  get "miscellaneous/notification"
  get "miscellaneous/nestablelist"
  get "miscellaneous/timeline_second_version"
  get "miscellaneous/forum_view"
  get "miscellaneous/forum_post_view"
  get "miscellaneous/google_maps"
  get "miscellaneous/code_editor"
  get "miscellaneous/modal_window"
  get "miscellaneous/validation"
  get "miscellaneous/tree_view"
  get "miscellaneous/chat_view"
  get "miscellaneous/agile_board"
  get "miscellaneous/diff"
  get "miscellaneous/sweet_alert"
  get "miscellaneous/idle_timer"
  get "miscellaneous/spinners"
  get "miscellaneous/live_favicon"
  get "miscellaneous/masonry"
  get "miscellaneous/tour"
  get "miscellaneous/loading_buttons"
  get "miscellaneous/clipboard"
  get "miscellaneous/truncate"
  get "miscellaneous/i18support"


  get "uielements/typography"
  get "uielements/icons"
  get "uielements/draggable_panels"
  get "uielements/resizeable_panels"
  get "uielements/buttons"
  get "uielements/video"
  get "uielements/tables_panels"
  get "uielements/tabs"
  get "uielements/notifications_tooltips"
  get "uielements/badges_labels_progress"

  get "gridoptions/index"

  get "tables/static_tables"
  get "tables/data_tables"
  get "tables/foo_tables"
  get "tables/jqgrid"

  get "commerce/products_grid"
  get "commerce/products_list"
  get "commerce/product_edit"
  get "commerce/product_detail"
  get "commerce/orders"
  get "commerce/cart"
  get "commerce/payments"

  get "gallery/basic_gallery"
  get "gallery/slick_carusela"
  get "gallery/bootstrap_carusela"

  get "cssanimations/index"

  get "landing/index"

  get 'delete/my_products/:my_id', :to => 'products#delete', as: :ab_destroy

  get 'delete/my_data/:my_data_id', :to => 'data#datadelete', as: :aa_destroy

  get 'delete/my_discount/:my_discount_id', :to => 'discounts#ddelete', as: :ac_destroy

  get 'delete/my_image/:image_id', :to => 'images#image_delete', as: :image_destroy

  get 'delete/my_cart/:cart_id', :to => 'carts#cart_delete', as: :cart_destroy

 # get 'delete/:cartitem_id', :to => 'carts#cartitem_destroy', as: :cartitem_destroy

 


end
