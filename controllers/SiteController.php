<?php

namespace app\controllers;

use Yii;
use yii\web\Controller;

use app\components\SiteHelper;
use app\models\Url;

/**
 * main site controller.
 */
class SiteController extends Controller
{
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }
    
    /**
     * frontpage
     */
    public function actionIndex()
    {
        $data = [];
        return $this->render('index', [
            'data' => $data,
        ]);
    }
    
    /**
     * Generates short address.
     * 
     * @ajax
     */
    public function actionMakeShortAddress()
    {
        $error = [];
        $code = 200;
        $short_url = '';        
        if (Yii::$app->request->isAjax) {
            $request = Yii::$app->request->post();
            $original_url = $request['original_url'];
            if (!SiteHelper::isValidUrl($original_url)) {
                $error[] = 'Not a valid URL. We cannot save it.';
                $code = 400;
            } else {
                $short_url = SiteHelper::makeShortUrl($original_url);
            }
            
            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            return [
                'request' => $request,
                'short_url' => $short_url,
                'code' => $code,
                'error' => $error,
            ];
        }
        return '';
    }  
    
    /**
     * Make redirect from db, if it exists.
     */
    public function actionRedirect($uri)
    {
        $url_obj = Url::findByShortUrl($uri);
        if (!$url_obj) {
            throw new \yii\web\NotFoundHttpException();
        }        
        $redirect_url = $url_obj->original_url;
        
        return $this->redirect($redirect_url, 301);
    }  
}
