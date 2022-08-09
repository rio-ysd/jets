class CreateLayouts < Db::CreateBase
  def change
    create_table :layouts do |t|
      t.id     :company
      t.string :title
      t.string :content
    end
  end
end
