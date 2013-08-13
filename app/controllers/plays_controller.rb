class PlaysController < ApplicationController
  before_action :set_play, only: [:show, :edit, :update, :destroy]

  # GET /plays
  # GET /plays.json
  def index
    @plays = Play.all.order('played_at DESC').page(params[:page])
    @play = Play.new
    authorize! :create, Play
  end

  # GET /plays/1
  # GET /plays/1.json
  def show
    authorize! :read, @play
  end

  # GET /plays/new
  def new
    @play = Play.new
    authorize! :create, Play
  end

  # GET /plays/1/edit
  def edit
    authorize! :update, @play
  end

  # POST /plays
  # POST /plays.json
  def create
    @play = Play.new(play_params)
    authorize! :create, @play

    @play.played_at = Time.now
    @play.user = current_user


    if params[:artist_id].present?
      artist = Artist.find(params[:artist_id])
    elsif (artist_name=params[:artist_name]).present?
      artist = Artist.find_or_create_by(name: artist_name)
    end

    if (track_name=params[:track_name]).present?
      track = Track.find_or_create_by(name: track_name, artist_id: artist.id)
      @play.track = track
    end

    if (album_name=params[:album_name]).present?
      album = Album.find_or_create_by(name: album_name)
      @play.album = album
    end


    respond_to do |format|
      if @play.save
        format.html { redirect_to plays_path, notice: 'Play was successfully created.' }
        format.json { render action: 'show', status: :created, location: @play }
      else
        format.html { render action: 'new' }
        format.json { render json: @play.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plays/1
  # PATCH/PUT /plays/1.json
  def update
    authorize! :update, @play
    respond_to do |format|
      if @play.update(play_params)
        format.html { redirect_to @play, notice: 'Play was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @play.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plays/1
  # DELETE /plays/1.json
  def destroy
    authorize! :destroy, @play
    @play.destroy
    respond_to do |format|
      format.html { redirect_to plays_url }
      format.json { head :no_content }
    end
  end

  # POST /search-playlist
  # POST /search-playlist.json
#  def search
    #q = "%#{params[:query]}%"
    #@plays = Play.where("track like ? or artist like ?", q, q).order('played_at DESC').page(params[:page])

#    authorize! :read, @plays
#  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_play
      @play = Play.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def play_params
      params.require(:play).permit(:track_id, :album_id, :user_id, :played_at,
                                   :track_name, :album_name, :artist_name)
    end
end
