class Api::V1::LearningPathsController < ApplicationController
  def index
    paths = LearningPath.all
    render json: LearningPathSerializer.new(paths).serializable_hash
  end

  def create
    LearningPathCreator
      .new(**learning_path_params.to_h.symbolize_keys)
      .call
  end

  private

  def learning_path_params
    params.require(:learning_path).permit(:name, courses: [])
  end
end
