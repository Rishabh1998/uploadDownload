class DocumentsController < ApplicationController

  def index
    redirect_to documents_new_path, notice: "No file found"
  end

  def show
    @document = Document.where(id: params[:id]).first
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      redirect_to @document, notice: "Successfully uploaded."
    else
      render "new"
    end

  end

  def download_or_destroy
    @document = Document.find(params[:id])
    if @document.present?
      if @document.downloaded
        @document.destroy
        redirect_back(fallback_location: root_path)
      else
        @document.update(downloaded: true)
        redirect_to "#{@document.attachment}"
      end
    else
      redirect_to documents_path, notice: "No file found."
    end

  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to documents_path, notice:  "Successfully deleted."
  end

  private
  def document_params
    params.require(:document).permit(:name, :attachment)
  end

end  