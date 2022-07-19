class CreateTables < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :gender
      t.boolean :is_queer

      t.timestamps
    end

    create_table :books do |t|
      t.string :title, null: false
      t.float :rating
      t.string :language
      t.binary :cover_image
      t.string :genre
      t.boolean :is_fiction
      t.float :dewey_decimal
      t.integer :publication_year, limit: 4
      t.boolean :female_protagonist?
      t.boolean :queer_protagonist?
      t.boolean :queer_character?

      t.timestamps
    end

    create_join_table :authors, :books do |t|
      t.index :author_id
      t.index :book_id
    end

    create_table :users do |t|
      t.string :email, null: false
      t.string :username
      t.string :password_digest
    end

    create_table :personal_authors do |t|
      t.references :author, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :comments

      t.timestamps
    end

    create_table :personal_books do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :tags
      t.integer :reading_status, default: 0
      t.boolean :is_owned?, default: true
      t.boolean :was_recommended?, default: false
      t.string :recommended_by
      t.float :rating
      t.date :completion_date
      t.text :relevant_links
      t.text :comments

      t.timestamps
    end
  end
end
