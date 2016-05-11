<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "urls".
 *
 * @property integer $id
 * @property string $original_url
 * @property string $original_url_hash
 * @property string $short_url
 * @property integer $status
 * @property string $created_at
 * @property string $updated_at
 */
class Url extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'urls';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['original_url', 'original_url_hash', 'short_url', 'created_at'], 'required'],
            [['status'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['original_url'], 'string', 'max' => 4000],
            [['original_url_hash'], 'string', 'max' => 32],
            [['short_url'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'original_url' => 'Original Url',
            'original_url_hash' => 'Original Url Hash',
            'short_url' => 'Short Url',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    /**
     * @inheritdoc
     * @return UrlQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new UrlQuery(get_called_class());
    }
    
    /**
     * find a model by original_url_hash
     */
    public static function findByHash($hash)
    {
        $result = static::find()
            ->where('original_url_hash = :hash', ['hash' => $hash])
            ->all();
        return $result;
    }
    
    public static function findByShortUrl($short_url)
    {
        $result = static::find()
            ->where('short_url = :short_url', ['short_url' => $short_url])
            ->one();
        return $result;
    }
}
