require_dependency "acl_manager/application_controller"

module AclManager
  class AclsController < ApplicationController
    before_action :set_acl, only: [:show, :edit, :update, :destroy]

    # GET /acls
    def index
      @acls = Acl.all
    end

    # GET /acls/1
    def show
    end

    # GET /acls/new
    def new
      @acl = Acl.new
    end

    # GET /acls/1/edit
    def edit
    end

    # POST /acls
    def create
      @acl = Acl.new(acl_params)

      if @acl.save
        redirect_to @acl, notice: 'Acl was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /acls/1
    def update
      if @acl.update(acl_params)
        redirect_to @acl, notice: 'Acl was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /acls/1
    def destroy
      @acl.destroy
      redirect_to acls_url, notice: 'Acl was successfully destroyed.'
    end

    def build_all
      AclManager::Acl.build_all!
      redirect_to :back, notice: t('notices.acl.build')
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_acl
        @acl = Acl.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def acl_params
        params.require(:acl).permit(:name, :namespace, :controller, :action, :verb, :helper, :path, :parent_id, :lft, :rgt)
      end
  end
end
