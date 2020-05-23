class DeleteNoteJob < ApplicationJob
  queue_as :delete_note

  def perform(note_id)
    begin 
      note = Note.find(note_id)
      note.destroy
    rescue => err
      # logar o erro
    else
      # logar a ação 
    end
  end
end
