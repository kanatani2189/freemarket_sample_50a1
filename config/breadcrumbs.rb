crumb :root do
  link "メルカリ", root_path
end

# user#index 
crumb :users do
  link "マイページ", users_path
  parent :root
end

# user#show
crumb :show_user do 
  link "プロフィール", user_path
  parent :users
end

# user#edit
crumb :edit_user do 
  link "本人情報の登録", edit_user_path
  parent :users
end

# users#logout
crumb :logout_user do 
  link "ログアウト", users_logout_123456789_path
  parent :users
end


# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).