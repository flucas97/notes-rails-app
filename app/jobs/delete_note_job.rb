class DeleteNoteJob < ApplicationJob
  queue_as :delete_note

  def perform(note_id)
    note = Note.find(note_id)
    note.destroy
  end
end
