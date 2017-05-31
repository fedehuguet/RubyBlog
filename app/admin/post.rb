ActiveAdmin.register Post do
	menu :label => "Blog Posts" 
	permit_params :title, :body, :category_id
end
