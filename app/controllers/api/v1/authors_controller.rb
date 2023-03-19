class Api::V1::AuthorsController < ApplicationController
  def destroy
    AuthorDestroyer.new(author_id: params[:author_id], replacement_id: params[:id]).call
  end
end
