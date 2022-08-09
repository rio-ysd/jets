class CreateDesigns < Db::CreateBase
  def change
    create_table :designs do |t|
      t.id     :company
      t.string :title
      t.string :content
    end
  end
end
