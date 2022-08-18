class DocumentsController < ApplicationController
  before_action :set_document, only: %i[ show edit update destroy ]

  # GET /workspaces/1/documents/1 or /workspaces/1/documents/1.json
  def show
  end

  # GET /workspaces/1/documents/new
  def new
    @document = Document.new(workspace_id: params[:workspace_id], owner_id: current_user.id)
  end

  # GET /workspaces/1/documents/1/edit
  def edit
  end

  # POST /workspaces/1/documents or /workspaces/1/documents.json
  def create
    @document = Document.new(document_params.merge(workspace_id: params[:workspace_id], owner_id: current_user.id))

    respond_to do |format|
      if @document.save
        format.html { redirect_to [@document.workspace, @document], notice: "Un nuevo documento ha sido creado." }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workspaces/1/documents/1 or /workspaces/1/documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to [@document.workspace, @document], notice: "El documento ha sido actualizado." }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workspaces/1/documents/1 or /workspaces/1/documents/1.json
  def destroy
    @document.destroy

    respond_to do |format|
      format.html { redirect_to @document.workspace, notice: "El documento ha sido eliminado." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def document_params
      params.require(:document).permit(:title, :content, :public)
    end
end
