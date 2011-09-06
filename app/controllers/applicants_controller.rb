class ApplicantsController < ApplicationController
  # GET /applicants
  # GET /applicants.json
  def index

  end

  # GET /applicants/1
  # GET /applicants/1.json
  def show
    @applicant = Applicant.find(params[:id])



  end

  # GET /applicants/new
  # GET /applicants/new.json
  def new
    @applicant = Applicant.new

  end

  # GET /applicants/1/edit
  def edit
    @applicant = Applicant.find(params[:id])
  end

  # POST /applicants
  # POST /applicants.json
  def create

    @applicant = Applicant.new(params[:applicant])

      if @applicant.save

        redirect_to @applicant, notice: 'Applicant was successfully created.'

      else
        render action: "new"
      end

  end


  def update
    @applicant = Applicant.find(params[:id])

      if @applicant.update_attributes(params[:applicant])
        redirect_to @applicant, notice: 'Applicant was successfully updated.'

      else
        render action: "edit"
      end

  end


  def destroy
    @applicant = Applicant.find(params[:id])
    @applicant.destroy

    redirect_to applicants_url

  end

    private

  def applicant
    @applicant = if params[:id]
      Applicant.find(params[:id])
    else
      Applicant.new(params[:category])
    end
  end
  helper_method :applicant

  def applicants
    @applicants = Applicant.all

  end
  helper_method :applicants



end
