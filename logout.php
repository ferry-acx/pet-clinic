<?php
session_start();
unset($_SESSION['email']);
unset($_SESSION['role']);
session_destroy();
header("Location:https://pet-clinic.accenzo.site/");
exit;