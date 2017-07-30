- if post.errors
  ul.errors
  - post.errors.each do |error|
    li = error

- action = (post.id ? "/posts/" + post.id.to_s : "/posts")
form action="#{ action }" method="post"
  == csrf_tag
  - if post.id
    input type="hidden" name="_method" value="patch"
  div.form-group
    input.form-control type="text" name="title" placeholder="Title" value="#{ post.title }"
  button.btn.btn-primary.btn-xs type="submit" Submit
  a.btn.btn-default.btn-xs href="/posts" back
