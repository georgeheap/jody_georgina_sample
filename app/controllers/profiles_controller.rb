class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = current_user.build_profile
    @profile.avatars.build
  end

  # GET /profiles/1/edit
  def edit
    @profile.avatars.build
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = current_customer.build_profile(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to customer_edit_profile_path(current_customer), notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to customer_edit_profile_path(current_customer), notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = current_customer.profile || current_customer.build_profile
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      permitted = params.require(:profile).permit(:default_avatar_id, :weight_kg, :bio, :tagline,
        avatars_attributes: [:id, :caption, :avatar])
      permitted[:avatars_attributes].each do |k,v|
        permitted[:avatars_attributes].delete k if v[:id].nil? && v[:avatar].nil?
      end
      permitted
    end
end
