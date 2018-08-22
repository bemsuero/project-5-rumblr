require "faker"

11.times do
Post.create(
  owner: "Spidey",
  post_title: "Fantastic Title",
  description: "Fantastic content with words and things.",
  image_url: "https://botw-pd.s3.amazonaws.com/styles/logo-thumbnail/s3/0016/3327/brand.gif?itok=0egZGLny"
)
end

20.times do
Post.create(
  owner: "MJParker",
  post_title: "Fantastic Title",
  description: "Fantastic content with words and things.",
  image_url: "https://botw-pd.s3.amazonaws.com/styles/logo-thumbnail/s3/0016/3327/brand.gif?itok=0egZGLny"
)
end
# User.all.destroy_all
