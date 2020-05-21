class NotesController < ApplicationController
  layout 'notes'

  before_action :set_note, only: [:show, :edit, :update]
  before_action :set_users_notes, only: [:index]
  before_action :validate_user_note, only: [:show, :edit]
  before_action :authenticate_user!

  def index
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)  
    @note.user_id = current_user.id
    
    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    DeleteNoteJob.perform_later(params[:id])
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Sua nota será deletada em breve!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    def set_users_notes
      @notes = Note.all.where(user_id: current_user)
    end
    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:title, :description)
    end

    def validate_user_note
      redirect_to notes_path, notice: 'Note not found' unless @note.user_id == current_user.id
    end
end
