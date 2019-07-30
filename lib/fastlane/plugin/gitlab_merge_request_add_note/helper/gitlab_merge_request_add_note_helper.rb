require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class GitlabMergeRequestAddNoteHelper
      # class methods that you define here become available in your action
      # as `Helper::GitlabMergeRequestAddNoteHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the gitlab_merge_request_add_note plugin helper!")
      end
    end
  end
end
