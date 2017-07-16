 class UsersController < ApplicationController

   skip_before_action :only_signed_in, only: [:new, :create, :confirm]
   before_action :only_signed_out, only: [:new, :create, :confirm]

   def new
     @user = User.new
   end

   def create
     user_params = params.require(:user).permit(:username, :email, :password, :password_confirmation)
     @user = User.new(user_params)
      if @user.valid?
        @user.save
        UserMailer.confirm(@user).deliver_now
        redirect_to new_user_path, success: 'Votre compte est créé, vous devriez recevoir un email pour confirmer votre compte'
      else
        render 'new'
      end
   end

   def confirm
     @user = User.find(params[:id])
     if @user.confirmation_token == params[:token]
       @user.update_attributes(confirmed: true, confirmation_token: nil )
       @user.save(validate: false)
       session[:auth]= @user.to_session
       redirect_to new_user_path, success: "Votre compte est bien créé"
     else
       redirect_to new_user_path, danger: "Ce token n'est pas valide"
     end
   end

   def edit
    @user = current_user
   end

   def update
     @user = current_user
     user_params = params.require(:user).permit(:username, :firstname, :lastname, :avatar_file, :email, :description)
     if @user.update(user_params)
       redirect_to profil_path, success: "Votre compte à été bien mis à jour"
     else
       render :edit
     end

   end

   def show
     @user = User.find(params[:id])
   end

   def all_annonce
     @user = current_user
     @annonces = @user.annonces
   end

 end
