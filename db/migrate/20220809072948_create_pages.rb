class CreatePages < Db::CreateBase
  def change
    create_table :pages do |t|
      t.id     :company
      t.id     :design
      t.string :title
      t.binary :content, limit: 3.gigabytes
    end
  end
end
