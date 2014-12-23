class ApplicationMailer < ActionMailer::Base
  default from: "aoss.no.reply@gmail.com"
  TO_ADDRESS = "conwayje@gmail.com"

  def new_contact_request(contact_request_id)
    @cr = ContactRequest.find(contact_request_id)
    mail(to: TO_ADDRESS, subject: "[aoss.us] New Contact Request")
  end

  def new_employment_application(application_id)
    @app = EmploymentApplication.find(application_id)
    attachments[@app.resume.instance.resume_file_name] = File.read(@app.resume.path)
    
    mail(to: TO_ADDRESS, subject: "[aoss.us] New Employment Application")
  end
end
