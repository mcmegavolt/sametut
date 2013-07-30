/*
 Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.on( 'dialogDefinition', function( ev ){
    var dialogName = ev.data.name;
    var dialogDefinition = ev.data.definition;
    if ( dialogName == 'link' ){
        dialogDefinition.removeContents( 'advanced' );
        dialogDefinition.removeContents( 'upload' );
    }
    if ( dialogName == 'image' ){
        dialogDefinition.removeContents('advanced');
        dialogDefinition.removeContents( 'Link' );
    }
    if ( dialogName == 'flash' ){
        dialogDefinition.removeContents( 'advanced' );
    }
});


CKEDITOR.editorConfig = function( config )
{
    // Define changes to default configuration here. For example:
    config.uiColor = '#EBEBEB';


    config.forcePasteAsPlainText = true;

    /* Filebrowser routes */
    // The location of an external file browser, that should be launched when "Browse Server" button is pressed.
    config.filebrowserBrowseUrl = "/ckeditor/attachment_files";

    // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Flash dialog.
    config.filebrowserFlashBrowseUrl = "/ckeditor/attachment_files";

    // The location of a script that handles file uploads in the Flash dialog.
    config.filebrowserFlashUploadUrl = "/ckeditor/attachment_files";

    // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Link tab of Image dialog.
    config.filebrowserImageBrowseLinkUrl = "/ckeditor/pictures";

    // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Image dialog.
    config.filebrowserImageBrowseUrl = "/ckeditor/pictures";

    // The location of a script that handles file uploads in the Image dialog.
    config.filebrowserImageUploadUrl = "/ckeditor/pictures";

    // The location of a script that handles file uploads.
    config.filebrowserUploadUrl = "/ckeditor/attachment_files";

    // Rails CSRF token
    config.filebrowserParams = function(){
        var csrf_token = jQuery('meta[name=csrf-token]').attr('content'),
            csrf_param = jQuery('meta[name=csrf-param]').attr('content'),
            params = new Object();

        if (csrf_param !== undefined && csrf_token !== undefined) {
            params[csrf_param] = csrf_token;
        }

        return params;
    };

    config.removePlugins = 'elementspath,about,adobeair,bbcode,colordialog,devtools,div,docprops,embed,find,flash,forms,iframe,iframedialog,liststyle,pagebreak,pastefromword,scayt,smiley,specialchar,styles,stylesheetparser,table,tableresize,tabletools,templates';
    config.autoGrow_onStartup = true;
    config.autoGrow_minHeight = 600;
    config.resize_dir = 'vertical';
    config.resize_minHeight = 600;

    /* Extra plugins */
    // works only with en, ru, uk locales
    config.extraPlugins = "embed,attachment";

    /* Toolbars */
    config.toolbar = 'Easy';

    config.toolbar_Easy =
        [
            ['Undo','Redo','-','RemoveFormat'],
            ['Bold','Italic','Underline','Strike'], ['NumberedList','BulletedList','-','Blockquote'],
            ['JustifyLeft','JustifyCenter','JustifyRight'],
//            ['Link','Unlink'], ['Image'],
            ['Cut','Copy','Paste'],
            ['Source','-','Preview'],
            ['Maximize']
        ];
};