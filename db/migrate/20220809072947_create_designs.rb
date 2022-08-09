class CreateDesigns < Db::CreateBase
  def change
    create_table :pages do |t|
      t.id     :company
      t.string :title
      t.string :content
    end
  end
end
