class Todo < ApplicationRecord
  belongs_to :task

  def set_done
    self.update_attribute(:isComplete, true);
  end
end
