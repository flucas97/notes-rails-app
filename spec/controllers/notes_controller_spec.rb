require 'rails_helper'

RSpec.describe NotesController, :notes_controller, type: :controller do
  context 'Actions' do 
    it '#index' do
      get :index
      expect(response).to be_successful 
    end
  end
end
