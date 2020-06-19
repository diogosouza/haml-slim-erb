class NotesHamlController < ApplicationController
  def index
    @notes = JSON.parse(Constants::NOTES, object_class: OpenStruct)
  end
end
