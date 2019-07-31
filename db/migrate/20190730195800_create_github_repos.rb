class CreateGithubRepos < ActiveRecord::Migration[5.0]
  def change
    create_table :github_repos do |t|
      t.string :name
      t.integer :part_number
      t.timestamps
    end
  end
end
