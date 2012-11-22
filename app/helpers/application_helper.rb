module ApplicationHelper

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS|BlackBerry/
    end
  end

  def avatar(user)
    if !mobile_device?
      if user.facebook_id.to_s.length > 0
        image_tag "http://graph.facebook.com/#{user.facebook_id}/picture",
           :size => "40x40"
      else
        image_tag "http://en.gravatar.com/avatar/#{user.gravatar_hash}?d=wavatar&s=40"
      end
    end
  end


end
