module EventCommentsHelper

  def author_by_name(author_id)
    author = User.find(author_id)
    author ? "#{author.first_name} #{author.surname}" : author_id 
  end
end
