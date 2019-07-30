describe Fastlane::Actions::GitlabMergeRequestAddNoteAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The gitlab_merge_request_add_note plugin is working!")

      Fastlane::Actions::GitlabMergeRequestAddNoteAction.run(nil)
    end
  end
end
