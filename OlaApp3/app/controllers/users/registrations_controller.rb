# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # after_action :assign_role, only: [:create]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
   def create
       build_resource(sign_up_params)
           resource.save
           resource.role_ids = params[:user][:role_id]
           yield resource if block_given?
           if resource.persisted?
             if resource.active_for_authentication?
               set_flash_message! :notice, :signed_up
               byebug
               sign_up(resource_name, resource)
                respond_with resource, location: after_sign_up_path_for(resource)

             else
               set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
               expire_data_after_sign_in!
               respond_with resource, location: after_inactive_sign_up_path_for(resource)
              end
            end 
  end

    
    # def assign_role
    # end
  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # The path used after sign up.
   def after_sign_up_path_for(resource)
     if resource.role_ids== [2]
       customer_index_path
      end
      if resource.role_ids== [3]
       driver_index_path
      end
      if resource.role_ids== [1]
       admin_index_path
     end
   end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

end