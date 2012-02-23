module EtabliocmsCore
  module Admin
    class UsersController < BaseController

      def index
        @users = User.all
      end

      def new
        @user = User.new
      end

      def create
        @user = User.new(params[:etabliocms_core_user])
        if @user.save
          flash[:notice] = t('etabliocms_core_user.created')
          redirect_to :action => 'index'
        else
          render :action => 'new'
        end
      end

      def edit
        @user = User.find(params[:id])
      end

      def update
        @user = User.find(params[:id])
        if params[:etabliocms_core_user][:password].blank? and params[:etabliocms_core_user][:password_confirmation].blank?
          params[:etabliocms_core_user].delete(:password)
          params[:etabliocms_core_user].delete(:password_confirmation)
        end
        if @user.update_attributes(params[:etabliocms_core_user])
          flash[:notice] = t('etabliocms_core_user.updated')
          redirect_to :action => 'index'
        else
          render :action => 'edit'
        end
      end

      def destroy
        User.find(params[:id]).destroy
        flash[:notice] = t('etabliocms_core_user.destroyed')
        redirect_to :action => 'index'
      end

    end
  end
end
