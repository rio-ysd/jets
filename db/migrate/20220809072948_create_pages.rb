class CreatePages < Db::CreateBase
  def change
    create_table :pages do |t|
      t.id     :company
      t.id     :design
      t.string :title
      t.string :content
    end
  end
end
