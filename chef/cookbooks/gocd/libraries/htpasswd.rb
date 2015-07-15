def htpasswd(user, password)
  "#{user}:{SHA}#{passwd(password)}"
end

def passwd(password)
  sha1 = Digest::SHA1.new
  Base64.encode64(sha1.digest(password))
end