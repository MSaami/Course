# frozen_string_literal: true

module Api
  module V1
    class AuthorsController < ApplicationController
      def destroy
        AuthorDestroyer.new(author_id: params[:author_id], replacement_id: params[:id]).call
      end
    end
  end
end
