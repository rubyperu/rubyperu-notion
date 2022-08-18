class WorkspacesController < ApplicationController
  before_action :set_workspace, only: %i[ show edit update destroy share]

  # GET /workspaces or /workspaces.json
  def index
    @workspaces = Workspace.all
  end

  # GET /workspaces/1 or /workspaces/1.json
  def show
  end

  # GET /workspaces/new
  def new
    @workspace = Workspace.new
  end

  # GET /workspaces/1/edit
  def edit
  end

  # POST /workspaces or /workspaces.json
  def create
    @workspace = current_user.workspaces.new(workspace_params)

    respond_to do |format|
      if @workspace.save
        format.html { redirect_to workspace_url(@workspace), notice: "Workspace was successfully created." }
        format.json { render :show, status: :created, location: @workspace }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @workspace.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workspaces/1 or /workspaces/1.json
  def update
    respond_to do |format|
      if @workspace.update(workspace_params)
        format.html { redirect_to workspace_url(@workspace), notice: "Workspace was successfully updated." }
        format.json { render :show, status: :ok, location: @workspace }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @workspace.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workspaces/1 or /workspaces/1.json
  def destroy
    @workspace.destroy

    respond_to do |format|
      format.html { redirect_to workspaces_url, notice: "Workspace was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # POST /workspaces/1/share
  def share
    new_user = User.find_by(email: params[:email])
    @workspace.give_access(new_user)
    respond_to do |format|
      format.html { redirect_to @workspace, notice: "Se compartió" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workspace
      @workspace = Workspace.find(params[:id] || params[:workspace_id])
    end

    # Only allow a list of trusted parameters through.
    def workspace_params
      params.require(:workspace).permit(:title)
    end
end
