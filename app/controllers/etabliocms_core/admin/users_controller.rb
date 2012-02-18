module EtabliocmsCore
  module Admin
    class UsersController < Admin::BaseController

      def index
        @users = User.all
      end

      def new
        @user = User.new
      end

      def create
        @user = User.new(params[:user])
        if @user.save
          flash[:notice] = t('user.created')
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
        if @user.update_attributes(params[:user])
          flash[:notice] = t('user.updated')
          redirect_to :action => 'index'
        else
          render :action => 'edit'
        end

      end

      def destroy
        User.find(params[:id]).destroy
        flash[:notice] = t('user.destroyed')
        redirect_to :action => 'index'
      end

    end
  end
end
