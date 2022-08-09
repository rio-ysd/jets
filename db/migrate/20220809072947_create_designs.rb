class CreateDesigns < Db::CreateBase
  def change
    create_table :designs do |t|
      t.id     :company
      t.id     :layout
      t.string :title
      t.binary :content, limit: 3.gigabytes
    end
  end
end
