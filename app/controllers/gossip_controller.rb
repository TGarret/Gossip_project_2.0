class GossipController < ApplicationController

  before_action :set_gossip, only: [:show, :edit, :update, :destroy]

def new
	@gossip=surrent_user.gossips.new
end

def create
	@user=current_user
	@gossip=@user.gossips.new(gossip_params)
	if @gossip.save
		flash[:success] = "You created yo motherfucking gossip"
		redirect_to gossips_path
		@gossip.save
	else
		render 'new'
		flash.now[:error] = "609 error, ton gossip n'est pas créé"
	end
end

def gossip_params
	params.require(:gossip).permit(:content)
end

def index 
	@gossips = Gossip.all
end

def show 
	@gossip = Gossip.find(params[:id])
end

def edit
end

def update
    respond_to do |format|
      if @gossip.update(gossip_params)
        format.html { redirect_to @gossip, notice: 'Gossip was successfully updated.' }
        format.json { render :show, status: :ok, location: @gossip }
      else
        format.html { render :edit }
        format.json { render json: @gossip.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @gossip.destroy
    respond_to do |format|
      format.html { redirect_to gossips_url, notice: 'Gossip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private

	def set_gossip
		@gossip = Gossip.find(params[:id])
	end
end

