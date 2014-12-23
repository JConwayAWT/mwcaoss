class EmploymentApplication < ActiveRecord::Base

  has_attached_file :resume, path: "resumes/:id/:filename"

  do_not_validate_attachment_file_type :resume

end

require 'paperclip/media_type_spoof_detector'
module Paperclip
  class MediaTypeSpoofDetector
    def spoofed?
      return false
    end
  end
end