class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]
  
  def index
    @admins = Admin.all
    #@admins = Admin.with_restricted_access
    #@admins = policy_scope(Admin)
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params_admin)
    if @admin.save
      redirect_to backoffice_admins_path, notice: "O administrador foi criado"
    else
      render :new
    end
  end

  def edit
    # Uses the before_action to set the admin.
  end



  def update
    psw = params[:admin][:password]
    psw_confirmation = params[:admin][:password_confirmation]

    if psw.blank? && psw_confirmation.blank?
      params[:admin].delete(:password)
      params[:admin].delete(:password_confirmation)
      
    end



    if @admin.update(params_admin)
      
      redirect_to backoffice_admins_path, notice: "Administrador foi alterado"
    else
      render :edit
    end
  end

  def destroy
    admin_email = @admin.email
    if @admin.destroy
      redirect_to backoffice_admins_path, notice: "O Administrador foi excluido"
    else
      render :index
    end
  end

  private

    def set_admin
      @admin = Admin.find(params[:id])
    end

    def params_admin
      params.require(:admin).permit(:email,:name, :password, :password_confirmation)
    end

    def password_blank?
      params[:admin][:password].blank? &&
      params[:admin][:password_confirmation].blank?
    end
end
