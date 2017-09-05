class Backoffice::MembersController < BackofficeController
  before_action :set_member, only: [:edit, :update, :destroy] # usar o metodo set member  somente no edit no update e no destroy
  # after_action :verify_authorized, only: [:new, :destroy] #verificar se estar autorizado a dar um new 
  after_action :verify_policy_scoped, only: :index # verificar se a policy esta autorizada para a index

  def index
    #@members = member.all
    #@members = member.with_restricted_access_access
    @members = policy_scope(Member)
  end

  def new
    @member = Member.new
    
  end

  def create
    @member = Member.new(params_member)
    if @member.save
      redirect_to backoffice_members_path, notice: "O memberistrador foi criado"
    else
      render :new
    end
  end

  def edit
    # Uses the before_action to set the member.
  end



  def update
    psw = params[:member][:password]
    psw_confirmation = params[:member][:password_confirmation]

    if psw.blank? && psw_confirmation.blank?
      params[:member].delete(:password)
      params[:member].delete(:password_confirmation)
      
    end
    if @member.update(params_member)
      redirect_to backoffice_members_path, notice: "memberistrador foi alterado"
    else
      render :edit
    end
  end

  def destroy
    authorize @member
    member_email = @member.email
    if @member.destroy
      redirect_to backoffice_members_path, notice: "O memberistrador foi excluido"
    else
      render :index
    end
  end

  private

    def set_member
      @member = Member.find(params[:id])
    end

    def params_member
        if password_blank?
          params[:member].except!(:password,:password_confirmation)
        end
        if @member.blank?
          params.require(:member).permit(:email, :password, :password_confirmation)    
        else
          params.require(:member).permit(policy(@member).permitted_attributes)
        end
      
    end

    # verifica se o password esta em branco 
    def password_blank?
      params[:member][:password].blank? &&
      params[:member][:password_confirmation].blank?
    end
end
