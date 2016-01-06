module ApplicationHelper
   def avatar_url(email)
      if email
        gravatar_id = Digest::MD5.hexdigest(email)
        "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d="
      end
   end
  # def avatar_url(user)
  #   if user.avatar_url.present?
  #     user.avatar_url
  #   else
  #     default_url = "#{root_url}images/guest.png"
  #     # gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
  #     gravatar_id = Digest::MD5.hexdigest('test@example.com')
  #     "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
  #   end
  # end
end
