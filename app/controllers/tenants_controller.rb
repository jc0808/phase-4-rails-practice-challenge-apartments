class TenantsController < ApplicationController

    def index
        render json: Tenant.all
    end

    def show
        tenant = Tenant.find(params[:id])
        render json: tenant
    end

    def update
        tenant = Tenant.find(params[:id])
        tenant.update!(tenant_params)
        render json: tenant
    end

    def create
        tenant = Tenant.create!(tenant_params)
        render json: tenant, status: :created
    end

    def destroy
        tenant = Tenant.find(params[:id]).destroy
        head :no_content
    end

    private 

    def tenant_params
        params.permit(:name, :age)
    end
end
