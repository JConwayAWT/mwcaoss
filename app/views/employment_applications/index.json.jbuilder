json.array!(@employment_applications) do |employment_application|
  json.extract! employment_application, :id, :name, :business_name, :address, :telephone, :email, :current_sop_details, :how_did_you_hear
  json.url employment_application_url(employment_application, format: :json)
end
