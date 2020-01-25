class Api::V1::MenusController < Api::V1::BaseController
	before_action :set_menu, only: [:show, :update]
	before_action :authenticate, only: [:create, :update]

	def show
	end

  def create
  	@menu = Menu.new(menu_params)
  	if @menu.save
  		render :show, status: :created
  	else
  		render_error
  	end
  end

  def update
  end

  private

  def set_menu
  	@menu = Menu.find(params[:id])
  end

  def menu_params
  	params.require(:menu).permit(:name)
  end

  def authenticate
  	email = request.headers["X-User-Email"]
  	token = request.headers["X-User-Token"]
  	unless User.find_by(email: email).authentication_token == token
  		render_error
  	end
  end
end