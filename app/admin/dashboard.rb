ActiveAdmin.register_page "Dashboard" do
    content do
        columns do
            column do
                panel "Recent Posts" do 
                    table_for Post.order("id desc").limit(15) do
                        column :id
                        column "Post title", :title do |post|
                            link_to post.title, [:admin,post]
                        end
                        column "Author",:admin_user
                        column :category,:sortable => :category
                        column :created_at
                    end
                    strong(link_to "Show All Posts",:admin_posts)
                end
                panel "Categories" do 
                    table_for Category.order("id desc").limit(15) do
                        column :id
                        column "Category title", :name
                        column :created_at
                    end
                    strong(link_to "Show All Categories",:admin_categories)
                end
            end
        end
    end
end
