# app/models/school.rb
class School < ApplicationRecord
    after_create_commit { broadcast_append_to "schools" }
    after_update_commit { broadcast_replace_to "schools" }
    after_destroy_commit { broadcast_remove_to "schools" }
  end
  