class CreateCompanies < Db::CreateBase
  def change
    create_table :companies do |t|
      t.string :name
    end
  end
end
