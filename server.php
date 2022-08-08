<?php
class AppController {
    public $id = null;
}

class ItemsController extends AppController {
    public function index() {
        echo '<h1>Index</h1>';
        echo '<ul>';
        echo '<li><a href="/items/1">item1</a></li>';
        echo '<li><a href="/items/2">item2</a></li>';
        echo '<li><a href="/items/3">item3</a></li>';
        echo '</ul>';
    }

    public function show() {
        echo "<h1>Show$this->id</h1><a href=\"/items\">戻る</a>";
    }
}

$path = mb_ereg_replace('/', '', 
    preg_replace('/\/[0-9]+/', '', $_SERVER['REQUEST_URI'])
);

$class = ucfirst($path) . 'Controller';
if (!class_exists($class)) {
    echo '404 Not Found';
    exit;
}

$controller = new $class;
$match = preg_match('/\/([0-9]+)/', $_SERVER['REQUEST_URI'], $matches);
if ($match){
    $controller->id = $matches[1];
    $controller->show();
}else{
    $controller->index();
}
