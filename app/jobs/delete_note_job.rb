class DeleteNoteJob < ApplicationJob
  queue_as :delete_note

  def perform(note)
    sleep 5
    note.destroy
  end
end
