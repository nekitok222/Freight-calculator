<?php

declare(strict_types=1);

spl_autoload_register(function (string $class){
    $class = str_replace('\\', DIRECTORY_SEPARATOR, $class);
    $path = __DIR__ . "/src/{$class}.php";
    if (is_readable($path)){
        require $path;
    }
});
