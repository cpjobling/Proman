class StudentsController < ApplicationController
  
   
   #require_role "admin", :for => :list

  def index
    redirect_to :action => 'list'
  end
  def list
    @students = Student.find(:all, :order => "grade DESC")
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @users = User.find_by_sql("SELECT u.id, CONCAT(u.first_name, ' ', u.last_name) AS fullname FROM users AS u, roles_users AS ru, roles AS r WHERE u.id = ru.user_id AND r.id = ru.role_id AND r.name = 'student' AND u.id NOT IN (SELECT user_id FROM students WHERE user_id != 0 OR user_id IS NOT NULL)")
    @student = Student.new
  end

  def create
    @student = Student.new(params[:student])
    if @student.save!
        redirect_to :action => "index"
    else
      render :action => "new"
    end

  end

  def update
    @student = Student.find(params[:id])
    @student.attributes = params[:student]
    @student.save!
    redirect_to :action => "index"
  end

  def choose_projects
    @student = Student.find_by_user_id session[:user_id]
    @wishes = Wish.find_by_sql ["SELECT * FROM wishes WHERE student_id = ? AND tour = ? ORDER BY wish ASC", @student.id, @student.tour]
    @projects = Project.find_by_sql "SELECT * FROM projects WHERE id NOT IN (SELECT project_id FROM students WHERE project_id IS NOT NULL OR project_id != 0)"
  end

  def apply_projects
    # da se vzeme id-to ot sesiqta 1 da se smeni
    @student = Student.find_by_user_id session[:user_id]
    @wishes = {}
    limit = 3
    i = 0
    @applied = params[:applied]
    @applied.each do |x|
      unless x[1].empty?
        @wishes[x[0].to_i] = x[1]
        i += 1
      end
    end
    if limit == i && @wishes.length == limit && @wishes.length > 0
        flash[:notice] = "Everything is ok :) "
        @student.apply_projects(@student.id, @wishes, @student.tour)
        render :action => "choose_projects"
      else
        flash[:notice] = "You have to choose " + limit.to_s + " projects. You choose " + i.to_s
        redirect_to :action => "choose_projects"
      end
  end

  def applied_projects
    @student = Student.find(params[:id])
    @projects = Student.find_by_sql "SELECT p.title, p.id, sp.wish FROM projects AS p, students AS s, wishes AS sp WHERE  sp.project_id = p.id AND sp.student_id = s.id AND sp.student_id = #{params[:id]} ORDER BY wish"
  end
end