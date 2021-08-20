ActiveAdmin.register User do


    permit_params :first_name , :email
  
    # See permitted parameters documentation:
    # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
    #
    # Uncomment all parameters which should be permitted for assignment
    #
    # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username, :photo
    #
    # or
    #
    # permit_params do
    #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username, :photo]
    #   permitted << :other if params[:action] == 'create' && current_user.admin?
    #   permitted
    # end
  
    filter :first_name
  
   index do 
     column :first_name
     column :email
     column :video_games do |user|
      user.video_games.count
    end

    column :rental_requests do |user|
      user.rental_requests.count
    end

    column :wishlists do |user|
      user.wishlists.count
    end


     actions 
  end
  
    
  end