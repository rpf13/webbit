class ProfilesController < ApplicationController
  def show
    @profile = User.find(params[:id])
    @submissions = @profile.submissions.order("created_at DESC")
    @comments = @profile.comments.order("created_at ASC")
  end
end
