class AddSortingPrioToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :sorting_prio, :integer
  end
end
