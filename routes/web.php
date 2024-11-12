<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

foreach (scandir($path=app_path('../modules')) as $dir) {

    if (file_exists($filepath = "{$path}/{$dir}/api.php")) {

        require $filepath;
    }

}
