<?php
namespace src\app\Helpers;

class FileUpload{
    public function __construct($app) {
        $this->app = $app;//->getContainer();
    }
    public function uploadProfileImage($fromFilePath)
	{
		$dir = $this->app->get('profile_pic_upload');
		$crop_dir_200 = $this->app->get('profile_pic_upload_croped_200');
		$crop_dir_100 = $this->app->get('profile_pic_upload_croped_100');
		$uploadedImageUrl = \Cloudinary\Uploader::upload(
			$fromFilePath,
			[
				"folder" => $dir,
				"overwrite" => true,
				"resource_type" => "image"
			]
		)['secure_url'];
		//$uploadedImageUrl=$uploadResult['url'];
		$uploadedImageCrop100Url = \Cloudinary\Uploader::upload($uploadedImageUrl, [
			"folder" => $crop_dir_100,
			"overwrite" => true,
			"resource_type" => "image",
			"width" => 100,
			"quality" => "auto",
			"crop" => "scale"
		])['secure_url'];
		$uploadedImageCrop200Url = \Cloudinary\Uploader::upload($uploadedImageUrl, [
			"folder" => $crop_dir_200,
			"overwrite" => true,
			"resource_type" => "image",
			"width" => 200,
			"quality" => "auto",
			"crop" => "scale"
		])['secure_url'];
		return [
			'url' => $uploadedImageUrl,
			'url_crop_100' => $uploadedImageCrop100Url,
			'url_crop_200' => $uploadedImageCrop200Url
		];
	}
}