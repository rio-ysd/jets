class CreateLayouts < Db::CreateBase
  def change
    create_table :layouts do |t|
      t.id     :company
      t.string :title
      t.binary :content, limit: 3.gigabytes
    end
  end
end
