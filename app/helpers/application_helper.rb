module ApplicationHelper
  
  def avatar_url(camper)
    return camper.profile_image unless camper.profile_imege.nil?
    gravatar_id = Digest::MD5::hexdigest(camper.email).downcase
    "https://techpit-market-prod.s3.amazonaws.com/uploads/part_attachment/file/15782/2da91636-af73-4eed-91cd-320a0399609c.jpg"
  end
end
