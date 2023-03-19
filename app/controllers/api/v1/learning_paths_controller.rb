# frozen_string_literal: true

module Api
  module V1
    class LearningPathsController < ApplicationController
      before_action :set_learning_path, only: %i[destroy update]
      def index
        paths = LearningPath.all
        render json: LearningPathSerializer.new(paths).serializable_hash
      end

      def create
        LearningPathManager
          .new(**learning_path_params.to_h.symbolize_keys)
          .call
      end

      def update
        LearningPathManager
          .new(**learning_path_params.to_h.symbolize_keys)
          .call
      end

      def destroy
        @learning_path.destroy
      end

      private

      def learning_path_params
        params.require(:learning_path).permit(:name, courses: [])
      end

      def set_learning_path
        @learning_path = LearningPath.find(params[:id])
      end
    end
  end
end
