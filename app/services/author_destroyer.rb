class AuthorDestroyer
  def initialize(author_id:, replacment_id:)
    @author_id = author_id
    @replacment_id = replacment_id
  end

  def call
    author = User.find(@author_id)
    assign_to_new_author(author.courses) if author.courses.present?
    author.destroy!
  end

  private
  def assign_to_new_author(courses)
    courses.update_all(author_id: @replacment_id)
  end


end
