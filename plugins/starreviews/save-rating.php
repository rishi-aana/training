<?php
/**
 * Quickad Rating & Reviews - jQuery & Ajax php
 * @author Bylancer
 * @version 1.0
 */

include_once("setting.php");

// Converts linebreaks to <br>
function mynl2br($text) 
{ 
    return strtr($text, array("\r\n" => '<br />', "\r" => '<br />', "\n" => '<br />')); 
} 

$login_error_msg = '<p><strong><font color="red">'.__("Error").':</font></strong> '.__('Your review could not be saved! Please Login for write review.').'</p>';
$error_msg = '<p><strong><font color="red">'.__("Error").':</font></strong> '.__('Your review could not be saved! Try it again later.').'</p>';
$success_msg = '<div style="background:#B6FABE; border:solid 1px #82D18B; padding-left:10px;"><p class="saved-success"><strong>'.__('Thank you').'!</strong> '.__('Your review has been saved.').'<p></div>';
         
if (isset($_POST['rating'])) {

    if(isset($_SESSION['user']['id'])){

        $message = mynl2br($_POST['message']);
        $save_reviews = ORM::for_table($config['db']['pre'].'reviews')->create();
        $save_reviews->project_id = $productid;
        $save_reviews->user_id = $_SESSION['user']['id'];
        $save_reviews->comments = $message;
        $save_reviews->rating = $_POST['rating'];
        $save_reviews->save();

        // save review to database
        if ($save_reviews->id()) {
            echo $success_msg;
        } else {
            echo $error_msg;
        }
    } else {
        echo $login_error_msg;
    }

} 
?>