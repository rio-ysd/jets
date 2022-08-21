class CreateAdmins < Db::CreateBase
  def change
    create_table :admins do |t|

      t.id     :user
    end
  end
end
