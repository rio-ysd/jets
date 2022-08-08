<?php
class AppController {
    protected function render($items) {
        require('views/index.php');
    }
}











class ItemsController extends AppController {
    public function index() {
        $items = ['hoge', 'fuga'];

        $this->render($items);
    }
}


class UsersController extends AppController {
    public function index() {
        $items = ['taro', 'hanako'];

        $this->render($items);
    }
}









// $ctrl = new ItemsController();
// $ctrl->index();

$ctrl = new UsersController();
$ctrl->index();