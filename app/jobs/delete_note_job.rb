class DeleteNoteJob < ApplicationJob
  queue_as :delete_note

  def perform(note_id)
    begin 
      sleep 25
      note = Note.find(note_id)
      note.destroy
      #logger.debug "Inside of destroy"
    rescue => err
      #logger.debug(">>>>>>>>>>>>>>>>>>>>>>>>>>>> #{err}")
    else
      # logar o sucesso 
    end
  end
end
