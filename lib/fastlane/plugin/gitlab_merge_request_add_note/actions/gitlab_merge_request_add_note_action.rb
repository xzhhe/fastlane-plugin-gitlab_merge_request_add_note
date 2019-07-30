require 'fastlane/action'
require_relative '../helper/gitlab_merge_request_add_note_helper'

module Fastlane
  module Actions
    class GitlabMergeRequestAddNoteAction < Action
      def self.run(params)
        require 'gitlab'
        
        host = params[:host]
        private_token = params[:private_token]
        project_id = params[:project_id]
        mr_id = params[:mr_id]
        comment = params[:comment]

        g = Gitlab.client(endpoint: host, private_token: private_token)
        g.create_merge_request_note(project_id, mr_id, comment)
      end

      def self.description
        "add merge request note for gitlab server api"
      end

      def self.details
        'wrapper add gitlab comment shell codes:
          curl  -H Content-Type: application/json \
              -H PRIVATE-TOKEN: xxxxxxx \
              -X POST \
              -d {body:COMMENT} https://git.in.xxxx.com/api/v4/projects/xxx/merge_requests/13/notes'
      end

      def self.authors
        ["xiongzenghui"]
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(
            key: :host,
            description: "host for gitlab server",
            verify_block: proc do |value|
              UI.user_error!("No host given") unless (value and not value.empty?)
            end
          ),
          FastlaneCore::ConfigItem.new(
            key: :private_token,
            description: "private_token for gitlab server",
            verify_block: proc do |value|
              UI.user_error!("No private_token given") unless (value and not value.empty?)
            end
          ),
          FastlaneCore::ConfigItem.new(
            key: :project_id,
            description: "project_id for gitlab git repo",
            verify_block: proc do |value|
              UI.user_error!("No project_id given") unless (value and not value.empty?)
            end
          ),
          FastlaneCore::ConfigItem.new(
            key: :mr_id,
            description: "id for gitlab merge request",
            verify_block: proc do |value|
              UI.user_error!("No mr_id for given") unless (value and not value.empty?)
            end
          ),
          FastlaneCore::ConfigItem.new(
            key: :comment,
            description: "comment for gitlab merge request page",
            verify_block: proc do |value|
              UI.user_error!("No comment for given") unless (value and not value.empty?)
            end
          )
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
