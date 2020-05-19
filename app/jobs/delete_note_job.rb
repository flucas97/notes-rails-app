class DeleteNoteJob < ApplicationJob
  include ActionController::MimeResponds
  queue_as :delete_note

  def perform(note)
    sleep 5
    note.destroy
  end
end
