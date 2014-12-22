json.array!(@contact_requests) do |contact_request|
  json.extract! contact_request, :id, :name, :company, :address, :email, :telephone, :best_time_to_contact, :inquiry_details
  json.url contact_request_url(contact_request, format: :json)
end
