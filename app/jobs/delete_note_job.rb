class DeleteNoteJob < ApplicationJob
  queue_as :delete_note

  def perform(*args)
    sleep 15
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
