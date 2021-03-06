class RelationshipsController < ApplicationController

  def create
    @relationship = current_user.relationships.build(friend_id: params[:friend_id])

    if @relationship.save
      friend = User.find(params[:friend_id])
      flash[:notice] = "You're now following #{friend.username}"
    else
      flash[:notice] = "Something went wrong :("
    end

    redirect_to profile_path(params[:friend_id])

  end

  def destroy
    @relationship = current_user.relationships.find(params[:id])

    @relationship.destroy

    flash[:notice] = "This relationship is over..."

    redirect_to root_path
  end

  private

    def relationship_params
      params.require(:relationship).permit(:user_id, :friend_id)
    end

end
