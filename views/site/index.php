<?php
/* @var $this yii\web\View */
/* @var $data array */

$this->title = 'Short address';
?>

<div class="site-index">
    <div class="url-controls">
        <form class="short-ad-form" method="POST" onsubmit="return false;">
            <label for="original_url">Paste URL here, to make a short one:</label>
            <input id="original_url" class="nl" type="text" name="original_url" value="" placeholder="http://your.long.url/here/..." />
            <button type="button" class="submit button" >Create short address</button>
            <button type="reset" class="erase button">X</button>
        </form>
        <div class="rrow result<?php if (!isset($data['short_url'])) { print(' none'); } ?>">
            <div id="short-url" class="short-url">&nbsp;asdf</div>            
        </div>
        <div class="error" id="error"></div>
    </div>
</div>
