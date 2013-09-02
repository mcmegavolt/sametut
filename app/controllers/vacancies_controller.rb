class VacanciesController < InheritedResources::Base

  belongs_to :school, :optional => true

  actions :all, :except => [:show]

  protected
  
    def collection
      @vacancies ||= end_of_association_chain.page params[:page]
    end


  # def index
  # end

  # def show
  # end

  # def new
  #   @vacancy = school.vacancies.build
  # end

  # def edit
  #   @vacancy = school.vacancies.find(params[:id])
  # end

  # def create
  #   @vacancy = school.vacancies.build(params[:vacancy])
  #   if @vacancy.save
  #     flash[:success] = t(:'site.user.vacancies.messages.created')
  #     #NotificationMailer.posting_created(posting).deliver
  #     redirect_to school_vacancies_path(school)
  #   else
  #     render :new
  #   end
  # end

  # def update
  #   @vacancy = Vacancy.find(params[:id])
  #   if @vacancy.update_attributes params[:vacancy]
  #     flash[:success] = t(:'site.user.vacancies.messages.updated')
  #     redirect_to school_vacancies_path(school)
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @vacancy = Vacancy.find(params[:id])
  #   @vacancy.destroy
  #   flash[:success] = t(:'site.user.vacancies.messages.deleted')
  #   redirect_to school_vacancies_path(school)
  # end

  # def vacancies
  #   @vacancies ||=
  #       if school.present?
  #         school.vacancies
  #       else
  #         Vacancy.page params[:page]
  #       end
  # end
  # helper_method :vacancies

  # def school
  #   @school ||= School.find params[:school_id] if params[:school_id]
  # end
  # helper_method :school

  # def vacancies_count
  #   @vacancies_count = Vacancy.count
  # end
  # helper_method :vacancies_count


end