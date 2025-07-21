class RewardsController < ApplicationController
  def index
    rewards = Reward.all
    render json: rewards
  end

  def create
    reward = Reward.new(reward_params)
    if reward.save
      render json: reward, status: :created
    else
      render json: { errors: reward.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    reward = Reward.find_by(id: params[:id])

    if reward
      render json: reward, status: :ok
    else
      render json: { error: "Reward not found" }, status: :not_found
    end
  end

  private

  def reward_params
    params.permit(:title, :cost)
  end
end
