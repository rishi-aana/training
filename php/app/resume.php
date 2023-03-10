<?php
// if resume is disable
if(!$config['resume_enable']){
    error(__("Page Not Found"), __LINE__, __FILE__, 1);
}
if(checkloggedin())
{
	update_lastactive();
	$ses_userdata = get_user_data($_SESSION['user']['username']);
	if($ses_userdata['user_type'] != 'user'){
		headerRedirect($link['DASHBOARD']);
	}
	$id = $name = $error = $resume_file = '';
    global $match;
	if(isset($match['params']['id'])){
        $_GET['id'] = $match['params']['id'];

		$result = ORM::for_table($config['db']['pre'].'resumes')
		->where('user_id' , $_SESSION['user']['id'])
		->where('id' , $_GET['id'])
		->where('active' , '1')
		->find_one();

		$name = $result['name'];
		$id = $_GET['id'];
	}

	if(isset($_POST['submit'])){
		if(empty($_POST['name'])){
			$_POST['name'] = date('Y-m-d-h-i');
		}
		$name = $_POST['name'];
		if (isset($_FILES['resume']['name']) && $_FILES['resume']['name'] != ""){
			// Valid formats
			$resume_files = trim(get_option("resume_files"));
			$valid_formats = explode(',', $resume_files);
			$target_dir = ROOTPATH . "/storage/resumes/";
			$result = quick_file_upload('resume',$target_dir,$valid_formats);
			if($result['success']){
				if(!empty($_POST['id'])){
					$old_resume = ORM::for_table($config['db']['pre'].'resumes')
						->select('filename')
						->where('id',$_POST['id'])
						->where('user_id',$_SESSION['user']['id'])
						->find_one();
					$old_filename = $old_resume['filename'];
					if (file_exists($target_dir . $old_filename)) {
						unlink($target_dir . $old_filename);
					}
				}
				$resume_file = $result['file_name'];
			}else{
				$error = $result['error'];
			}
		}else{
			if(empty($_POST['id'])){
				$error = __("Resume is required");
			}
		}

		if($error == ''){
			// save resume in database
			$now = date("Y-m-d H:i:s");
			if(!empty($_POST['id'])){
				$resume_create = ORM::for_table($config['db']['pre'].'resumes')
				->where('id',$_POST['id'])
				->where('user_id',$_SESSION['user']['id'])
				->find_one();

				if($resume_create){
					if(!empty($resume_file)){
						$resume_create->set('filename', $resume_file);
					}
					$resume_create->set('name', validate_input($_POST['name']));
					$resume_create->set('updated_at', $now);
					$resume_create->save();
				}
			}else{
				$resume_create = ORM::for_table($config['db']['pre'].'resumes')->create();
				$resume_create->name = validate_input($_POST['name']);
				$resume_create->filename = $resume_file;
				$resume_create->user_id = $_SESSION['user']['id'];
				$resume_create->created_at = $now;
				$resume_create->updated_at = $now;
				$resume_create->save();
			}

			transfer($link['RESUMES'],__("Resume Uploaded."),__("Resume Uploaded."));
			exit;
		}
	}

	//Print Template
	HtmlTemplate::display('resume', array(
		'name' => $name,
		'id' => $id,
		'error' => $error
	));
	exit;
}else{
	headerRedirect($link['LOGIN']);
}
?>
