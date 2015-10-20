module ApplicationHelper
  def employer_page(controller_name)
    ['EmployersController', 'EmployerContactsController'].include? controller_name
  end
end
