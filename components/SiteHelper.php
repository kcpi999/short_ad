<?php

namespace app\components;

use app\models\Url;

/**
 * different helper functions here.
 */
class SiteHelper
{
    // length of short url path
    const SHORT_URL_LENGTH = 8; // 52 ^ 8 = 53459728531456 combinations. [a-zA-Z]
    
    // we'll use only these symbols to generate short urls
    const CHARS_SET = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';  
    
    /**
     * generates unique short url. (Not URL but URI actually)
     *
     * @return string;
     */
    protected static function generateShortUrl() {
        $chars_set = self::CHARS_SET;
        $set_length = strlen($chars_set);
        $result_url = '';
        for ($i=0; $i < self::SHORT_URL_LENGTH; $i++) {
            $rand_pos = mt_rand(0, $set_length - 1);
            $char = substr($chars_set, $rand_pos, 1);
            $result_url .= $char;
        }
        return $result_url;
    }

    /**
     * checks if string $url is a valid URL
     * Let's assume, we dont need unicode urls.
     * Because we lazy and do not want to install intl.
     */
    public static function isValidUrl($url)
    {
        $regex = "((https?|ftp)\:\/\/)?"; // SCHEME 
        $regex .= "([a-z0-9+!*(),;?&=\$_.-]+(\:[a-z0-9+!*(),;?&=\$_.-]+)?@)?"; // User and Pass 
        $regex .= "([a-z0-9-.]*)\.([a-z]{2,3})"; // Host or IP 
        $regex .= "(\:[0-9]{2,5})?"; // Port 
        $regex .= "(\/([a-z0-9+\$_-]\.?)+)*\/?"; // Path 
        $regex .= "(\?[a-z+&\$_.-][a-z0-9;:@&%=+\/\$_.-]*)?"; // GET Query 
        $regex .= "(#[a-z_.-][a-z0-9+\$_.-]*)?"; // Anchor 

        if(preg_match("/^$regex$/", $url)) { 
            return true; 
        }
        return false;
    }
    
    /**
     * creates new short URL for the original one, if there was none in database.
     * Or returns one from database.
     * 
     * @return string short_url
     */
    public static function makeShortUrl($original_url)
    {
        $hash = md5($original_url);
        $url = Url::findByHash($hash);
        if ($url && $url->original_url == $original_url) {
            return self::getFullShortUrl($url->short_url);
        }
        
        $transaction = \Yii::$app->db->beginTransaction();
        try {
            $url = new Url();
            $url->original_url = $original_url;
            $url->original_url_hash = $hash;
            $url->short_url = self::generateShortUrl();
            $url->status = 1;            
            $url->created_at = date('Y-m-d H:i:s', time());
            $url->save();
            $transaction->commit();
        } catch(\Exception $e) {
            $transaction->rollBack();
            Yii::error($e->getMessage());
        }
        return self::getFullShortUrl($url->short_url);
    }
    
    /**
     * Adds this site domain to short url path.
     * (no need to store site domain in database)
     */
    public static function getFullShortUrl($short_url)
    {
        $base = $_SERVER['SERVER_NAME'];
        return $base . '/' . $short_url;
    }
}
