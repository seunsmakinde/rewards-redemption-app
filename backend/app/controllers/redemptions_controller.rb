class RedemptionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    user = User.find(params[:user_id])
    redemptions = user.redemptions.includes(:reward)

    render json: redemptions.as_json(include: :reward)
  end

  def create
    user = User.find(params[:user_id])
    reward = Reward.find(params[:reward_id])

    if user.points >= reward.cost
      user.points -= reward.cost
      user.save!

      Redemption.create!(user: user, reward: reward)

      render json: { message: "Reward redeemed successfully." }, status: :created
    else
      render json: { error: "Insufficient points to redeem this reward." }, status: :unprocessable_entity
    end
  end

  private

  def record_not_found(exception)
    render json: {
      status: 404,
      error: "Not Found",
      message: exception.message
    }, status: :not_found
  end
end
