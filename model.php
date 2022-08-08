<?php
class Model {
    public $id;

    public static function where($where) {
        $table = mb_strtolower(get_called_class()) . 's';
        $query = "select * from $table where $where";
        $rows = array(
            array('id' => 1, 'name'=>'翔平', 'barth_year'=>2003),
            array('id' => 2, 'name'=>'一輝', 'barth_year'=>1998),
            array('id' => 3, 'name'=>'ヨッシー', 'barth_year'=>1986)
        );

        $records = array();
        foreach ($rows as $row) {
            $class = get_called_class();
            $record = new $class;
            foreach ($row as $key => $value) {
                $record->{$key} = $value;
            }
            $records[] = $record;
        }

        return $records;
    }

    public static function find() {
    }
}

class Item extends Model {
    public $name;
    public $barth_year;

    public function age() {
        return 2022 - $this->barth_year;
    }

    public function canBoughtAlcor() {
        return $this->age() >= 20;
    }

    // public function isAdmin() {
    //     return $this->role == 1;
    // }
}

class User extends Model {
    public $name;
}

$items = Item::where('user_id = 10');
foreach ($items as $item) {
    $age = $item->age();
    echo "$item->name は $age 才 ";
    if ($item->canBoughtAlcor()) {
        echo '買える';
    } else {
        echo '買えない';
    }
    echo "\n";
}
// $users = User::where('user_id = 10');
// var_dump($users);
