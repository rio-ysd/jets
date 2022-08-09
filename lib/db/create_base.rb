class Db::CreateBase < ActiveRecord::Migration[6.0]
  def create_table(table, &proc)
    super table, id: :bigint, unsigned: true do |t|
      def t.id(column, args = {})
        args[:null]        ||= false
        args[:index]       = true
        args[:limit]       = 8
        args[:unsigned]    = true
        args[:foreign_key] ||= true
        self.references column, args
      end
      yield t

      t.timestamps null: false
      t.datetime :deleted_at, null: false
    end

    add_index table, :deleted_at
  end
end
