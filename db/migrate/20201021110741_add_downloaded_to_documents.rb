class AddDownloadedToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :downloaded, :boolean, :default => false
  end
end
