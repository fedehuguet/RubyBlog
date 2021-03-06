ActiveAdmin.register Post do
	menu :label => "Blog Posts" 
	permit_params :title, :body, :category_id, :admin_user_id
	
	index do
		column :title
		column "Author", :admin_user
		column :category
		column :created_at
		actions
	end
end
