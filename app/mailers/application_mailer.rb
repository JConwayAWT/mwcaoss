class ApplicationMailer < ActionMailer::Base
  default from: "aoss.no.reply@gmail.com"

  @@quotes_and_service_address = "aossservice@aoss.us"
  @@careers_address = "director@aoss.us"

  def new_contact_request(contact_request_id)
    @cr = ContactRequest.find(contact_request_id)
    mail(to: @@quotes_and_service_address, subject: "[aoss.us] New Contact Request")
  end

  def new_employment_application(application_id)
    @app = EmploymentApplication.find(application_id)
    if @app.resume.exists?
      attachments[@app.resume.instance.resume_file_name] = File.read(@app.resume.path)
    end

    mail(to: @@careers_address, subject: "[aoss.us] New Employment Application")
  end
end
