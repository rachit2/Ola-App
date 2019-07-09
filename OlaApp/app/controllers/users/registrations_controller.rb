# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  #after_action :assign_role, only: [:create]
  # before_action :assign_city, only: [:save]
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # before_action :action_before_create, only: :create
  def create
    # super
    # build_resource(sign_up_params)
    # resource.role_ids = params[:user][:role_id]
    # # if params[:user][:city].present?
    # #   resource.city_id = City.where(name:params[:user][:city]).first.id
    # # end
    # resource.save
    build_resource(sign_up_params)
    resource.role_ids = params[:user][:role_id]
    if params[:user][:city].present?
      resource.city_id = City.where(name:params[:user][:city]).first.id
    end
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
 end
protected
def build_resource(hash = {})
    self.resource = resource_class.new_with_session(hash, session)
  end
   def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end
   def after_inactive_sign_up_path_for(resource)
    scope = Devise::Mapping.find_scope!(resource)
    router_name = Devise.mappings[scope].router_name
    context = router_name ? send(router_name) : self
    context.respond_to?(:root_path) ? context.root_path : "/"
  end
   def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

  def set_flash_message_for_update(resource, prev_unconfirmed_email)
    return unless is_flashing_format?

    flash_key = if update_needs_confirmation?(resource, prev_unconfirmed_email)
                  :update_needs_confirmation
                elsif sign_in_after_change_password?
                  :updated
                else
                  :updated_but_not_signed_in
                end
    set_flash_message :notice, flash_key
  end

  def sign_in_after_change_password?
    return true if account_update_params[:password].blank?

    Devise.sign_in_after_change_password
  end

    # def assign_city
    #   if params[:user][:city].present?
    #    resource.city_id = City.where(name:params[:user][:city]).first.id
    #   end
    # end
  #GET /resource/edit
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



  # The path used after sign up.
  def after_sign_up_path_for(resource)
    root_path
  end
  # def action_before_create
  #   params[:user][:city_id] = City.where(name:params[:user][:city]).first.id

  #   binding.pry
  # end
  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
