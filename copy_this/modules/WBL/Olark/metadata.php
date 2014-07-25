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
            )
        ),
        'title'       => 'WBL Olark Chat',
        'thumbnail'   => 'wbl_logo.jpg',
        'url'         => 'http://wbl-konzept.de',
        'version'     => '1.0.0'
    );