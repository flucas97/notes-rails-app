class DeleteNoteJob < ApplicationJob
  queue_as :delete_note

  def perform(note_id)
    note = Note.find(note_id)
    begin 
      note.destroy
    rescue => err
      format.html { redirect_to notes_url, notice: "Falha ao excluir nota #{err}" }
      format.json { render json: err, status: :unprocessable_entity }
    end
  end
end
