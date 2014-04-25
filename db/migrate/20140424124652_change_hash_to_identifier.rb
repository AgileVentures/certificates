class ChangeHashToIdentifier < ActiveRecord::Migration
  def change
    rename_column :certificates, :hash, :identifier
  end
end
