class NotesController < ApplicationController
 
  def index
    @notes = Note.where(:user_id => current_user.id)

    if @notes.count == 0
      redirect_to dashboard_url, :alert => 'You do not have notes added. Please add one now!'
    else
      respond_to do |format|
        format.html
        format.json { render json: @notes }
      end
    end
  end

  def show
    @note = Note.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @note }
    end
  end

  def new
    @note = Note.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @note }
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def create
    @note = current_user.notes.create(params[:note]);
    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @note = Note.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_url, :notice => 'the note was removed' }
      format.json { head :no_content }
    end
  end
end
