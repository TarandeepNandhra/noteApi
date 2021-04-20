class NotesController < ApplicationController
  def index
    notes = Note.all
    render json: notes, status: :ok
  end

  def create  
    note = Note.create!(note_params)
    render json: note, status: :ok
  end

  def note_params
    params.require(:note).permit(:text) 
  end
end

# curl localhost:5000/notes -X POST -H 'Content-Type: application/json' -d '{"note": {"text": "Hello"}}'
# {"id":1,"text":"Hello","created_at":"2021-04-20T17:05:18.351Z","updated_at":"2021-04-20T17:05:18.351Z"}
