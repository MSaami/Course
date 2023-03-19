class Api::V1::AuthorsController < ApplicationController
  def destroy
    @author.destroy
  end

  private
  def set_autor
    @author = User.find(params[:id])
  end

end
