<?php
    /**
     * Module-Metadata for the WBL Olark.
     * @author     blange <code@wbl-konzept.de>
     * @category   modules
     * @package    WBL_Olark
     * @subpackage oxAutoload
     * @version    SVN: $Id$
     */

    $sMetadataVersion = '1.0';

    $aModule = array(
        'author'      => 'WBL Konzept',
        'description' => array(
            'de' => 'Olark Chat',
            'en' => 'Olark chat'
        ),
        'email'       => 'code@wbl-konzept.de',
        'extend'      => array(),
        'blocks'      => array(
            array(
                'file'     => 'views/blocks/base_js.tpl',
                'block'    => 'base_js',
                'template' => 'layout/base.tpl',
            ),
        ),
        'id'          => 'WBL_Olark',
        'settings'    => array(
            array(
                'group' => 'WBL_Olark_Main',
                'name'  => 'sWBLOlarkSiteID',
                'type'  => 'str'
             ),
            array(
                'group' => 'WBL_Olark_Customer',
                'name'  => 'aWBLOlarkViewsForNotice',
                'type'  => 'arr',
                'value' => array('thankyou')
            ),
            array(
                'group' => 'WBL_Olark_Customer',
                'name'  => 'bWBLOlarkBasketStatus',
                'type'  => 'bool',
                'value' => true
            ),
            array(
                'group' => 'WBL_Olark_Customer',
                'name'  => 'bWBLOlarkDisplayUserInformation',
                'type'  => 'bool',
                'value' => true
            ),
            array(
                'group' => 'WBL_Olark_Display',
                'name'  => 'bWBLOlarkHideInCheckout',
                'type'  => 'bool',
                'value' => true
            ),
             array(
                 'group' => 'WBL_Olark_Display',
                 'name'  => 'sWBLOlarkChatPosition',
                 'type'  => 'select',
                 'constraints' => 'BR|BL|TR|TL',
                 'value' => 'BR'
             )
        ),
        'title'       => 'WBL Olark Chat',
        'thumbnail'   => 'wbl_logo.jpg',
        'url'         => 'http://wbl-konzept.de',
        /*
         * 1.0.0 Init Release
         * 1.0.1 Added languages en,ru
         * 1.1   Added user and basket information to the module
         */
        'version'     => '1.1'

    );
