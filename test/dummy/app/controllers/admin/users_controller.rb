class Admin::UsersController < ModelController
  crud_express role: :model, model: User, collection: :list, includes: {:articles => {:label => :title}}, hide: [:created_at], lock: [:id]
  around_action :respond_crud_express

  def list
    User.includes(:articles).all
  end

end
