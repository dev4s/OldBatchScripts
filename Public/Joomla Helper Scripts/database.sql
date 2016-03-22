-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Czas wygenerowania: 08 Cze 2010, 12:38
-- Wersja serwera: 5.1.41
-- Wersja PHP: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza danych: `new`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_attachments`
--

DROP TABLE IF EXISTS `jos_attachments`;
CREATE TABLE IF NOT EXISTS `jos_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(80) NOT NULL,
  `filename_sys` varchar(255) NOT NULL,
  `file_type` varchar(30) NOT NULL,
  `file_size` int(11) unsigned NOT NULL,
  `icon_filename` varchar(20) NOT NULL,
  `display_filename` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `article_id` int(11) unsigned NOT NULL,
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_field_1` varchar(100) NOT NULL DEFAULT '',
  `user_field_2` varchar(100) NOT NULL DEFAULT '',
  `user_field_3` varchar(100) NOT NULL DEFAULT '',
  `create_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `download_count` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `attachment_article_id_index` (`article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `jos_attachments`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_banner`
--

DROP TABLE IF EXISTS `jos_banner`;
CREATE TABLE IF NOT EXISTS `jos_banner` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(30) NOT NULL DEFAULT 'banner',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `imageurl` varchar(100) NOT NULL DEFAULT '',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `date` datetime DEFAULT NULL,
  `showBanner` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `custombannercode` text,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tags` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `viewbanner` (`showBanner`),
  KEY `idx_banner_catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `jos_banner`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_bannerclient`
--

DROP TABLE IF EXISTS `jos_bannerclient`;
CREATE TABLE IF NOT EXISTS `jos_bannerclient` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` time DEFAULT NULL,
  `editor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `jos_bannerclient`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_bannertrack`
--

DROP TABLE IF EXISTS `jos_bannertrack`;
CREATE TABLE IF NOT EXISTS `jos_bannertrack` (
  `track_date` date NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jos_bannertrack`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_categories`
--

DROP TABLE IF EXISTS `jos_categories`;
CREATE TABLE IF NOT EXISTS `jos_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `section` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(30) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Zrzut danych tabeli `jos_categories`
--

INSERT INTO `jos_categories` (`id`, `parent_id`, `title`, `name`, `alias`, `image`, `section`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `editor`, `ordering`, `access`, `count`, `params`) VALUES
(1, 0, 'Kontakt', '', 'kontakt', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_components`
--

DROP TABLE IF EXISTS `jos_components`;
CREATE TABLE IF NOT EXISTS `jos_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `menuid` int(11) unsigned NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `admin_menu_link` varchar(255) NOT NULL DEFAULT '',
  `admin_menu_alt` varchar(255) NOT NULL DEFAULT '',
  `option` varchar(50) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `admin_menu_img` varchar(255) NOT NULL DEFAULT '',
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parent_option` (`parent`,`option`(32))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

--
-- Zrzut danych tabeli `jos_components`
--

INSERT INTO `jos_components` (`id`, `name`, `link`, `menuid`, `parent`, `admin_menu_link`, `admin_menu_alt`, `option`, `ordering`, `admin_menu_img`, `iscore`, `params`, `enabled`) VALUES
(1, 'Banners', '', 0, 0, '', 'Banner Management', 'com_banners', 0, 'js/ThemeOffice/component.png', 0, 'track_impressions=0\ntrack_clicks=0\ntag_prefix=\n\n', 1),
(2, 'Banners', '', 0, 1, 'option=com_banners', 'Active Banners', 'com_banners', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(3, 'Clients', '', 0, 1, 'option=com_banners&c=client', 'Manage Clients', 'com_banners', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(4, 'Web Links', 'option=com_weblinks', 0, 0, '', 'Manage Weblinks', 'com_weblinks', 0, 'js/ThemeOffice/component.png', 0, 'show_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\nshow_page_title=1\nlink_target=0\nlink_icons=\n\n', 1),
(5, 'Links', '', 0, 4, 'option=com_weblinks', 'View existing weblinks', 'com_weblinks', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(6, 'Categories', '', 0, 4, 'option=com_categories&section=com_weblinks', 'Manage weblink categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(7, 'Contacts', 'option=com_contact', 0, 0, '', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/component.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(8, 'Contacts', '', 0, 7, 'option=com_contact', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/edit.png', 1, '', 1),
(9, 'Categories', '', 0, 7, 'option=com_categories&section=com_contact_details', 'Manage contact categories', '', 2, 'js/ThemeOffice/categories.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(10, 'Polls', 'option=com_poll', 0, 0, 'option=com_poll', 'Manage Polls', 'com_poll', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(11, 'News Feeds', 'option=com_newsfeeds', 0, 0, '', 'News Feeds Management', 'com_newsfeeds', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(12, 'Feeds', '', 0, 11, 'option=com_newsfeeds', 'Manage News Feeds', 'com_newsfeeds', 1, 'js/ThemeOffice/edit.png', 0, 'show_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\n\n', 1),
(13, 'Categories', '', 0, 11, 'option=com_categories&section=com_newsfeeds', 'Manage Categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(14, 'User', 'option=com_user', 0, 0, '', '', 'com_user', 0, '', 1, '', 1),
(15, 'Search', 'option=com_search', 0, 0, 'option=com_search', 'Search Statistics', 'com_search', 0, 'js/ThemeOffice/component.png', 1, 'enabled=0\n\n', 1),
(16, 'Categories', '', 0, 1, 'option=com_categories&section=com_banner', 'Categories', '', 3, '', 1, '', 1),
(17, 'Wrapper', 'option=com_wrapper', 0, 0, '', 'Wrapper', 'com_wrapper', 0, '', 1, '', 1),
(18, 'Mail To', '', 0, 0, '', '', 'com_mailto', 0, '', 1, '', 1),
(19, 'Media Manager', '', 0, 0, 'option=com_media', 'Media Manager', 'com_media', 0, '', 1, 'upload_extensions=bmp,csv,doc,epg,gif,ico,jpg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,EPG,GIF,ICO,JPG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\nupload_maxsize=10000000\nfile_path=images\nimage_path=images/stories\nrestrict_uploads=1\nallowed_media_usergroup=3\ncheck_mime=1\nimage_extensions=bmp,gif,jpg,png\nignore_extensions=\nupload_mime=image/jpeg,image/gif,image/png,image/bmp,application/x-shockwave-flash,application/msword,application/excel,application/pdf,application/powerpoint,text/plain,application/x-zip\nupload_mime_illegal=text/html\nenable_flash=0\n\n', 1),
(20, 'Articles', 'option=com_content', 0, 0, '', '', 'com_content', 0, '', 1, 'show_noauth=0\nshow_title=0\nlink_titles=0\nshow_intro=0\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_item_navigation=0\nshow_readmore=0\nshow_vote=0\nshow_icons=0\nshow_pdf_icon=0\nshow_print_icon=0\nshow_email_icon=0\nshow_hits=0\nfeed_summary=0\nfilter_tags=\nfilter_attritbutes=\n\n', 1),
(21, 'Configuration Manager', '', 0, 0, '', 'Configuration', 'com_config', 0, '', 1, '', 1),
(22, 'Installation Manager', '', 0, 0, '', 'Installer', 'com_installer', 0, '', 1, '', 1),
(23, 'Language Manager', '', 0, 0, '', 'Languages', 'com_languages', 0, '', 1, 'administrator=pl-PL\nsite=pl-PL', 1),
(24, 'Mass mail', '', 0, 0, '', 'Mass Mail', 'com_massmail', 0, '', 1, 'mailSubjectPrefix=\nmailBodySuffix=\n\n', 1),
(25, 'Menu Editor', '', 0, 0, '', 'Menu Editor', 'com_menus', 0, '', 1, '', 1),
(27, 'Messaging', '', 0, 0, '', 'Messages', 'com_messages', 0, '', 1, '', 1),
(28, 'Modules Manager', '', 0, 0, '', 'Modules', 'com_modules', 0, '', 1, '', 1),
(29, 'Plugin Manager', '', 0, 0, '', 'Plugins', 'com_plugins', 0, '', 1, '', 1),
(30, 'Template Manager', '', 0, 0, '', 'Templates', 'com_templates', 0, '', 1, '', 1),
(31, 'User Manager', '', 0, 0, '', 'Users', 'com_users', 0, '', 1, 'allowUserRegistration=0\nnew_usertype=Registered\nuseractivation=0\nfrontend_userparams=0\n\n', 1),
(32, 'Cache Manager', '', 0, 0, '', 'Cache', 'com_cache', 0, '', 1, '', 1),
(33, 'Control Panel', '', 0, 0, '', 'Control Panel', 'com_cpanel', 0, '', 1, '', 1),
(34, 'Attachments', 'option=com_attachments', 0, 0, 'option=com_attachments', 'Attachments', 'com_attachments', 0, 'components/com_attachments/attachments.png', 0, 'who_can_see=anyone\nwho_can_add=logged_in\npublish_default=1\nauto_publish_warning=\nshow_column_titles=1\nshow_description=1\nshow_file_size=1\nshow_downloads=1\nshow_modification_date=1\nmod_date_format=%x %H:%M\nsort_order=filename\nuser_field_1_name=\nuser_field_2_name=\nuser_field_3_name=\nmax_filename_length=0\nattachments_table_style=attachmentsList\nfile_link_open_mode=in_same_window\nprepend=article_id\nattachments_subdir=attachments\nattachments_titles=\nhide_attachments_for=\nsecure=0\ndownload_mode=inline\nregister_url=index.php?option=com_user&task=register\n\n', 1),
(35, 'Phoca Gallery', 'option=com_phocagallery', 0, 0, 'option=com_phocagallery', 'Phoca Gallery', 'com_phocagallery', 0, 'components/com_phocagallery/assets/images/icon-16-pg-menu.png', 0, 'categories_columns=1\nequal_percentage_width=1\ndisplay_image_categories=1\ncategories_box_width=33%\nimage_categories_size=4\ncategories_image_ordering=9\ncategories_display_avatar=0\ndisplay_subcategories=1\ndisplay_empty_categories=0\nhide_categories=\nshow_categories=\ndisplay_access_category=0\ndefault_pagination_categories=0\npagination_categories=5;10;15;20;50\nfont_color=#b36b00\nbackground_color=#fcfcfc\nbackground_color_hover=#f5f5f5\nimage_background_color=#f5f5f5\nimage_background_shadow=shadow1\nborder_color=#e8e8e8\nborder_color_hover=#b36b00\nmargin_box=5\npadding_box=5\ndisplay_name=1\ndisplay_icon_detail=1\ndisplay_icon_download=0\ndisplay_icon_folder=0\nfont_size_name=12\nchar_length_name=15\ncategory_box_space=0\ndisplay_categories_sub=0\ndisplay_subcat_page=0\ndisplay_category_icon_image=0\ncategory_image_ordering=9\ndisplay_back_button=1\ndisplay_categories_back_button=1\ndefault_pagination_category=20\npagination_category=5;10;15;20;50\ndisplay_img_desc_box=0\nfont_size_img_desc=10\nimg_desc_box_height=30\nchar_length_img_desc=300\ndisplay_categories_cv=0\ndisplay_subcat_page_cv=0\ndisplay_category_icon_image_cv=0\ncategory_image_ordering_cv=9\ndisplay_back_button_cv=1\ndisplay_categories_back_button_cv=1\ncategories_columns_cv=1\ndisplay_image_categories_cv=1\nimage_categories_size_cv=4\ndetail_window=0\ndetail_window_background_color=#ffffff\nmodal_box_overlay_color=#000000\nmodal_box_overlay_opacity=0.3\nmodal_box_border_color=#6b6b6b\nmodal_box_border_width=2\nsb_slideshow_delay=5\nsb_lang=en\nhighslide_class=rounded-white\nhighslide_opacity=0\nhighslide_outline_type=rounded-white\nhighslide_fullimg=0\nhighslide_close_button=0\nhighslide_slideshow=1\njak_slideshow_delay=5\njak_orientation=none\njak_description=1\njak_description_height=10\ndisplay_description_detail=0\ndisplay_title_description=0\nfont_size_desc=11\nfont_color_desc=#333333\ndescription_detail_height=16\ndescription_lightbox_font_size=12\ndescription_lightbox_font_color=#ffffff\ndescription_lightbox_bg_color=#000000\nslideshow_delay=3000\nslideshow_pause=0\nslideshow_random=0\ndetail_buttons=1\nphocagallery_width=\nphocagallery_center=0\ncategory_ordering=1\nimage_ordering=1\ngallery_metadesc=\ngallery_metakey=\nalt_value=1\nenable_user_cp=0\nenable_upload_avatar=1\nenable_avatar_approve=0\nenable_usercat_approve=0\nenable_usersubcat_approve=0\nuser_subcat_count=5\nmax_create_cat_char=1000\nenable_userimage_approve=0\nmax_upload_char=1000\nupload_maxsize=3145728\nupload_maxres_width=3072\nupload_maxres_height=2304\nuser_images_max_size=20971520\nenable_java=0\nenable_java_admin=1\njava_resize_width=-1\njava_resize_height=-1\njava_box_width=480\njava_box_height=480\ndisplay_rating=0\ndisplay_rating_img=0\ndisplay_comment=0\ndisplay_comment_img=0\ncomment_width=500\nmax_comment_char=1000\nexternal_comment_system=0\nenable_piclens=0\nstart_piclens=0\npiclens_image=1\nswitch_image=0\nswitch_width=640\nswitch_height=480\nswitch_fixed_size=0\nenable_overlib=0\nol_bg_color=#666666\nol_fg_color=#f6f6f6\nol_tf_color=#000000\nol_cf_color=#ffffff\noverlib_overlay_opacity=0.7\noverlib_image_rate=\ncreate_watermark=0\nwatermark_position_x=center\nwatermark_position_y=middle\ndisplay_icon_vm=0\ndisplay_category_statistics=0\ndisplay_main_cat_stat=1\ndisplay_lastadded_cat_stat=1\ncount_lastadded_cat_stat=3\ndisplay_mostviewed_cat_stat=1\ncount_mostviewed_cat_stat=3\ndisplay_camera_info=0\nexif_information=FILE.FileName;FILE.FileDateTime;FILE.FileSize;FILE.MimeType;COMPUTED.Height;COMPUTED.Width;COMPUTED.IsColor;COMPUTED.ApertureFNumber;IFD0.Make;IFD0.Model;IFD0.Orientation;IFD0.XResolution;IFD0.YResolution;IFD0.ResolutionUnit;IFD0.Software;IFD0.DateTime;IFD0.Exif_IFD_Pointer;IFD0.GPS_IFD_Pointer;EXIF.ExposureTime;EXIF.FNumber;EXIF.ExposureProgram;EXIF.ISOSpeedRatings;EXIF.ExifVersion;EXIF.DateTimeOriginal;EXIF.DateTimeDigitized;EXIF.ShutterSpeedValue;EXIF.ApertureValue;EXIF.ExposureBiasValue;EXIF.MaxApertureValue;EXIF.MeteringMode;EXIF.LightSource;EXIF.Flash;EXIF.FocalLength;EXIF.SubSecTimeOriginal;EXIF.SubSecTimeDigitized;EXIF.ColorSpace;EXIF.ExifImageWidth;EXIF.ExifImageLength;EXIF.SensingMethod;EXIF.CustomRendered;EXIF.ExposureMode;EXIF.WhiteBalance;EXIF.DigitalZoomRatio;EXIF.FocalLengthIn35mmFilm;EXIF.SceneCaptureType;EXIF.GainControl;EXIF.Contrast;EXIF.Saturation;EXIF.Sharpness;EXIF.SubjectDistanceRange;GPS.GPSLatitudeRef;GPS.GPSLatitude;GPS.GPSLongitudeRef;GPS.GPSLongitude;GPS.GPSAltitudeRef;GPS.GPSAltitude;GPS.GPSTimeStamp;GPS.GPSStatus;GPS.GPSMapDatum;GPS.GPSDateStamp\ndisplay_categories_geotagging=0\ncategories_lng=\ncategories_lat=\ncategories_zoom=2\ncategories_map_width=\ncategories_map_height=500\ndisplay_icon_geotagging=0\ndisplay_category_geotagging=0\ncategory_map_width=\ncategory_map_height=400\npagination_thumbnail_creation=0\nclean_thumbnails=0\nenable_thumb_creation=1\ncrop_thumbnail=5\njpeg_quality=85\nenable_picasa_loading=1\npicasa_load_pagination=20\nicon_format=gif\nlarge_image_width=640\nlarge_image_height=480\nmedium_image_width=100\nmedium_image_height=100\nsmall_image_width=50\nsmall_image_height=50\nfront_modal_box_width=680\nfront_modal_box_height=560\nadmin_modal_box_width=680\nadmin_modal_box_height=520\nfolder_permissions=0755\njfile_thumbs=1\n\n', 1),
(36, 'Control Panel', '', 0, 35, 'option=com_phocagallery', 'Control Panel', 'com_phocagallery', 0, 'components/com_phocagallery/assets/images/icon-16-pg-control-panel.png', 0, '', 1),
(37, 'Images', '', 0, 35, 'option=com_phocagallery&view=phocagallerys', 'Images', 'com_phocagallery', 1, 'components/com_phocagallery/assets/images/icon-16-pg-menu-gal.png', 0, '', 1),
(38, 'Categories', '', 0, 35, 'option=com_phocagallery&view=phocagallerycs', 'Categories', 'com_phocagallery', 2, 'components/com_phocagallery/assets/images/icon-16-pg-menu-cat.png', 0, '', 1),
(39, 'Themes', '', 0, 35, 'option=com_phocagallery&view=phocagalleryt', 'Themes', 'com_phocagallery', 3, 'components/com_phocagallery/assets/images/icon-16-pg-menu-theme.png', 0, '', 1),
(40, 'Category Rating', '', 0, 35, 'option=com_phocagallery&view=phocagalleryra', 'Category Rating', 'com_phocagallery', 4, 'components/com_phocagallery/assets/images/icon-16-pg-menu-vote.png', 0, '', 1),
(41, 'Image Rating', '', 0, 35, 'option=com_phocagallery&view=phocagalleryraimg', 'Image Rating', 'com_phocagallery', 5, 'components/com_phocagallery/assets/images/icon-16-pg-menu-vote-img.png', 0, '', 1),
(42, 'Category Comments', '', 0, 35, 'option=com_phocagallery&view=phocagallerycos', 'Category Comments', 'com_phocagallery', 6, 'components/com_phocagallery/assets/images/icon-16-pg-menu-comment.png', 0, '', 1),
(43, 'Image Comments', '', 0, 35, 'option=com_phocagallery&view=phocagallerycoimgs', 'Image Comments', 'com_phocagallery', 7, 'components/com_phocagallery/assets/images/icon-16-pg-menu-comment-img.png', 0, '', 1),
(44, 'Users', '', 0, 35, 'option=com_phocagallery&view=phocagalleryusers', 'Users', 'com_phocagallery', 8, 'components/com_phocagallery/assets/images/icon-16-pg-menu-users.png', 0, '', 1),
(45, 'Info', '', 0, 35, 'option=com_phocagallery&view=phocagalleryin', 'Info', 'com_phocagallery', 9, 'components/com_phocagallery/assets/images/icon-16-pg-menu-info.png', 0, '', 1),
(46, 'JoomlaStats', 'option=com_joomlastats', 0, 0, 'option=com_joomlastats', 'JoomlaStats', 'com_joomlastats', 0, '../administrator/components/com_joomlastats/images/icon-16-js_js-logo.png', 0, '', 1),
(47, 'Joom!Fish', 'option=com_joomfish', 0, 0, 'option=com_joomfish', 'Joom!Fish', 'com_joomfish', 0, 'components/com_joomfish/assets/images/icon-16-joomfish.png', 0, 'noTranslation=2\ndefaultText=\noverwriteGlobalConfig=1\nstorageOfOriginal=md5\nfrontEndPublish=1\nfrontEndPreview=1\nshowPanelNews=1\nshowPanelUnpublished=1\nshowPanelState=1\ncopyparams=1\ntranscaching=0\ncachelife=180\nqacaching=1\nqalogging=0\n', 1),
(48, 'Control Panel', '', 0, 47, 'option=com_joomfish', 'Control Panel', 'com_joomfish', 0, 'components/com_joomfish/assets/images/icon-16-cpanel.png', 0, '', 1),
(49, 'Translation', '', 0, 47, 'option=com_joomfish&task=translate.overview', 'Translation', 'com_joomfish', 1, 'components/com_joomfish/assets/images/icon-16-translation.png', 0, '', 1),
(50, 'Orphan Translations', '', 0, 47, 'option=com_joomfish&task=translate.orphans', 'Orphan Translations', 'com_joomfish', 2, 'components/com_joomfish/assets/images/icon-16-orphan.png', 0, '', 1),
(51, 'Manage Translations', '', 0, 47, 'option=com_joomfish&task=manage.overview', 'Manage Translations', 'com_joomfish', 3, 'components/com_joomfish/assets/images/icon-16-manage.png', 0, '', 1),
(52, 'Statistics', '', 0, 47, 'option=com_joomfish&task=statistics.overview', 'Statistics', 'com_joomfish', 4, 'components/com_joomfish/assets/images/icon-16-statistics.png', 0, '', 1),
(53, '', '', 0, 47, 'option=com_joomfish', '', 'com_joomfish', 5, 'components/com_joomfish/assets/images/icon-10-blank.png', 0, '', 1),
(54, 'Languages', '', 0, 47, 'option=com_joomfish&task=languages.show', 'Languages', 'com_joomfish', 6, 'components/com_joomfish/assets/images/icon-16-language.png', 0, '', 1),
(55, 'Content elements', '', 0, 47, 'option=com_joomfish&task=elements.show', 'Content elements', 'com_joomfish', 7, 'components/com_joomfish/assets/images/icon-16-extension.png', 0, '', 1),
(56, 'Plugins', '', 0, 47, 'option=com_joomfish&task=plugin.show', 'Plugins', 'com_joomfish', 8, 'components/com_joomfish/assets/images/icon-16-plugin.png', 0, '', 1),
(57, '', '', 0, 47, 'option=com_joomfish', '', 'com_joomfish', 9, 'components/com_joomfish/assets/images/icon-10-blank.png', 0, '', 1),
(58, 'Help', '', 0, 47, 'option=com_joomfish&task=help.show', 'Help', 'com_joomfish', 10, 'components/com_joomfish/assets/images/icon-16-help.png', 0, '', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_contact_details`
--

DROP TABLE IF EXISTS `jos_contact_details`;
CREATE TABLE IF NOT EXISTS `jos_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Zrzut danych tabeli `jos_contact_details`
--

INSERT INTO `jos_contact_details` (`id`, `name`, `alias`, `con_position`, `address`, `suburb`, `state`, `country`, `postcode`, `telephone`, `fax`, `misc`, `image`, `imagepos`, `email_to`, `default_con`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`, `user_id`, `catid`, `access`, `mobile`, `webpage`) VALUES
(1, 'Kontakt - zmien e-mail', 'kontakt-zmien-e-mail', '', '', '', '', '', '', '', '', '', '', NULL, 'root@localhost.com', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=0\nshow_position=0\nshow_email=0\nshow_street_address=0\nshow_suburb=0\nshow_state=0\nshow_postcode=0\nshow_country=0\nshow_telephone=0\nshow_mobile=0\nshow_fax=0\nshow_webpage=0\nshow_misc=0\nshow_image=0\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 62, 1, 0, '', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_content`
--

DROP TABLE IF EXISTS `jos_content`;
CREATE TABLE IF NOT EXISTS `jos_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `title_alias` varchar(255) NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(11) unsigned NOT NULL DEFAULT '0',
  `mask` int(11) unsigned NOT NULL DEFAULT '0',
  `catid` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` text NOT NULL,
  `version` int(11) unsigned NOT NULL DEFAULT '1',
  `parentid` int(11) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_section` (`sectionid`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Zrzut danych tabeli `jos_content`
--

INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(1, 'O nas', 'o-nas', '', '<p>w budowie</p>', '', 1, 0, 0, 0, '2010-06-08 10:23:08', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2010-06-08 10:23:08', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 2, '', '', 0, 0, 'robots=\nauthor='),
(2, 'Współpraca', 'wspopraca', '', '<p>w budowie</p>', '', 1, 0, 0, 0, '2010-06-08 10:30:24', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2010-06-08 10:30:24', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 1, '', '', 0, 2, 'robots=\nauthor=');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_content_frontpage`
--

DROP TABLE IF EXISTS `jos_content_frontpage`;
CREATE TABLE IF NOT EXISTS `jos_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jos_content_frontpage`
--

INSERT INTO `jos_content_frontpage` (`content_id`, `ordering`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_content_rating`
--

DROP TABLE IF EXISTS `jos_content_rating`;
CREATE TABLE IF NOT EXISTS `jos_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(11) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(11) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jos_content_rating`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_core_acl_aro`
--

DROP TABLE IF EXISTS `jos_core_acl_aro`;
CREATE TABLE IF NOT EXISTS `jos_core_acl_aro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_value` varchar(240) NOT NULL DEFAULT '0',
  `value` varchar(240) NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jos_section_value_value_aro` (`section_value`(100),`value`(100)),
  KEY `jos_gacl_hidden_aro` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Zrzut danych tabeli `jos_core_acl_aro`
--

INSERT INTO `jos_core_acl_aro` (`id`, `section_value`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', '62', 0, 'Administrator', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_core_acl_aro_groups`
--

DROP TABLE IF EXISTS `jos_core_acl_aro_groups`;
CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `jos_gacl_parent_id_aro_groups` (`parent_id`),
  KEY `jos_gacl_lft_rgt_aro_groups` (`lft`,`rgt`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Zrzut danych tabeli `jos_core_acl_aro_groups`
--

INSERT INTO `jos_core_acl_aro_groups` (`id`, `parent_id`, `name`, `lft`, `rgt`, `value`) VALUES
(17, 0, 'ROOT', 1, 22, 'ROOT'),
(28, 17, 'USERS', 2, 21, 'USERS'),
(29, 28, 'Public Frontend', 3, 12, 'Public Frontend'),
(18, 29, 'Registered', 4, 11, 'Registered'),
(19, 18, 'Author', 5, 10, 'Author'),
(20, 19, 'Editor', 6, 9, 'Editor'),
(21, 20, 'Publisher', 7, 8, 'Publisher'),
(30, 28, 'Public Backend', 13, 20, 'Public Backend'),
(23, 30, 'Manager', 14, 19, 'Manager'),
(24, 23, 'Administrator', 15, 18, 'Administrator'),
(25, 24, 'Super Administrator', 16, 17, 'Super Administrator');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_core_acl_aro_map`
--

DROP TABLE IF EXISTS `jos_core_acl_aro_map`;
CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_map` (
  `acl_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(230) NOT NULL DEFAULT '0',
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`acl_id`,`section_value`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jos_core_acl_aro_map`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_core_acl_aro_sections`
--

DROP TABLE IF EXISTS `jos_core_acl_aro_sections`;
CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(230) NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(230) NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jos_gacl_value_aro_sections` (`value`),
  KEY `jos_gacl_hidden_aro_sections` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Zrzut danych tabeli `jos_core_acl_aro_sections`
--

INSERT INTO `jos_core_acl_aro_sections` (`id`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', 1, 'Users', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_core_acl_groups_aro_map`
--

DROP TABLE IF EXISTS `jos_core_acl_groups_aro_map`;
CREATE TABLE IF NOT EXISTS `jos_core_acl_groups_aro_map` (
  `group_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(240) NOT NULL DEFAULT '',
  `aro_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `group_id_aro_id_groups_aro_map` (`group_id`,`section_value`,`aro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jos_core_acl_groups_aro_map`
--

INSERT INTO `jos_core_acl_groups_aro_map` (`group_id`, `section_value`, `aro_id`) VALUES
(25, '', 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_core_log_items`
--

DROP TABLE IF EXISTS `jos_core_log_items`;
CREATE TABLE IF NOT EXISTS `jos_core_log_items` (
  `time_stamp` date NOT NULL DEFAULT '0000-00-00',
  `item_table` varchar(50) NOT NULL DEFAULT '',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jos_core_log_items`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_core_log_searches`
--

DROP TABLE IF EXISTS `jos_core_log_searches`;
CREATE TABLE IF NOT EXISTS `jos_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jos_core_log_searches`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_dbcache`
--

DROP TABLE IF EXISTS `jos_dbcache`;
CREATE TABLE IF NOT EXISTS `jos_dbcache` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `groupname` varchar(32) NOT NULL DEFAULT '',
  `expire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `value` mediumblob NOT NULL,
  PRIMARY KEY (`id`,`groupname`),
  KEY `expire` (`expire`,`groupname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jos_dbcache`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_groups`
--

DROP TABLE IF EXISTS `jos_groups`;
CREATE TABLE IF NOT EXISTS `jos_groups` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jos_groups`
--

INSERT INTO `jos_groups` (`id`, `name`) VALUES
(0, 'Public'),
(1, 'Registered'),
(2, 'Special');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_jf_content`
--

DROP TABLE IF EXISTS `jos_jf_content`;
CREATE TABLE IF NOT EXISTS `jos_jf_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `reference_id` int(11) NOT NULL DEFAULT '0',
  `reference_table` varchar(100) NOT NULL DEFAULT '',
  `reference_field` varchar(100) NOT NULL DEFAULT '',
  `value` mediumtext NOT NULL,
  `original_value` varchar(255) DEFAULT NULL,
  `original_text` mediumtext NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `combo` (`reference_id`,`reference_field`,`reference_table`),
  KEY `jfContent` (`language_id`,`reference_id`,`reference_table`),
  KEY `jfContentLanguage` (`reference_id`,`reference_field`,`reference_table`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `jos_jf_content`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_jf_tableinfo`
--

DROP TABLE IF EXISTS `jos_jf_tableinfo`;
CREATE TABLE IF NOT EXISTS `jos_jf_tableinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joomlatablename` varchar(100) NOT NULL DEFAULT '',
  `tablepkID` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `jos_jf_tableinfo`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_jstats_browsers`
--

DROP TABLE IF EXISTS `jos_jstats_browsers`;
CREATE TABLE IF NOT EXISTS `jos_jstats_browsers` (
  `browser_id` smallint(5) unsigned NOT NULL,
  `browsertype_id` tinyint(3) unsigned NOT NULL,
  `browser_key` varchar(50) NOT NULL,
  `browser_name` varchar(50) NOT NULL,
  `browser_img` varchar(12) NOT NULL DEFAULT 'noimage',
  PRIMARY KEY (`browser_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jos_jstats_browsers`
--

INSERT INTO `jos_jstats_browsers` (`browser_id`, `browsertype_id`, `browser_key`, `browser_name`, `browser_img`) VALUES
(0, 0, '', 'Unknown', 'unknown'),
(1, 0, 'unknown internet browser', 'Unknown Internet Browser', 'unknown'),
(2, 1, 'msie', 'Internet Explorer', 'explorer'),
(3, 2, 'firefox', 'FireFox', 'firefox'),
(4, 5, 'chrome', 'Google Chrome', 'chrome'),
(5, 3, 'opera', 'Opera', 'opera'),
(6, 5, 'netscape', 'Netscape', 'netscape'),
(7, 5, 'icab', 'iCab', 'noimage'),
(8, 5, 'konqueror', 'Konqueror', 'konqueror'),
(9, 5, 'links', 'Links', 'noimage'),
(10, 5, 'lynx', 'Lynx', 'noimage'),
(11, 5, 'omniweb', 'OmniWeb', 'omniweb'),
(12, 5, 'safari', 'Safari', 'safari'),
(13, 5, 'wget', 'Wget', 'noimage'),
(14, 5, 'aol-iweng', 'AOL-Iweng', 'noimage'),
(15, 5, 'amaya', 'Amaya', 'noimage'),
(16, 5, 'amigavoyager', 'AmigaVoyager', 'noimage'),
(17, 5, 'aweb', 'AWeb', 'noimage'),
(18, 5, 'bpftp', 'BPFTP', 'noimage'),
(19, 5, 'cyberdog', 'Cyberdog', 'noimage'),
(20, 5, 'dreamcast', 'Dreamcast', 'noimage'),
(21, 5, 'downloadagent', 'DownloadAgent', 'noimage'),
(22, 5, 'ecatch', 'eCatch', 'noimage'),
(23, 5, 'emailsiphon', 'EmailSiphon', 'noimage'),
(24, 5, 'encompass', 'Encompass', 'noimage'),
(25, 5, 'friendlyspider', 'FriendlySpider', 'noimage'),
(26, 5, 'fresco', 'ANT Fresco', 'noimage'),
(27, 5, 'galeon', 'Galeon', 'noimage'),
(28, 5, 'getright', 'GetRight', 'noimage'),
(29, 5, 'headdump', 'HeadDump', 'noimage'),
(30, 5, 'hotjava', 'Sun HotJava', 'noimage'),
(31, 5, 'ibrowse', 'IBrowse', 'noimage'),
(32, 5, 'intergo', 'InterGO', 'noimage'),
(33, 5, 'linemodebrowser', 'W3C Line Mode Browser', 'noimage'),
(34, 5, 'lotus-notes', 'Lotus Notes web client', 'noimage'),
(35, 5, 'macweb', 'MacWeb', 'noimage'),
(36, 5, 'ncsa_mosaic', 'NCSA Mosaic', 'noimage'),
(37, 5, 'netpositive', 'NetPositive', 'noimage'),
(38, 5, 'nutscrape', 'Nutscrape', 'noimage'),
(39, 5, 'msfrontpageexpress', 'MS FrontPage Express', 'noimage'),
(40, 5, 'phoenix', 'Phoenix', 'noimage'),
(41, 5, 'tzgeturl', 'TzGetURL', 'noimage'),
(42, 5, 'viking', 'Viking', 'noimage'),
(43, 5, 'webfetcher', 'WebFetcher', 'noimage'),
(44, 5, 'webexplorer', 'IBM-WebExplorer', 'noimage'),
(45, 5, 'webmirror', 'WebMirror', 'noimage'),
(46, 5, 'webvcr', 'WebVCR', 'noimage'),
(47, 5, 'teleport', 'TelePort Pro', 'noimage'),
(48, 5, 'webcapture', 'Acrobat', 'noimage'),
(49, 5, 'webcopier', 'WebCopier', 'noimage'),
(50, 5, 'real', 'RealAudio or compatible (media player)', 'noimage'),
(51, 5, 'winamp', 'WinAmp (media player)', 'noimage'),
(52, 5, 'windows-media-player', 'Windows Media Player (media player)', 'noimage'),
(53, 5, 'audion', 'Audion (media player)', 'noimage'),
(54, 5, 'freeamp', 'FreeAmp (media player)', 'noimage'),
(55, 5, 'itunes', 'Apple iTunes (media player)', 'noimage'),
(56, 5, 'jetaudio', 'JetAudio (media player)', 'noimage'),
(57, 5, 'mint_audio', 'Mint Audio (media player)', 'noimage'),
(58, 5, 'mpg123', 'mpg123 (media player)', 'noimage'),
(59, 5, 'nsplayer', 'NetShow Player (media player)', 'noimage'),
(60, 5, 'sonique', 'Sonique (media player)', 'noimage'),
(61, 5, 'uplayer', 'Ultra Player (media player)', 'noimage'),
(62, 5, 'xmms', 'XMMS (media player)', 'noimage'),
(63, 5, 'xaudio', 'Some XAudio Engine based MPEG player (media player', 'noimage'),
(64, 4, 'mmef', 'Microsoft Mobile Explorer (PDA/Phone browser)', 'noimage'),
(65, 4, 'mspie', 'MS Pocket Internet Explorer (PDA/Phone browser)', 'noimage'),
(66, 4, 'wapalizer', 'WAPalizer (PDA/Phone browser)', 'noimage'),
(67, 4, 'wapsilon', 'WAPsilon (PDA/Phone browser)', 'noimage'),
(68, 4, 'webcollage', 'WebCollage (PDA/Phone browser)', 'noimage'),
(69, 4, 'alcatel', 'Alcatel Browser (PDA/Phone browser)', 'noimage'),
(70, 4, 'nokia', 'Nokia Browser (PDA/Phone browser)', 'noimage'),
(71, 5, 'webtv', 'WebTV browser', 'noimage'),
(72, 5, 'w3m', 'w3m', 'noimage'),
(73, 5, 'webzip', 'WebZIP', 'noimage'),
(74, 5, 'staroffice', 'StarOffice', 'noimage'),
(75, 5, 'libwww', 'LibWWW', 'noimage'),
(76, 5, 'httrack', 'HTTrack (offline browser utility)', 'noimage'),
(77, 5, 'webstripper', 'webstripper (offline browser)', 'noimage'),
(78, 5, 'avant browser', 'Avant Browser', 'avant'),
(79, 5, 'firebird', 'firebird', 'firebird'),
(80, 5, 'avantgo', 'avantgo', 'noimage'),
(81, 5, 'navio_aoltv', 'navio aoltv', 'noimage'),
(82, 5, 'go!zilla', 'Go!Zilla', 'noimage'),
(83, 5, '22acidownload', '22AciDownload', 'noimage'),
(84, 5, 'gecko', 'Mozilla', 'gecko'),
(1024, 0, 'unknown bot', 'Unknown Bot', 'unknown'),
(1025, 0, 'acme.spider', 'Acme Spider', 'noimage'),
(1026, 0, 'ahoythehomepagefinder', 'Ahoy! The Homepage Finder', 'noimage'),
(1027, 0, 'alkaline', 'Alkaline', 'noimage'),
(1028, 0, 'appie', 'Walhello appie', 'noimage'),
(1029, 0, 'arachnophilia', 'Arachnophilia', 'noimage'),
(1030, 0, 'architext', 'ArchitextSpider', 'noimage'),
(1031, 0, 'aretha', 'Aretha', 'noimage'),
(1032, 0, 'ariadne', 'ARIADNE', 'noimage'),
(1033, 0, 'arks', 'arks', 'noimage'),
(1034, 0, 'aspider', 'ASpider (Associative Spider)', 'noimage'),
(1035, 0, 'atn.txt', 'ATN Worldwide', 'noimage'),
(1036, 0, 'atomz', 'Atomz.com Search Robot', 'noimage'),
(1037, 0, 'auresys', 'AURESYS', 'noimage'),
(1038, 0, 'backrub', 'BackRub', 'noimage'),
(1039, 0, 'biUKrother', 'Big Brother', 'noimage'),
(1040, 0, 'bjaaland', 'Bjaaland', 'noimage'),
(1041, 0, 'blackwidow', 'BlackWidow', 'noimage'),
(1042, 0, 'blindekuh', 'Die Blinde Kuh', 'noimage'),
(1043, 0, 'bloodhound', 'Bloodhound', 'noimage'),
(1044, 0, 'brightnet', 'bright.net caching robot', 'noimage'),
(1045, 0, 'bspider', 'BSpider', 'noimage'),
(1046, 0, 'cactvschemistryspider', 'CACTVS Chemistry Spider', 'noimage'),
(1047, 0, 'calif[^r]', 'Calif', 'noimage'),
(1048, 0, 'cassandra', 'Cassandra', 'noimage'),
(1049, 0, 'cgireader', 'Digimarc Marcspider/CGI', 'noimage'),
(1050, 0, 'checkbot', 'Checkbot', 'noimage'),
(1051, 0, 'churl', 'churl', 'noimage'),
(1052, 0, 'cmc', 'CMC/0.01', 'noimage'),
(1053, 0, 'collective', 'Collective', 'noimage'),
(1054, 0, 'combine', 'Combine System', 'noimage'),
(1055, 0, 'conceptbot', 'Conceptbot', 'noimage'),
(1056, 0, 'coolbot', 'CoolBot', 'noimage'),
(1057, 0, 'core', 'Web Core / Roots', 'noimage'),
(1058, 0, 'cosmos', 'XYLEME Robot', 'noimage'),
(1059, 0, 'cruiser', 'Internet Cruiser Robot', 'noimage'),
(1060, 0, 'cusco', 'Cusco', 'noimage'),
(1061, 0, 'cyberspyder', 'CyberSpyder Link Test', 'noimage'),
(1062, 0, 'deweb', 'DeWeb(c) Katalog/Index', 'noimage'),
(1063, 0, 'dienstspider', 'DienstSpider', 'noimage'),
(1064, 0, 'digger', 'Digger', 'noimage'),
(1065, 0, 'diibot', 'Digital Integrity Robot', 'noimage'),
(1066, 0, 'directhit', 'Direct Hit Grabber', 'noimage'),
(1067, 0, 'dnabot', 'DNAbot', 'noimage'),
(1068, 0, 'download_express', 'DownLoad Express', 'noimage'),
(1069, 0, 'dragonbot', 'DragonBot', 'noimage'),
(1070, 0, 'dwcp', 'DWCP (Dridus Web Cataloging Project)', 'noimage'),
(1071, 0, 'e-collector', 'e-collector', 'noimage'),
(1072, 0, 'ebiness', 'EbiNess', 'noimage'),
(1073, 0, 'eit', 'EIT Link Verifier Robot', 'noimage'),
(1074, 0, 'elfinbot', 'ELFINBOT', 'noimage'),
(1075, 0, 'emacs', 'Emacs-w3 Search Engine', 'noimage'),
(1076, 0, 'emcspider', 'ananzi', 'noimage'),
(1077, 0, 'esther', 'Esther', 'noimage'),
(1078, 0, 'evliyacelebi', 'Evliya Celebi', 'noimage'),
(1079, 0, 'nzexplorer', 'nzexplorer', 'noimage'),
(1080, 0, 'fdse', 'Fluid Dynamics Search Engine robot', 'noimage'),
(1081, 0, 'felix', 'Felix IDE', 'noimage'),
(1082, 0, 'ferret', 'Wild Ferret Web Hopper #1, #2, #3', 'noimage'),
(1083, 0, 'fetchrover', 'FetchRover', 'noimage'),
(1084, 0, 'fido', 'fido', 'noimage'),
(1085, 0, 'finnish', 'Hmhkki', 'noimage'),
(1086, 0, 'fireball', 'KIT-Fireball', 'noimage'),
(1087, 0, '[^a]fish', 'Fish search', 'noimage'),
(1088, 0, 'fouineur', 'Fouineur', 'noimage'),
(1089, 0, 'francoroute', 'Robot Francoroute', 'noimage'),
(1090, 0, 'freecrawl', 'Freecrawl', 'noimage'),
(1091, 0, 'funnelweb', 'FunnelWeb', 'noimage'),
(1092, 0, 'gama', 'gammaSpider, FocusedCrawler', 'noimage'),
(1093, 0, 'gazz', 'gazz', 'noimage'),
(1094, 0, 'gcreep', 'GCreep', 'noimage'),
(1095, 0, 'getbot', 'GetBot', 'noimage'),
(1096, 0, 'geturl', 'GetURL', 'noimage'),
(1097, 0, 'golem', 'Golem', 'noimage'),
(1098, 0, 'googlebot', 'Googlebot (Google)', 'noimage'),
(1099, 0, 'grapnel', 'Grapnel/0.01 Experiment', 'noimage'),
(1100, 0, 'griffon', 'Griffon', 'noimage'),
(1101, 0, 'gromit', 'Gromit', 'noimage'),
(1102, 0, 'gulliver', 'Northern Light Gulliver', 'noimage'),
(1103, 0, 'hambot', 'HamBot', 'noimage'),
(1104, 0, 'harvest', 'Harvest', 'noimage'),
(1105, 0, 'havindex', 'havIndex', 'noimage'),
(1106, 0, 'hometown', 'Hometown Spider Pro', 'noimage'),
(1107, 0, 'htdig', 'ht://Dig', 'noimage'),
(1108, 0, 'htmlgobble', 'HTMLgobble', 'noimage'),
(1109, 0, 'hyperdecontextualizer', 'Hyper-Decontextualizer', 'noimage'),
(1110, 0, 'iajabot', 'iajaBot', 'noimage'),
(1111, 0, 'ibm', 'IBM_Planetwide', 'noimage'),
(1112, 0, 'iconoclast', 'Popular Iconoclast', 'noimage'),
(1113, 0, 'ilse', 'Ingrid', 'noimage'),
(1114, 0, 'imagelock', 'Imagelock', 'noimage'),
(1115, 0, 'incywincy', 'IncyWincy', 'noimage'),
(1116, 0, 'informant', 'Informant', 'noimage'),
(1117, 0, 'infoseek', 'InfoSeek Robot 1.0', 'noimage'),
(1118, 0, 'infoseeksidewinder', 'Infoseek Sidewinder', 'noimage'),
(1119, 0, 'infospider', 'InfoSpiders', 'noimage'),
(1120, 0, 'inspectorwww', 'Inspector Web', 'noimage'),
(1121, 0, 'intelliagent', 'IntelliAgent', 'noimage'),
(1122, 0, 'irobot', 'I, Robot', 'noimage'),
(1123, 0, 'iron33', 'Iron33', 'noimage'),
(1124, 0, 'israelisearch', 'Israeli-search', 'noimage'),
(1125, 0, 'javabee', 'JavaBee', 'noimage'),
(1126, 0, 'jbot', 'JBot Java Web Robot', 'noimage'),
(1127, 0, 'jcrawler', 'JCrawler', 'noimage'),
(1128, 0, 'jeeves', 'Jeeves', 'noimage'),
(1129, 0, 'jobo', 'JoBo Java Web Robot', 'noimage'),
(1130, 0, 'jobot', 'Jobot', 'noimage'),
(1131, 0, 'joebot', 'JoeBot', 'noimage'),
(1132, 0, 'jubii', 'The Jubii Indexing Robot', 'noimage'),
(1133, 0, 'jumpstation', 'JumpStation', 'noimage'),
(1134, 0, 'katipo', 'Katipo', 'noimage'),
(1135, 0, 'kdd', 'KDD-Explorer', 'noimage'),
(1136, 0, 'kilroy', 'Kilroy', 'noimage'),
(1137, 0, 'ko_yappo_robot', 'KO_Yappo_Robot', 'noimage'),
(1138, 0, 'labelgrabber.txt', 'LabelGrabber', 'noimage'),
(1139, 0, 'larbin', 'larbin', 'noimage'),
(1140, 0, 'legs', 'legs', 'noimage'),
(1141, 0, 'linkidator', 'Link Validator', 'noimage'),
(1142, 0, 'linkscan', 'LinkScan', 'noimage'),
(1143, 0, 'linkwalker', 'LinkWalker', 'noimage'),
(1144, 0, 'lockon', 'Lockon', 'noimage'),
(1145, 0, 'logo_gif', 'logo.gif Crawler', 'noimage'),
(1146, 0, 'lycos', 'Lycos', 'noimage'),
(1147, 0, 'macworm', 'Mac WWWWorm', 'noimage'),
(1148, 0, 'magpie', 'Magpie', 'noimage'),
(1149, 0, 'marvin', 'marvin/infoseek', 'noimage'),
(1150, 0, 'mattie', 'Mattie', 'noimage'),
(1151, 0, 'mediafox', 'MediaFox', 'noimage'),
(1152, 0, 'merzscope', 'MerzScope', 'noimage'),
(1153, 0, 'meshexplorer', 'NEC-MeshExplorer', 'noimage'),
(1154, 0, 'mindcrawler', 'MindCrawler', 'noimage'),
(1155, 0, 'moget', 'moget', 'noimage'),
(1156, 0, 'momspider', 'MOMspider', 'noimage'),
(1157, 0, 'monster', 'Monster', 'noimage'),
(1158, 0, 'motor', 'Motor', 'noimage'),
(1159, 0, 'muscatferret', 'Muscat Ferret', 'noimage'),
(1160, 0, 'mwdsearch', 'Mwd.Search', 'noimage'),
(1161, 0, 'myweb', 'Internet Shinchakubin', 'noimage'),
(1162, 0, 'netcarta', 'NetCarta WebMap Engine', 'noimage'),
(1163, 0, 'netcraft', 'Netcraft Web Server Survey', 'noimage'),
(1164, 0, 'netmechanic', 'NetMechanic', 'noimage'),
(1165, 0, 'netscoop', 'NetScoop', 'noimage'),
(1166, 0, 'newscan-online', 'newscan-online', 'noimage'),
(1167, 0, 'nhse', 'NHSE Web Forager', 'noimage'),
(1168, 0, 'nomad', 'Nomad', 'noimage'),
(1169, 0, 'northstar', 'The NorthStar Robot', 'noimage'),
(1170, 0, 'occam', 'Occam', 'noimage'),
(1171, 0, 'octopus', 'HKU WWW Octopus', 'noimage'),
(1172, 0, 'openfind', 'Openfind data gatherer', 'noimage'),
(1173, 0, 'orb_search', 'Orb Search', 'noimage'),
(1174, 0, 'packrat', 'Pack Rat', 'noimage'),
(1175, 0, 'pageboy', 'PageBoy', 'noimage'),
(1176, 0, 'parasite', 'ParaSite', 'noimage'),
(1177, 0, 'patric', 'Patric', 'noimage'),
(1178, 0, 'pegasus', 'pegasus', 'noimage'),
(1179, 0, 'perignator', 'The Peregrinator', 'noimage'),
(1180, 0, 'perlcrawler', 'PerlCrawler 1.0', 'noimage'),
(1181, 0, 'phantom', 'Phantom', 'noimage'),
(1182, 0, 'piltdownman', 'PiltdownMan', 'noimage'),
(1183, 0, 'pimptrain', 'Pimptrain.com''s robot', 'noimage'),
(1184, 0, 'pioneer', 'Pioneer', 'noimage'),
(1185, 0, 'pitkow', 'html_analyzer', 'noimage'),
(1186, 0, 'pjspider', 'Portal Juice Spider', 'noimage'),
(1187, 0, 'pka', 'PGP Key Agent', 'noimage'),
(1188, 0, 'plumtreewebaccessor', 'PlumtreeWebAccessor', 'noimage'),
(1189, 0, 'poppi', 'Poppi', 'noimage'),
(1190, 0, 'portalb', 'PortalB Spider', 'noimage'),
(1191, 0, 'puu', 'GetterroboPlus Puu', 'noimage'),
(1192, 0, 'python', 'The Python Robot', 'noimage'),
(1193, 0, 'raven', 'Raven Search', 'noimage'),
(1194, 0, 'rbse', 'RBSE Spider', 'noimage'),
(1195, 0, 'resumerobot', 'Resume Robot', 'noimage'),
(1196, 0, 'rhcs', 'RoadHouse Crawling System', 'noimage'),
(1197, 0, 'roadrunner', 'Road Runner: The ImageScape Robot', 'noimage'),
(1198, 0, 'robbie', 'Robbie the Robot', 'noimage'),
(1199, 0, 'robi', 'ComputingSite Robi/1.0', 'noimage'),
(1200, 0, 'robofox', 'RoboFox', 'noimage'),
(1201, 0, 'robozilla', 'Robozilla', 'noimage'),
(1202, 0, 'roverbot', 'Roverbot', 'noimage'),
(1203, 0, 'rules', 'RuLeS', 'noimage'),
(1204, 0, 'safetynetrobot', 'SafetyNet Robot', 'noimage'),
(1205, 0, 'scooter', 'Scooter (AltaVista)', 'noimage'),
(1206, 0, 'search_au', 'Search.Aus-AU.COM', 'noimage'),
(1207, 0, 'searchprocess', 'SearchProcess', 'noimage'),
(1208, 0, 'senrigan', 'Senrigan', 'noimage'),
(1209, 0, 'sgscout', 'SG-Scout', 'noimage'),
(1210, 0, 'shaggy', 'ShagSeeker', 'noimage'),
(1211, 0, 'shaihulud', 'Shai''Hulud', 'noimage'),
(1212, 0, 'sift', 'Sift', 'noimage'),
(1213, 0, 'simbot', 'Simmany Robot Ver1.0', 'noimage'),
(1214, 0, 'site-valet', 'Site Valet', 'noimage'),
(1215, 0, 'sitegrabber', 'Open Text Index Robot', 'noimage'),
(1216, 0, 'sitetech', 'SiteTech-Rover', 'noimage'),
(1217, 0, 'slcrawler', 'SLCrawler', 'noimage'),
(1218, 0, 'slurp', 'Inktomi Slurp', 'noimage'),
(1219, 0, 'smartspider', 'Smart Spider', 'noimage'),
(1220, 0, 'snooper', 'Snooper', 'noimage'),
(1221, 0, 'solbot', 'Solbot', 'noimage'),
(1222, 0, 'spanner', 'Spanner', 'noimage'),
(1223, 0, 'speedy', 'Speedy Spider', 'noimage'),
(1224, 0, 'spider_monkey', 'spider_monkey', 'noimage'),
(1225, 0, 'spiderbot', 'SpiderBot', 'noimage'),
(1226, 0, 'spiderline', 'Spiderline Crawler', 'noimage'),
(1227, 0, 'spiderman', 'SpiderMan', 'noimage'),
(1228, 0, 'spiderview', 'SpiderView(tm)', 'noimage'),
(1229, 0, 'spry', 'Spry Wizard Robot', 'noimage'),
(1230, 0, 'ssearcher', 'Site Searcher', 'noimage'),
(1231, 0, 'suke', 'Suke', 'noimage'),
(1232, 0, 'suntek', 'suntek search engine', 'noimage'),
(1233, 0, 'sven', 'Sven', 'noimage'),
(1234, 0, 'tach_bw', 'TACH Black Widow', 'noimage'),
(1235, 0, 'tarantula', 'Tarantula', 'noimage'),
(1236, 0, 'tarspider', 'tarspider', 'noimage'),
(1237, 0, 'techbot', 'TechBOT', 'noimage'),
(1238, 0, 'templeton', 'Templeton', 'noimage'),
(1239, 0, 'teoma_agent1', 'TeomaTechnologies', 'noimage'),
(1240, 0, 'titin', 'TitIn', 'noimage'),
(1241, 0, 'titan', 'TITAN', 'noimage'),
(1242, 0, 'tkwww', 'The TkWWW Robot', 'noimage'),
(1243, 0, 'tlspider', 'TLSpider', 'noimage'),
(1244, 0, 'ucsd', 'UCSD Crawl', 'noimage'),
(1245, 0, 'udmsearch', 'UdmSearch', 'noimage'),
(1246, 0, 'urlck', 'URL Check', 'noimage'),
(1247, 0, 'valkyrie', 'Valkyrie', 'noimage'),
(1248, 0, 'victoria', 'Victoria', 'noimage'),
(1249, 0, 'visionsearch', 'vision-search', 'noimage'),
(1250, 0, 'voyager', 'Voyager', 'noimage'),
(1251, 0, 'vwbot', 'VWbot', 'noimage'),
(1252, 0, 'w3index', 'The NWI Robot', 'noimage'),
(1253, 0, 'w3m2', 'W3M2', 'noimage'),
(1254, 0, 'wallpaper', 'WallPaper', 'noimage'),
(1255, 0, 'wanderer', 'the World Wide Web Wanderer', 'noimage'),
(1256, 0, 'wapspider', 'w@pSpider by wap4.com', 'noimage'),
(1257, 0, 'webbandit', 'WebBandit Web Spider', 'noimage'),
(1258, 0, 'webcatcher', 'WebCatcher', 'noimage'),
(1259, 0, 'webcopy', 'WebCopy', 'noimage'),
(1260, 0, 'webfetcher', 'Webfetcher', 'noimage'),
(1261, 0, 'webfoot', 'The Webfoot Robot', 'noimage'),
(1262, 0, 'weblayers', 'Weblayers', 'noimage'),
(1263, 0, 'weblinker', 'WebLinker', 'noimage'),
(1264, 0, 'webmirror', 'WebMirror', 'noimage'),
(1265, 0, 'webmoose', 'The Web Moose', 'noimage'),
(1266, 0, 'webquest', 'WebQuest', 'noimage'),
(1267, 0, 'webreader', 'Digimarc MarcSpider', 'noimage'),
(1268, 0, 'webreaper', 'WebReaper', 'noimage'),
(1269, 0, 'websnarf', 'Websnarf', 'noimage'),
(1270, 0, 'webspider', 'WebSpider', 'noimage'),
(1271, 0, 'webvac', 'WebVac', 'noimage'),
(1272, 0, 'webwalk', 'webwalk', 'noimage'),
(1273, 0, 'webwalker', 'WebWalker', 'noimage'),
(1274, 0, 'webwatch', 'WebWatch', 'noimage'),
(1275, 0, 'wget', 'Wget', 'noimage'),
(1276, 0, 'whatuseek', 'whatUseek Winona', 'noimage'),
(1277, 0, 'whowhere', 'WhoWhere Robot', 'noimage'),
(1278, 0, 'wired-digital', 'Wired Digital', 'noimage'),
(1279, 0, 'wmir', 'w3mir', 'noimage'),
(1280, 0, 'wolp', 'WebStolperer', 'noimage'),
(1281, 0, 'wombat', 'The Web Wombat', 'noimage'),
(1282, 0, 'worm', 'The World Wide Web Worm', 'noimage'),
(1283, 0, 'wwwc', 'WWWC Ver 0.2.5', 'noimage'),
(1284, 0, 'wz101', 'WebZinger', 'noimage'),
(1285, 0, 'xget', 'XGET', 'noimage'),
(1286, 0, 'nederland.zoek', 'Nederland.zoek', 'noimage'),
(1287, 0, 'antibot', 'Antibot', 'noimage'),
(1288, 0, 'awbot', 'AWBot', 'noimage'),
(1289, 0, 'baiduspider', 'BaiDuSpider', 'noimage'),
(1290, 0, 'bobby', 'Bobby', 'noimage'),
(1291, 0, 'boris', 'Boris', 'noimage'),
(1292, 0, 'bumblebee', 'Bumblebee (relevare.com)', 'noimage'),
(1293, 0, 'cscrawler', 'CsCrawler', 'noimage'),
(1294, 0, 'daviesbot', 'DaviesBot', 'noimage'),
(1295, 0, 'digout4u', 'Digout4u', 'noimage'),
(1296, 0, 'echo', 'EchO!', 'noimage'),
(1297, 0, 'exactseek', 'ExactSeek Crawler', 'noimage'),
(1298, 0, 'ezresult', 'Ezresult', 'noimage'),
(1299, 0, 'fast-webcrawler', 'Fast-Webcrawler (AllTheWeb)', 'noimage'),
(1300, 0, 'gigabot', 'GigaBot', 'noimage'),
(1301, 0, 'gnodspider', 'GNOD Spider', 'noimage'),
(1302, 0, 'ia_archiver', 'Alexa (IA Archiver)', 'noimage'),
(1303, 0, 'internetseer', 'InternetSeer', 'noimage'),
(1304, 0, 'jennybot', 'JennyBot', 'noimage'),
(1305, 0, 'justview', 'JustView', 'noimage'),
(1306, 0, 'linkbot', 'LinkBot', 'noimage'),
(1307, 0, 'linkchecker', 'LinkChecker', 'noimage'),
(1308, 0, 'mercator', 'Mercator', 'noimage'),
(1309, 0, 'msiecrawler', 'MSIECrawler', 'noimage'),
(1310, 0, 'perman', 'Perman surfer', 'noimage'),
(1311, 0, 'petersnews', 'Petersnews', 'noimage'),
(1312, 0, 'pompos', 'Pompos', 'noimage'),
(1313, 0, 'psbot', 'psBot', 'noimage'),
(1314, 0, 'redalert', 'Red Alert', 'noimage'),
(1315, 0, 'shoutcast', 'Shoutcast Directory Service', 'noimage'),
(1316, 0, 'slysearch', 'SlySearch', 'noimage'),
(1317, 0, 'turnitinbot', 'Turn It In', 'noimage'),
(1318, 0, 'ultraseek', 'Ultraseek', 'noimage'),
(1319, 0, 'unlost_web_crawler', 'Unlost Web Crawler', 'noimage'),
(1320, 0, 'voila', 'Voila', 'noimage'),
(1321, 0, 'webbase', 'WebBase', 'noimage'),
(1322, 0, 'webcompass', 'webcompass', 'noimage'),
(1323, 0, 'wisenutbot', 'WISENutbot (Looksmart)', 'noimage'),
(1324, 0, 'yandex', 'Yandex bot', 'noimage'),
(1325, 0, 'zyborg', 'Zyborg (Looksmart)', 'noimage'),
(1332, 0, 'mixcat', 'morris - mixcat crawler', 'noimage'),
(1329, 0, 'netresearchserver', 'Net Research Server', 'noimage'),
(1330, 0, 'vagabondo', 'vagabondo (test version WiseGuys webagent)', 'noimage'),
(1331, 0, 'szukacz', 'Szukacz crawler', 'noimage'),
(1333, 0, 'grub-client', 'Grub''s distributed crawler', 'noimage'),
(1334, 0, 'fluffy', 'fluffy (searchhippo)', 'noimage'),
(1335, 0, 'webtrends link analyzer', 'webtrends link analyzer', 'noimage'),
(1336, 0, 'naverrobot', 'naver', 'noimage'),
(1337, 0, 'steeler', 'steeler', 'noimage'),
(1338, 0, 'bordermanager', 'bordermanager', 'noimage'),
(1339, 0, 'nutch', 'Nutch', 'noimage'),
(1340, 0, 'teradex', 'Teradex', 'noimage'),
(1341, 0, 'deepindex', 'DeepIndex', 'noimage'),
(1342, 0, 'npbot', 'NPBot', 'noimage'),
(1343, 0, 'webcraftboot', 'Webcraftboot', 'noimage'),
(1344, 0, 'franklin locator', 'Franklin locator', 'noimage'),
(1345, 0, 'internet ninja', 'Internet ninja', 'noimage'),
(1346, 0, 'space bison', 'Space bison', 'noimage'),
(1347, 0, 'gornker', 'gornker crawler', 'noimage'),
(1348, 0, 'gaisbot', 'Gaisbot', 'noimage'),
(1349, 0, 'cj spider', 'CJ spider', 'noimage'),
(1350, 0, 'semanticdiscovery', 'Semantic Discovery', 'noimage'),
(1351, 0, 'zao', 'Zao', 'noimage'),
(1352, 0, 'web downloader', 'Web Downloader', 'noimage'),
(1353, 0, 'webstripper', 'Webstripper', 'noimage'),
(1354, 0, 'zeus', 'Zeus', 'noimage'),
(1355, 0, 'webrace', 'Webrace', 'noimage'),
(1356, 0, 'christcrawler', 'ChristCENTRAL', 'noimage'),
(1357, 0, 'webfilter', 'Webfilter', 'noimage'),
(1358, 0, 'webgather', 'Webgather', 'noimage'),
(1359, 0, 'surveybot', 'Surveybot', 'noimage'),
(1360, 0, 'nitle blog spider', 'Nitle Blog Spider', 'noimage'),
(1361, 0, 'galaxybot', 'Galaxybot', 'noimage'),
(1362, 0, 'fangcrawl', 'FangCrawl', 'noimage'),
(1363, 0, 'searchspider', 'SearchSpider', 'noimage'),
(1364, 0, 'msnbot', 'msnbot', 'noimage'),
(1365, 0, 'computer_and_automation_research_institute_crawler', 'computer and automation research institute crawler', 'noimage'),
(1366, 0, 'overture-webcrawler', 'overture-webcrawler', 'noimage'),
(1367, 0, 'exalead ng', 'exalead ng', 'noimage'),
(1368, 0, 'denmex websearch', 'denmex websearch', 'noimage'),
(1369, 0, 'linkfilter.net url verifier', 'linkfilter.net url verifier', 'noimage'),
(1370, 0, 'mac finder', 'mac finder', 'noimage'),
(1371, 0, 'polybot', 'polybot', 'noimage'),
(1372, 0, 'quepasacreep', 'quepasacreep', 'noimage'),
(1373, 0, 'xenu link sleuth', 'xenu link sleuth', 'noimage'),
(1374, 0, 'hatena antenna', 'hatena antenna', 'noimage'),
(1375, 0, 'timbobot', 'timbobot', 'noimage'),
(1376, 0, 'waypath scout', 'waypath scout', 'noimage'),
(1377, 0, 'technoratibot', 'technoratibot', 'noimage'),
(1378, 0, 'frontier', 'frontier', 'noimage'),
(1379, 0, 'blogosphere', 'blogosphere', 'noimage'),
(1380, 0, 'my little bot', 'my little bot', 'noimage'),
(1381, 0, 'illinois state tech labs', 'illinois state tech labs', 'noimage'),
(1382, 0, 'splatsearch.com', 'splatsearch', 'noimage'),
(1383, 0, 'blogshares bot', 'blogshares bot', 'noimage'),
(1384, 0, 'fastbuzz.com', 'fastbuzz', 'noimage'),
(1385, 0, 'obidos-bot', 'obidos', 'noimage'),
(1386, 0, 'blogwise.com-metachecker', 'blogwise.com metachecker', 'noimage'),
(1387, 0, 'bravobrian bstop', 'bravobrian bstop', 'noimage'),
(1388, 0, 'feedster crawler', 'feedster', 'noimage'),
(1389, 0, 'isspider', 'blogpulse', 'noimage'),
(1390, 0, 'syndic8', 'syndic8', 'noimage'),
(1391, 0, 'blogvisioneye', 'blogvisioneye', 'noimage'),
(1392, 0, 'downes/referrers', 'downes/referrers', 'noimage'),
(1393, 0, 'naverbot', 'naverbot', 'noimage'),
(1394, 0, 'soziopath', 'soziopath', 'noimage'),
(1395, 0, 'nextopiabot', 'nextopiabot', 'noimage'),
(1396, 0, 'ingrid', 'ingrid', 'noimage'),
(1397, 0, 'vspider', 'vspider', 'noimage'),
(1398, 0, 'yahoo', 'Yahoo', 'noimage'),
(1399, 0, 'sherlock-spider', 'Sherlock Spider', 'noimage'),
(1400, 0, 'mercubot', 'Mercubot', 'noimage'),
(1401, 0, 'mediapartners-google', 'Mediapartners Google', 'noimage'),
(1402, 0, 'jetbot', 'JetBot', 'noimage'),
(1403, 0, 'faxobot', 'FaxoBot', 'noimage'),
(1404, 0, 'cosmixcrawler', 'cosmix crawler', 'noimage'),
(1405, 0, 'exabot', 'exabot', 'noimage'),
(1406, 0, 'sitespider', 'sitespider', 'noimage'),
(1407, 0, 'pipeliner', 'pipeliner', 'noimage'),
(1408, 0, 'ccgcrawl', 'ccgcrawl', 'noimage'),
(1409, 0, 'cydralspider', 'cydralspider', 'noimage'),
(1410, 0, 'crawlconvera', 'crawlconvera', 'noimage'),
(1411, 0, 'blogwatcher', 'blogwatcher', 'noimage'),
(1412, 0, 'mozdex', 'mozdex', 'noimage'),
(1413, 0, 'aleksika spider', 'aleksika spider', 'noimage'),
(1414, 0, 'e-societyrobot', 'e-societyrobot', 'noimage'),
(1415, 0, 'enterprise_search', 'enterprise search', 'noimage'),
(1416, 0, 'seekbot', 'seekbot', 'noimage'),
(1417, 0, 'emeraldshield', 'emeraldshield', 'noimage'),
(1418, 0, 'mj12bot', 'mj12bot', 'noimage'),
(1419, 0, 'aipbot', 'aipbot', 'noimage'),
(1420, 0, 'omniexplorer_bot', 'omniexplorer_bot', 'noimage'),
(1421, 0, 'shim-crawler', 'shim-crawler', 'noimage'),
(1422, 0, 'nimblecrawler', 'nimblecrawler', 'noimage'),
(1423, 0, 'msrbot', 'msrbot', 'noimage'),
(1424, 0, 'scirus', 'scirus', 'noimage'),
(1425, 0, 'geniebot', 'geniebot', 'noimage'),
(1426, 0, 'nextgensearchbot', 'nextgensearchbot', 'noimage'),
(1427, 0, 'ichiro', 'ichiro', 'noimage'),
(1428, 0, 'peerfactor 404 crawler', 'peerfactor 404 crawler', 'noimage'),
(1429, 0, 'ebay relevance ad crawler', 'Ebay relevance ad crawler', 'noimage'),
(1430, 0, 'yodaobot', 'yodaobot/1.0', 'noimage'),
(1431, 0, 'vmbot', 'vmbot/0.9', 'noimage'),
(1432, 0, 'blaiz-bee', 'Blaiz-Bee/2.00.*', 'noimage'),
(1433, 0, 'sensis', 'Sensis Web Crawler', 'noimage'),
(1434, 0, 'abachobot', 'ABACHOBot', 'noimage'),
(1435, 0, 'abilogicbot', 'AbiLogicBot http://www.abilogic.com/bot.html', 'noimage'),
(1436, 0, 'googlebot-image', 'Googlebot-Image', 'noimage'),
(1437, 0, 'emailsiphon', 'EmailSiphon (Sonic) - Email Collector', 'noimage'),
(1438, 0, 'w3c-checklink', 'W3C Linkchecker', 'noimage'),
(1439, 0, 'w3c_validator', 'W3C XHTML/HTML Validator', 'noimage'),
(1440, 0, 'w3c_css_validator', 'W3C CSS Validator', 'noimage'),
(1441, 0, 'wdg_validator', 'WDG HTML Validator', 'noimage'),
(1442, 0, 'csscheck', 'WDG CSS Validator', 'noimage'),
(1443, 0, 'depspid', 'DepSpid http://about.depspid.net', 'noimage'),
(1445, 0, 'panscient.com', 'Panscient web crawler http://panscient.com', 'noimage'),
(1446, 0, 'bloglines', 'Web based Feed reader for Ask Jeeves Bloglines (ht', 'noimage'),
(1447, 0, 'everyfeed-spider', 'http://www.everyfeed.com', 'noimage'),
(1448, 0, 'feedfetcher-google', 'Google''s feedfetcher (http://www.google.com/feedfe', 'noimage'),
(1449, 0, 'gregarius', 'http://devlog.gregarius.net/docs/ua', 'noimage'),
(1450, 0, 'cse html validator lite online', 'Free online HTML Editor and Syntax Checker (http:/', 'noimage'),
(1451, 0, 'cynthia', 'Validator for HiSoftware Cynthia Says portal (http', 'noimage'),
(1452, 0, 'htmlparser', 'HTML Parser a Java library used to parse HTML (htt', 'noimage'),
(1453, 0, 'p3p validator', 'Platform for Privacy Preferences Project (P3P) by ', 'noimage');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_jstats_configuration`
--

DROP TABLE IF EXISTS `jos_jstats_configuration`;
CREATE TABLE IF NOT EXISTS `jos_jstats_configuration` (
  `description` varchar(250) NOT NULL DEFAULT '-',
  `value` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jos_jstats_configuration`
--

INSERT INTO `jos_jstats_configuration` (`description`, `value`) VALUES
('version', '3.0.3.699'),
('onlinetime', '15'),
('startoption', 'r02'),
('startdayormonth', 'd'),
('enable_whois', 'true'),
('enable_i18n', 'true'),
('include_summarized', 'true'),
('show_summarized', 'true'),
('db_installed_from_version', '3.0.3.699'),
('first_installation_date', '2010-06-08 10:18:47');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_jstats_impressions`
--

DROP TABLE IF EXISTS `jos_jstats_impressions`;
CREATE TABLE IF NOT EXISTS `jos_jstats_impressions` (
  `page_id` mediumint(8) unsigned NOT NULL,
  `visit_id` mediumint(8) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jos_jstats_impressions`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_jstats_impressions_sums`
--

DROP TABLE IF EXISTS `jos_jstats_impressions_sums`;
CREATE TABLE IF NOT EXISTS `jos_jstats_impressions_sums` (
  `page_id` mediumint(8) unsigned NOT NULL,
  `impression_date` date NOT NULL,
  `impression_number` smallint(5) unsigned NOT NULL,
  `impression_length_sum` smallint(5) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jos_jstats_impressions_sums`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_jstats_ipaddresses`
--

DROP TABLE IF EXISTS `jos_jstats_ipaddresses`;
CREATE TABLE IF NOT EXISTS `jos_jstats_ipaddresses` (
  `ip` varchar(50) NOT NULL DEFAULT '',
  `nslookup` varchar(255) DEFAULT NULL,
  `tld` varchar(10) NOT NULL DEFAULT 'unknown',
  `useragent` varchar(255) DEFAULT NULL,
  `system` varchar(50) NOT NULL DEFAULT '',
  `browser` varchar(50) NOT NULL DEFAULT '',
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `exclude` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `tld` (`tld`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `jos_jstats_ipaddresses`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_jstats_iptocountry`
--

DROP TABLE IF EXISTS `jos_jstats_iptocountry`;
CREATE TABLE IF NOT EXISTS `jos_jstats_iptocountry` (
  `IP_FROM` bigint(20) NOT NULL DEFAULT '0',
  `IP_TO` bigint(20) NOT NULL DEFAULT '0',
  `COUNTRY_CODE2` char(2) NOT NULL DEFAULT '',
  `COUNTRY_NAME` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`IP_FROM`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jos_jstats_iptocountry`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_jstats_keywords`
--

DROP TABLE IF EXISTS `jos_jstats_keywords`;
CREATE TABLE IF NOT EXISTS `jos_jstats_keywords` (
  `kwdate` date NOT NULL DEFAULT '0000-00-00',
  `searcher_id` mediumint(9) NOT NULL DEFAULT '0',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `visit_id` mediumint(8) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jos_jstats_keywords`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_jstats_pages`
--

DROP TABLE IF EXISTS `jos_jstats_pages`;
CREATE TABLE IF NOT EXISTS `jos_jstats_pages` (
  `page_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `page` text NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`page_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `jos_jstats_pages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_jstats_referrer`
--

DROP TABLE IF EXISTS `jos_jstats_referrer`;
CREATE TABLE IF NOT EXISTS `jos_jstats_referrer` (
  `referrer` varchar(255) NOT NULL DEFAULT '',
  `domain` varchar(100) NOT NULL DEFAULT 'unknown',
  `refid` mediumint(9) NOT NULL AUTO_INCREMENT,
  `day` tinyint(4) NOT NULL DEFAULT '0',
  `month` tinyint(4) NOT NULL DEFAULT '0',
  `year` smallint(6) NOT NULL DEFAULT '0',
  `visit_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`refid`),
  KEY `referrer` (`referrer`),
  KEY `monthyear` (`month`,`year`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `jos_jstats_referrer`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_jstats_searchers`
--

DROP TABLE IF EXISTS `jos_jstats_searchers`;
CREATE TABLE IF NOT EXISTS `jos_jstats_searchers` (
  `searcher_id` mediumint(8) unsigned NOT NULL,
  `searcher_name` varchar(100) NOT NULL,
  `searcher_domain` varchar(100) NOT NULL,
  `searcher_key` varchar(50) NOT NULL,
  PRIMARY KEY (`searcher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jos_jstats_searchers`
--

INSERT INTO `jos_jstats_searchers` (`searcher_id`, `searcher_name`, `searcher_domain`, `searcher_key`) VALUES
(1, 'test', 'localhost', 'searchword='),
(2, 'test', 'localhost', 'searchword='),
(3, 'Google', 'google.', 'p=|q='),
(4, 'Bing', 'bing.', 'q='),
(5, 'Altavista', 'altavista.', 'q='),
(6, 'Google Images', 'images.google.', 'p=|q='),
(7, 'Lycos', 'lycos.', 'query='),
(8, 'Msn', 'msn.', 'q='),
(9, 'Netscape', 'netscape.', 'search=|q=|query='),
(10, 'Search AOL', 'search.aol.com', 'query='),
(11, 'Search Terra', 'search.terra.', 'query='),
(12, 'Voila', 'voila.', 'kw=|rdata='),
(13, 'Search.Com', 'www.search.com', 'q='),
(14, 'Yahoo', 'yahoo.', 'p='),
(15, 'Go Com', '.go.com', 'qt='),
(16, 'Ask Com', '.ask.com', 'ask='),
(17, 'Atomz', 'atomz.', 'sp-q='),
(18, 'EuroSeek', 'euroseek.', 'query='),
(19, 'Excite', 'excite.', 'search='),
(20, 'FindArticles', 'findarticles.com', 'key='),
(21, 'Go2Net', 'go2net.com', 'general='),
(22, 'HotBot', 'hotbot.', 'mt='),
(23, 'InfoSpace', 'infospace.com', 'qkw='),
(24, 'Kvasir', 'kvasir.', 'q='),
(25, 'LookSmart', 'looksmart.', 'key='),
(26, 'Mamma', 'mamma.', 'query='),
(27, 'MetaCrawler', 'metacrawler.', 'general='),
(28, 'Nbci.Com', 'nbci.com/search', 'keyword='),
(29, 'Northernlight', 'northernlight.', 'qr='),
(30, 'Overture', 'overture.com', 'keywords='),
(31, 'Dogpile', 'dogpile.com', 'qkw='),
(32, 'Dogpile', 'search.dogpile.com', 'q='),
(33, 'Spray', 'spray.', 'string='),
(34, 'Teoma', 'teoma.', 'q='),
(35, 'Virgilio', 'virgilio.it', 'qs='),
(36, 'Webcrawler', 'webcrawler', 'searchText='),
(37, 'Wisenut', 'wisenut.com', 'query='),
(38, 'ix quick', 'ixquick.com', 'query='),
(39, 'Earthlink', 'search.earthlink.net', 'q='),
(40, 'Sympatico', 'search.sli.sympatico.ca', 'query='),
(41, 'I-une', 'i-une.com', 'keywords=|q='),
(42, 'Miner.Bol.Com', 'miner.bol.com.br', 'q='),
(43, 'Baidu', 'baidu.com', 'word='),
(44, 'Sina', 'search.sina.com', 'word='),
(45, 'Sohu', 'search.sohu.com', 'word='),
(46, 'Atlas cz', 'atlas.cz', 'searchtext='),
(47, 'Seznam cz', 'seznam.cz', 'w='),
(48, 'Ftxt Quick cz', 'ftxt.quick.cz', 'query='),
(49, 'Centrum cz', 'centrum.cz', 'q='),
(50, 'Opasia dk', 'opasia.dk', 'q='),
(51, 'Danielsen', 'danielsen.com', 'q='),
(52, 'Sol dk', 'sol.dk', 'q='),
(53, 'Jubii dk', 'jubii.dk', 'soegeord='),
(54, 'Find dk', 'find.dk', 'words='),
(55, 'Edderkoppen dk', 'edderkoppen.dk', 'query='),
(56, 'Orbis dk', 'orbis.dk', 'search_field='),
(57, '1klik dk', '1klik.dk', 'query='),
(58, 'Ofir dk', 'ofir.dk', 'querytext='),
(59, 'Ilse nl', 'ilse.', 'search_for='),
(60, 'Vindex nl', 'vindex.', 'in='),
(61, 'Ask uk', 'ask.co.uk', 'ask='),
(62, 'BBC uk', 'bbc.co.uk/cgi-bin/search', 'q='),
(63, 'ifind uk', 'ifind.freeserve', 'q='),
(64, 'Looksmart uk', 'looksmart.co.uk', 'key='),
(65, 'mirago uk', 'mirago.', 'txtsearch='),
(66, 'Splut uk', 'splut.', 'pattern='),
(67, 'Spotjockey uk', 'spotjockey.', 'Search_Keyword='),
(68, 'Ukindex uk', 'ukindex.co.uk', 'stext='),
(69, 'Ukdirectory uk', 'ukdirectory.', 'k='),
(70, 'Ukplus uk', 'ukplus.', 'search='),
(71, 'Searchy uk', 'searchy.co.uk', 'search_term='),
(73, 'Haku fi', 'haku.www.fi', 'w='),
(74, 'Nomade fr', 'nomade.fr', 's='),
(75, 'Francite fr', 'francite.', 'name='),
(76, 'Club internet fr', 'recherche.club-internet.fr', 'q='),
(77, 'yandex', 'yandex.ru', 'text='),
(78, 'nigma', 'nigma.ru', 'q='),
(79, 'rambler', 'rambler.ru', 'words='),
(80, 'aport', 'aport.ru', 'r='),
(81, 'mail', 'mail.ru', 'q='),
(82, 'Live Search', 'search.live.com', 'q='),
(83, 'AOL.fr', 'aol.fr', 'query=|q='),
(84, 'Conduit.com', 'conduit.com', 'q='),
(85, 'live.com', 'search.live.com', 'q='),
(86, 'AliceADSL', 'aliceadsl.fr', 'qs='),
(87, 'bluewin.ch', 'bluewin.ch', 'query='),
(88, 'T-online', 't-online.de', 'q='),
(89, 'ICQ.com', 'search.icq.com', 'q=|query='),
(90, 'Alexa', 'alexa.com', 'q='),
(91, 'Alltheweb', 'alltheweb.com', 'query=|q='),
(92, 'DMOZ', 'dmoz.org', 'search=');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_jstats_systems`
--

DROP TABLE IF EXISTS `jos_jstats_systems`;
CREATE TABLE IF NOT EXISTS `jos_jstats_systems` (
  `sys_id` mediumint(9) NOT NULL,
  `sys_string` varchar(25) NOT NULL DEFAULT '',
  `sys_fullname` varchar(25) NOT NULL DEFAULT '',
  `sys_type` tinyint(1) NOT NULL DEFAULT '0',
  `sys_img` varchar(12) NOT NULL DEFAULT 'noimage',
  PRIMARY KEY (`sys_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jos_jstats_systems`
--

INSERT INTO `jos_jstats_systems` (`sys_id`, `sys_string`, `sys_fullname`, `sys_type`, `sys_img`) VALUES
(0, '', 'Unknown', 0, 'unknown'),
(1, 'win95', 'Windows 95', 1, 'windows2000'),
(2, 'windows 95', 'Windows 95', 1, 'windows2000'),
(3, 'win98', 'Windows 98', 1, 'windows2000'),
(4, 'windows 98', 'Windows 98', 1, 'windows2000'),
(5, 'winme', 'Windows me', 1, 'windows2000'),
(6, 'windows me', 'Windows me', 1, 'windows2000'),
(7, 'windows nt 4.0', 'Windows NT', 1, 'windows2000'),
(8, 'windows nt 5.0', 'Windows 2000', 1, 'windows2000'),
(9, 'winnt 5.0', 'Windows 2000', 1, 'windows2000'),
(10, 'winnt 5.1', 'Windows XP', 1, 'windowsxp'),
(11, 'windows nt 5.1', 'Windows XP', 1, 'windowsxp'),
(12, 'macintosh', 'Mac OS', 2, 'mac'),
(13, 'linux', 'Linux', 2, 'linux'),
(14, 'aix', 'Aix', 3, 'aix'),
(15, 'sunos', 'Sun Solaris', 4, 'solaris'),
(16, 'irix', 'Irix', 4, 'irix'),
(17, 'osf', 'OSF Unix', 2, 'linux'),
(18, 'hp-ux', 'HP Unix', 2, 'hpux'),
(19, 'netbsd', 'NetBSD', 2, 'netbsd'),
(20, 'bsdi', 'BSDi', 2, 'freebsd'),
(21, 'freebsd', 'FreeBSD', 2, 'freebsd'),
(22, 'openbsd', 'OpenBSD', 2, 'openbsd'),
(23, 'unix', 'Unknown Unix system', 2, 'unix'),
(24, 'beos', 'BeOS', 4, 'beos'),
(25, 'os/2', 'Warp OS/2', 4, 'os2'),
(26, 'amigaos', 'AmigaOS', 4, 'amiga'),
(27, 'vms', 'VMS', 4, 'vms'),
(28, 'cp/m', 'CPM', 4, 'noimage'),
(29, 'crayos', 'CrayOS', 4, 'cray'),
(30, 'dreamcast', 'Dreamcast', 4, 'dreamcast'),
(31, 'riscos', 'RISC OS', 4, 'risc'),
(32, 'webtv', 'WebTV', 4, 'webtv'),
(33, 'windows nt 5.2', 'Windows 2003', 1, 'windows2000'),
(34, 'mac_powerpc', 'Mac PowerPC', 2, 'mac'),
(35, 'mac os x', 'Mac OS X', 2, 'mac'),
(36, 'windows nt', 'Windows NT', 1, 'windows2000'),
(37, 'windows nt 6.0', 'Windows Vista', 1, 'windowsvista'),
(38, 'windows nt 6.1', 'Windows 7', 1, 'windows7');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_jstats_topleveldomains`
--

DROP TABLE IF EXISTS `jos_jstats_topleveldomains`;
CREATE TABLE IF NOT EXISTS `jos_jstats_topleveldomains` (
  `tld_id` mediumint(9) NOT NULL,
  `tld` varchar(9) NOT NULL DEFAULT '',
  `fullname` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`tld_id`),
  KEY `tld` (`tld`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jos_jstats_topleveldomains`
--

INSERT INTO `jos_jstats_topleveldomains` (`tld_id`, `tld`, `fullname`) VALUES
(0, 'unknown', 'Unknown'),
(1, 'ac', 'Ascension Island'),
(2, 'ad', 'Andorra'),
(3, 'ae', 'United Arab Emirates'),
(4, 'af', 'Afghanistan'),
(5, 'ag', 'Antigua and Barbuda'),
(6, 'ai', 'Anguilla'),
(7, 'al', 'Albania'),
(8, 'am', 'Armenia'),
(9, 'an', 'Netherlands Antilles'),
(10, 'ao', 'Angola'),
(11, 'aq', 'Antarctica'),
(12, 'ar', 'Argentina'),
(13, 'as', 'American Samoa'),
(14, 'at', 'Austria'),
(15, 'au', 'Australia'),
(16, 'aw', 'Aruba'),
(17, 'ax', 'Aland Islands'),
(18, 'az', 'Azerbaijan'),
(19, 'ba', 'Bosnia Hercegovina'),
(20, 'bb', 'Barbados'),
(21, 'bd', 'Bangladesh'),
(22, 'be', 'Belgium'),
(23, 'bf', 'Burkina Faso'),
(24, 'bg', 'Bulgaria'),
(25, 'bh', 'Bahrain'),
(26, 'bi', 'Burundi'),
(27, 'bj', 'Benin'),
(28, 'bm', 'Bermuda'),
(29, 'bn', 'Brunei Darussalam'),
(30, 'bo', 'Bolivia'),
(31, 'br', 'Brazil'),
(32, 'bs', 'Bahamas'),
(33, 'bt', 'Bhutan'),
(34, 'bv', 'Bouvet Island'),
(35, 'bw', 'Botswana'),
(36, 'by', 'Belarus (Byelorussia)'),
(37, 'bz', 'Belize'),
(38, 'ca', 'Canada'),
(39, 'cc', 'Cocos Islands (Keeling)'),
(40, 'cd', 'Congo, Democratic Republic of the'),
(41, 'cf', 'Central African Republic'),
(42, 'cg', 'Congo, Republic of'),
(43, 'ch', 'Switzerland'),
(44, 'ci', 'Cote d''Ivoire (Ivory Coast)'),
(45, 'ck', 'Cook Islands'),
(46, 'cl', 'Chile'),
(47, 'cm', 'Cameroon'),
(48, 'cn', 'China'),
(49, 'co', 'Colombia'),
(50, 'cr', 'Costa Rica'),
(51, 'cs', 'Serbia and Montenegro'),
(52, 'cu', 'Cuba'),
(53, 'cv', 'Cap Verde'),
(54, 'cx', 'Christmas Island'),
(55, 'cy', 'Cyprus'),
(56, 'cz', 'Czech Republic'),
(57, 'de', 'Germany'),
(58, 'dj', 'Djibouti'),
(59, 'dk', 'Denmark'),
(60, 'dm', 'Dominica'),
(61, 'do', 'Dominican Republic'),
(62, 'dz', 'Algeria'),
(63, 'ec', 'Ecuador'),
(64, 'ee', 'Estonia'),
(65, 'eg', 'Egypt'),
(66, 'eh', 'Western Sahara'),
(67, 'er', 'Eritrea'),
(68, 'es', 'Spain'),
(69, 'et', 'Ethiopia'),
(70, 'fi', 'Finland'),
(71, 'fj', 'Fiji'),
(72, 'fk', 'Falkland Islands'),
(73, 'fm', 'Micronesia, Federated States of'),
(74, 'fo', 'Faroe Islands'),
(75, 'fr', 'France'),
(76, 'ga', 'Gabon'),
(77, 'gb', 'United Kingdom'),
(78, 'gd', 'Grenada'),
(79, 'ge', 'Georgia'),
(80, 'gf', 'French Guiana'),
(81, 'gg', 'Guernsey'),
(82, 'gh', 'Ghana'),
(83, 'gi', 'Gibraltar'),
(84, 'gl', 'Greenland'),
(85, 'gm', 'Gambia'),
(86, 'gn', 'Guinea'),
(87, 'gp', 'Guadeloupe'),
(88, 'gq', 'Equatorial Guinea'),
(89, 'gr', 'Greece'),
(90, 'gs', 'South Georgia and the South Sandwich Islands'),
(91, 'gt', 'Guatemala'),
(92, 'gu', 'Guam'),
(93, 'gw', 'Guinea-Bissau'),
(94, 'gy', 'Guyana'),
(95, 'hk', 'Hong Kong'),
(96, 'hm', 'Heard and McDonald Islands'),
(97, 'hn', 'Honduras'),
(98, 'hr', 'Croatia/Hrvatska'),
(99, 'ht', 'Haiti'),
(100, 'hu', 'Hungary'),
(101, 'id', 'Indonesia'),
(102, 'ie', 'Ireland'),
(103, 'il', 'Israel'),
(104, 'im', 'Isle of Man'),
(105, 'in', 'India'),
(106, 'io', 'British Indian Ocean Territory'),
(107, 'iq', 'Iraq'),
(108, 'ir', 'Iran, Islamic Republic of'),
(109, 'is', 'Iceland'),
(110, 'it', 'Italy'),
(111, 'je', 'Jersey'),
(112, 'jm', 'Jamaica'),
(113, 'jo', 'Jordan'),
(114, 'jp', 'Japan'),
(115, 'ke', 'Kenya'),
(116, 'kg', 'Kyrgyzstan'),
(117, 'kh', 'Cambodia'),
(118, 'ki', 'Kiribati'),
(119, 'km', 'Comoros'),
(120, 'kn', 'Saint Kitts and Nevis'),
(121, 'kp', 'Korea, Democratic People''s Republic'),
(122, 'kr', 'Korea, Republic of'),
(123, 'kw', 'Kuwait'),
(124, 'ky', 'Cayman Islands'),
(125, 'kz', 'Kazakhstan'),
(126, 'la', 'Lao People''s Democratic Republic'),
(127, 'lb', 'Lebanon'),
(128, 'lc', 'Saint Lucia'),
(129, 'li', 'Liechtenstein'),
(130, 'lk', 'Sri Lanka'),
(131, 'lr', 'Liberia'),
(132, 'ls', 'Lesotho'),
(133, 'lt', 'Lithuania'),
(134, 'lu', 'Luxembourg'),
(135, 'lv', 'Latvia'),
(136, 'ly', 'Libyan Arab Jamahiriya'),
(137, 'ma', 'Morocco'),
(138, 'mc', 'Monaco'),
(139, 'md', 'Moldova, Republic of'),
(271, 'me', 'Montenegro'),
(140, 'mg', 'Madagascar'),
(141, 'mh', 'Marshall Islands'),
(142, 'mk', 'Macedonia, Former Yugoslav Republic'),
(143, 'ml', 'Mali'),
(144, 'mm', 'Myanmar'),
(145, 'mn', 'Mongolia'),
(146, 'mo', 'Macau'),
(147, 'mp', 'Northern Mariana Islands'),
(148, 'mq', 'Martinique'),
(149, 'mr', 'Mauritani'),
(150, 'ms', 'Montserrat'),
(151, 'mt', 'Malta'),
(152, 'mu', 'Mauritius'),
(153, 'mv', 'Maldives'),
(154, 'mw', 'Malawi'),
(155, 'mx', 'Mexico'),
(156, 'my', 'Malaysia'),
(157, 'mz', 'Mozambique'),
(158, 'na', 'Namibia'),
(159, 'nc', 'New Caledonia'),
(160, 'ne', 'Niger'),
(161, 'nf', 'Norfolk Island'),
(162, 'ng', 'Nigeria'),
(163, 'ni', 'Nicaragua'),
(164, 'nl', 'Netherlands'),
(165, 'no', 'Norway'),
(166, 'np', 'Nepal'),
(167, 'nr', 'Nauru'),
(168, 'nt', 'Neutral Zone'),
(169, 'nu', 'Niue'),
(170, 'nz', 'New Zealand'),
(171, 'om', 'Oman'),
(172, 'pa', 'Panama'),
(173, 'pe', 'Peru'),
(174, 'pf', 'French Polynesia'),
(175, 'pg', 'Papua New Guinea'),
(176, 'ph', 'Philippines'),
(177, 'pk', 'Pakistan'),
(178, 'pl', 'Poland'),
(179, 'pm', 'St. Pierre and Miquelon'),
(180, 'pn', 'Pitcairn Island'),
(181, 'pr', 'Puerto Rico'),
(182, 'ps', 'Palestinian Territories'),
(183, 'pt', 'Portugal'),
(184, 'pw', 'Palau'),
(185, 'py', 'Paraguay'),
(186, 'qa', 'Qatar'),
(187, 're', 'Reunion Island'),
(188, 'ro', 'Romania'),
(272, 'rs', 'Serbia'),
(189, 'ru', 'Russian Federation'),
(190, 'rw', 'Rwanda'),
(191, 'sa', 'Saudi Arabia'),
(192, 'sb', 'Solomon Islands'),
(193, 'sc', 'Seychelles'),
(194, 'sd', 'Sudan'),
(195, 'se', 'Sweden'),
(196, 'sg', 'Singapore'),
(197, 'sh', 'St. Helena'),
(198, 'si', 'Slovenia'),
(199, 'sj', 'Svalbard and Jan Mayen Islands'),
(200, 'sk', 'Slovak Republic'),
(201, 'sl', 'Sierra Leone'),
(202, 'sm', 'San Marino'),
(203, 'sn', 'Senegal'),
(204, 'so', 'Somalia'),
(205, 'sr', 'Suriname'),
(206, 'st', 'Sao Tome and Principe'),
(207, 'su', 'Former Soviet Union'),
(208, 'sv', 'El Salvador'),
(209, 'sy', 'Syrian Arab Republic'),
(210, 'sz', 'Swaziland'),
(211, 'tc', 'Turks and Caicos Islands'),
(212, 'td', 'Chad'),
(213, 'tf', 'French Southern Territories'),
(214, 'tg', 'Togo'),
(215, 'th', 'Thailand'),
(216, 'tj', 'Tajikistan'),
(217, 'tk', 'Tokelau'),
(218, 'tl', 'East Timor'),
(219, 'tm', 'Turkmenistan'),
(220, 'tn', 'Tunisia'),
(221, 'to', 'Tonga'),
(222, 'tp', 'East Timor'),
(223, 'tr', 'Turkey'),
(224, 'tt', 'Trinidad and Tobago'),
(225, 'tv', 'Tuvalu'),
(226, 'tw', 'Taiwan'),
(227, 'tz', 'Tanzania'),
(228, 'ua', 'Ukraine'),
(229, 'ug', 'Uganda'),
(230, 'uk', 'United Kingdom'),
(231, 'um', 'US Minor Outlying Islands'),
(232, 'us', 'United States'),
(233, 'uy', 'Uruguay'),
(234, 'uz', 'Uzbekistan'),
(235, 'va', 'Holy See (City Vatican State)'),
(236, 'vc', 'Saint Vincent and the Grenadines'),
(237, 've', 'Venezuela'),
(238, 'vg', 'Virgin Islands (British)'),
(239, 'vi', 'Virgin Islands (USA)'),
(240, 'vn', 'Vietnam'),
(241, 'vu', 'Vanuatu'),
(242, 'wf', 'Wallis and Futuna Islands'),
(243, 'ws', 'Western Samoa'),
(244, 'ye', 'Yemen'),
(245, 'yt', 'Mayotte'),
(246, 'yu', 'Serbia and Montenegro'),
(247, 'za', 'South Africa'),
(248, 'zm', 'Zambia'),
(249, 'zw', 'Zimbabwe'),
(250, 'eu', 'European Union'),
(251, 'cat', 'Catalonia'),
(273, 'asia', 'Asia'),
(252, 'com', 'Commercial'),
(253, 'net', 'Network'),
(254, 'org', 'Organization'),
(255, 'gov', 'US Government'),
(256, 'mil', 'US Military (Dept of Defense)'),
(257, 'int', 'International Organizations'),
(258, 'aero', 'Aviation Industry'),
(259, 'biz', 'Businesses'),
(260, 'coop', 'Cooperatives'),
(261, 'edu', 'Educational Institutions'),
(262, 'info', 'Worldwide unrestricted use'),
(263, 'jobs', 'Job Offering Companies'),
(264, 'mobi', 'Mobile Internet Services'),
(265, 'museum', 'Museums'),
(266, 'name', 'Individuals and Families'),
(267, 'pro', 'Attorneys, Physicians, Engineers, and Accountants'),
(274, 'tel', 'Telephone Service'),
(268, 'travel', 'Travel and Tourism Industry'),
(269, 'arpa', 'Old Style Arpanet');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_jstats_visits`
--

DROP TABLE IF EXISTS `jos_jstats_visits`;
CREATE TABLE IF NOT EXISTS `jos_jstats_visits` (
  `visit_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_id` mediumint(8) unsigned NOT NULL,
  `joomla_userid` mediumint(9) NOT NULL,
  `visit_date` date NOT NULL,
  `visit_time` time NOT NULL,
  PRIMARY KEY (`visit_id`),
  KEY `visit_date` (`visit_date`),
  KEY `visitor_id` (`visitor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `jos_jstats_visits`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_languages`
--

DROP TABLE IF EXISTS `jos_languages`;
CREATE TABLE IF NOT EXISTS `jos_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `iso` varchar(20) DEFAULT NULL,
  `code` varchar(20) NOT NULL DEFAULT '',
  `shortcode` varchar(20) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `fallback_code` varchar(20) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Zrzut danych tabeli `jos_languages`
--

INSERT INTO `jos_languages` (`id`, `name`, `active`, `iso`, `code`, `shortcode`, `image`, `fallback_code`, `params`, `ordering`) VALUES
(1, 'English', 1, 'en_GB.utf8, en_GB.UT', 'en-GB', 'en', '', '', '', 1),
(2, 'Deutsch', 1, 'de_DE.UTF-8, de_CH.U', 'de-DE', 'de', '', '', '', 0),
(3, 'Polish', 1, 'pl-PL.utf8, pl_PL.UT', 'pl-PL', 'pl', '', '', '', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_menu`
--

DROP TABLE IF EXISTS `jos_menu`;
CREATE TABLE IF NOT EXISTS `jos_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(75) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link` text,
  `type` varchar(50) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `componentid` int(11) unsigned NOT NULL DEFAULT '0',
  `sublevel` int(11) DEFAULT '0',
  `ordering` int(11) DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pollid` int(11) NOT NULL DEFAULT '0',
  `browserNav` tinyint(4) DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `utaccess` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `lft` int(11) unsigned NOT NULL DEFAULT '0',
  `rgt` int(11) unsigned NOT NULL DEFAULT '0',
  `home` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `componentid` (`componentid`,`menutype`,`published`,`access`),
  KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Zrzut danych tabeli `jos_menu`
--

INSERT INTO `jos_menu` (`id`, `menutype`, `name`, `alias`, `link`, `type`, `published`, `parent`, `componentid`, `sublevel`, `ordering`, `checked_out`, `checked_out_time`, `pollid`, `browserNav`, `access`, `utaccess`, `params`, `lft`, `rgt`, `home`) VALUES
(1, 'mainmenu', 'O nas', 'onas', 'index.php?option=com_content&view=frontpage', 'component', 1, 0, 20, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'num_leading_articles=1\nnum_intro_articles=2\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=front\nmulti_column_order=1\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 1),
(2, 'mainmenu', 'Współpraca', 'wspopraca', 'index.php?option=com_content&view=article&id=2', 'component', 1, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(3, 'mainmenu', 'Galeria', 'galeria', 'index.php?option=com_phocagallery&view=category&id=1', 'component', 1, 0, 35, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_pagination_categories=0\nshow_pagination_category=1\nshow_pagination_limit_categories=0\nshow_pagination_limit_category=1\ndisplay_cat_name_title=0\ndisplay_cat_name_breadcrumbs=0\ncategories_columns=\nequal_percentage_width=\ndisplay_image_categories=\ncategories_box_width=\nimage_categories_size=\ncategories_image_ordering=\ncategories_display_avatar=\ndisplay_subcategories=\ndisplay_empty_categories=\nhide_categories=\nshow_categories=\ndisplay_access_category=\ndefault_pagination_categories=\npagination_categories=\nfont_color=\nbackground_color=\nbackground_color_hover=\nimage_background_color=\nimage_background_shadow=\nborder_color=\nborder_color_hover=\nmargin_box=\npadding_box=\ndisplay_name=\ndisplay_icon_detail=\ndisplay_icon_download=\ndisplay_icon_folder=\nfont_size_name=\nchar_length_name=\ncategory_box_space=\ndisplay_categories_sub=\ndisplay_subcat_page=\ndisplay_category_icon_image=\ncategory_image_ordering=\ndisplay_back_button=\ndisplay_categories_back_button=\ndefault_pagination_category=\npagination_category=\ndisplay_img_desc_box=\nfont_size_img_desc=\nimg_desc_box_height=\nchar_length_img_desc=\ndisplay_categories_cv=\ndisplay_subcat_page_cv=\ndisplay_category_icon_image_cv=\ncategory_image_ordering_cv=\ndisplay_back_button_cv=\ndisplay_categories_back_button_cv=\ncategories_columns_cv=\ndisplay_image_categories_cv=\nimage_categories_size_cv=\ndetail_window=\ndetail_window_background_color=\nmodal_box_overlay_color=\nmodal_box_overlay_opacity=\nmodal_box_border_color=\nmodal_box_border_width=\nsb_slideshow_delay=\nsb_lang=\nhighslide_class=\nhighslide_opacity=\nhighslide_outline_type=\nhighslide_fullimg=\nhighslide_close_button=\nhighslide_slideshow=\njak_slideshow_delay=\njak_orientation=\njak_description=\njak_description_height=\ndisplay_description_detail=\ndisplay_title_description=\nfont_size_desc=\nfont_color_desc=\ndescription_detail_height=\ndescription_lightbox_font_size=\ndescription_lightbox_font_color=\ndescription_lightbox_bg_color=\nslideshow_delay=\nslideshow_pause=\nslideshow_random=\ndetail_buttons=\nphocagallery_width=\nphocagallery_center=\ncategory_ordering=\nimage_ordering=\ngallery_metadesc=\ngallery_metakey=\nalt_value=\nenable_user_cp=\nenable_upload_avatar=\nenable_avatar_approve=\nenable_usercat_approve=\nenable_usersubcat_approve=\nuser_subcat_count=\nmax_create_cat_char=\nenable_userimage_approve=\nmax_upload_char=\nupload_maxsize=\nupload_maxres_width=\nupload_maxres_height=\nuser_images_max_size=\nenable_java=\nenable_java_admin=\njava_resize_width=\njava_resize_height=\njava_box_width=\njava_box_height=\ndisplay_rating=\ndisplay_rating_img=\ndisplay_comment=\ndisplay_comment_img=\ncomment_width=\nmax_comment_char=\nexternal_comment_system=\nenable_piclens=\nstart_piclens=\npiclens_image=\nswitch_image=\nswitch_width=\nswitch_height=\nswitch_fixed_size=\nenable_overlib=\nol_bg_color=\nol_fg_color=\nol_tf_color=\nol_cf_color=\noverlib_overlay_opacity=\noverlib_image_rate=\ncreate_watermark=\nwatermark_position_x=\nwatermark_position_y=\ndisplay_icon_vm=\ndisplay_category_statistics=\ndisplay_main_cat_stat=\ndisplay_lastadded_cat_stat=\ncount_lastadded_cat_stat=\ndisplay_mostviewed_cat_stat=\ncount_mostviewed_cat_stat=\ndisplay_camera_info=\nexif_information=\ndisplay_categories_geotagging=\ncategories_lng=\ncategories_lat=\ncategories_zoom=\ncategories_map_width=\ncategories_map_height=\ndisplay_icon_geotagging=\ndisplay_category_geotagging=\ncategory_map_width=\ncategory_map_height=\npagination_thumbnail_creation=\nclean_thumbnails=\nenable_thumb_creation=\ncrop_thumbnail=\njpeg_quality=\nenable_picasa_loading=\npicasa_load_pagination=\nicon_format=\nlarge_image_width=\nlarge_image_height=\nmedium_image_width=\nmedium_image_height=\nsmall_image_width=\nsmall_image_height=\nfront_modal_box_width=\nfront_modal_box_height=\nadmin_modal_box_width=\nadmin_modal_box_height=\nfolder_permissions=\njfile_thumbs=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(4, 'mainmenu', 'Kontakt', 'kontakt', 'index.php?option=com_contact&view=contact&id=1', 'component', 1, 0, 7, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_contact_list=0\nshow_category_crumb=0\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_menu_types`
--

DROP TABLE IF EXISTS `jos_menu_types`;
CREATE TABLE IF NOT EXISTS `jos_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(75) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Zrzut danych tabeli `jos_menu_types`
--

INSERT INTO `jos_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Menu witryny', 'Główne menu witryny');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_messages`
--

DROP TABLE IF EXISTS `jos_messages`;
CREATE TABLE IF NOT EXISTS `jos_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` int(11) NOT NULL DEFAULT '0',
  `priority` int(1) unsigned NOT NULL DEFAULT '0',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `jos_messages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_messages_cfg`
--

DROP TABLE IF EXISTS `jos_messages_cfg`;
CREATE TABLE IF NOT EXISTS `jos_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jos_messages_cfg`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_migration_backlinks`
--

DROP TABLE IF EXISTS `jos_migration_backlinks`;
CREATE TABLE IF NOT EXISTS `jos_migration_backlinks` (
  `itemid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` text NOT NULL,
  `sefurl` text NOT NULL,
  `newurl` text NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jos_migration_backlinks`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_modules`
--

DROP TABLE IF EXISTS `jos_modules`;
CREATE TABLE IF NOT EXISTS `jos_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) DEFAULT NULL,
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `numnews` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `control` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Zrzut danych tabeli `jos_modules`
--

INSERT INTO `jos_modules` (`id`, `title`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `published`, `module`, `numnews`, `access`, `showtitle`, `params`, `iscore`, `client_id`, `control`) VALUES
(1, 'Menu witryny', '', 0, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 1, 'menutype=mainmenu\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=\nmoduleclass_sfx=_menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 1, 0, ''),
(2, 'Logowanie', '', 1, 'login', 0, '0000-00-00 00:00:00', 1, 'mod_login', 0, 0, 1, '', 1, 1, ''),
(3, 'Popularne', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_popular', 0, 2, 1, '', 0, 1, ''),
(4, 'Nowe', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_latest', 0, 2, 1, 'ordering=c_dsc\nuser_id=0\ncache=0\n\n', 0, 1, ''),
(5, 'Statystyka menu', '', 5, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_stats', 0, 2, 1, '', 0, 1, ''),
(6, 'Masz wiadomość', '', 1, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_unread', 0, 2, 1, '', 1, 1, ''),
(7, 'Odwiedziny', '', 2, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_online', 0, 2, 1, '', 1, 1, ''),
(8, 'Przybornik', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', 1, 'mod_toolbar', 0, 2, 1, '', 1, 1, ''),
(9, 'Ikony skrótu', '', 1, 'icon', 0, '0000-00-00 00:00:00', 1, 'mod_quickicon', 0, 2, 1, '', 1, 1, ''),
(10, 'Zalogowani', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_logged', 0, 2, 1, '', 0, 1, ''),
(11, 'Stopka', '', 0, 'footer', 0, '0000-00-00 00:00:00', 1, 'mod_footer', 0, 0, 1, '', 1, 1, ''),
(12, 'Menu zaplecza', '', 1, 'menu', 0, '0000-00-00 00:00:00', 1, 'mod_menu', 0, 2, 1, '', 0, 1, ''),
(13, 'Podmenu', '', 1, 'submenu', 0, '0000-00-00 00:00:00', 1, 'mod_submenu', 0, 2, 1, '', 0, 1, ''),
(14, 'Status użytkownika', '', 1, 'status', 0, '0000-00-00 00:00:00', 1, 'mod_status', 0, 2, 1, '', 0, 1, ''),
(15, 'Tytuł', '', 1, 'title', 0, '0000-00-00 00:00:00', 1, 'mod_title', 0, 2, 1, '', 0, 1, ''),
(16, 'JoomlaStats Activation', '', 1, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_jstats_activate', 0, 0, 1, '', 0, 0, ''),
(17, 'JoomlaStats Back-end', '', 0, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_jstats_backend', 0, 2, 1, 'list_time_period=total\nlist_length=5\nbrowser_header_text=Przeglądarki:\nos_header_text=Systemy operacyjne:\ncountry_header_text=Kraje:\nbot_header_text=Boty:\nmoduleclass_sfx=\n\n', 0, 1, ''),
(18, 'Language Selection', '', -1, 'user4', 0, '0000-00-00 00:00:00', 0, 'mod_jflanguageselection', 0, 0, 0, '', 0, 0, ''),
(19, 'Direct Translation', '', 0, 'status', 0, '0000-00-00 00:00:00', 1, 'mod_translate', 0, 2, 0, '', 0, 1, ''),
(20, 'Menu witryny - art', '', 2, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 0, 'menutype=\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=0\ntag_id=\nclass_sfx=\nmoduleclass_sfx=art-vmenu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(21, 'Menu witryny - art górne', '', 0, 'user3', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 0, 'menutype=mainmenu\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=\nmoduleclass_sfx=\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_modules_menu`
--

DROP TABLE IF EXISTS `jos_modules_menu`;
CREATE TABLE IF NOT EXISTS `jos_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jos_modules_menu`
--

INSERT INTO `jos_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(16, 0),
(18, 0),
(20, 0),
(21, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_newsfeeds`
--

DROP TABLE IF EXISTS `jos_newsfeeds`;
CREATE TABLE IF NOT EXISTS `jos_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link` text NOT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(11) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(11) unsigned NOT NULL DEFAULT '3600',
  `checked_out` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `published` (`published`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `jos_newsfeeds`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_phocagallery`
--

DROP TABLE IF EXISTS `jos_phocagallery`;
CREATE TABLE IF NOT EXISTS `jos_phocagallery` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(250) NOT NULL DEFAULT '',
  `description` text,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `latitude` varchar(20) NOT NULL DEFAULT '',
  `longitude` varchar(20) NOT NULL DEFAULT '',
  `zoom` int(3) NOT NULL DEFAULT '0',
  `geotitle` varchar(255) NOT NULL DEFAULT '',
  `videocode` text,
  `vmproductid` int(11) NOT NULL DEFAULT '0',
  `imgorigsize` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `metakey` text,
  `metadesc` text,
  `extlink1` text,
  `extlink2` text,
  `extid` varchar(255) NOT NULL DEFAULT '',
  `extl` varchar(255) NOT NULL DEFAULT '',
  `extm` varchar(255) NOT NULL DEFAULT '',
  `exts` varchar(255) NOT NULL DEFAULT '',
  `exto` varchar(255) NOT NULL DEFAULT '',
  `extw` varchar(255) NOT NULL DEFAULT '',
  `exth` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`,`published`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `jos_phocagallery`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_phocagallery_categories`
--

DROP TABLE IF EXISTS `jos_phocagallery_categories`;
CREATE TABLE IF NOT EXISTS `jos_phocagallery_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `owner_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `section` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(30) NOT NULL DEFAULT '',
  `description` text,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  `accessuserid` text,
  `uploaduserid` text,
  `deleteuserid` text,
  `userfolder` text,
  `latitude` varchar(20) NOT NULL DEFAULT '',
  `longitude` varchar(20) NOT NULL DEFAULT '',
  `zoom` int(3) NOT NULL DEFAULT '0',
  `geotitle` varchar(255) NOT NULL DEFAULT '',
  `extid` varchar(255) NOT NULL DEFAULT '',
  `exta` varchar(255) NOT NULL DEFAULT '',
  `extu` varchar(255) NOT NULL DEFAULT '',
  `extauth` varchar(255) NOT NULL DEFAULT '',
  `params` text,
  `metakey` text,
  `metadesc` text,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Zrzut danych tabeli `jos_phocagallery_categories`
--

INSERT INTO `jos_phocagallery_categories` (`id`, `parent_id`, `owner_id`, `title`, `name`, `alias`, `image`, `section`, `image_position`, `description`, `date`, `published`, `approved`, `checked_out`, `checked_out_time`, `editor`, `ordering`, `access`, `count`, `hits`, `accessuserid`, `uploaduserid`, `deleteuserid`, `userfolder`, `latitude`, `longitude`, `zoom`, `geotitle`, `extid`, `exta`, `extu`, `extauth`, `params`, `metakey`, `metadesc`) VALUES
(1, 0, 0, 'Galeria', '', 'galeria', '', '', 'left', '', '2010-06-08 10:32:06', 1, 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, 1, '0', '-2', '-2', '', '', '', 0, '', '', '', '', '', NULL, '', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_phocagallery_comments`
--

DROP TABLE IF EXISTS `jos_phocagallery_comments`;
CREATE TABLE IF NOT EXISTS `jos_phocagallery_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(255) NOT NULL DEFAULT '',
  `comment` text,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `jos_phocagallery_comments`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_phocagallery_img_comments`
--

DROP TABLE IF EXISTS `jos_phocagallery_img_comments`;
CREATE TABLE IF NOT EXISTS `jos_phocagallery_img_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(255) NOT NULL DEFAULT '',
  `comment` text,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `jos_phocagallery_img_comments`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_phocagallery_img_votes`
--

DROP TABLE IF EXISTS `jos_phocagallery_img_votes`;
CREATE TABLE IF NOT EXISTS `jos_phocagallery_img_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rating` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `jos_phocagallery_img_votes`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_phocagallery_img_votes_statistics`
--

DROP TABLE IF EXISTS `jos_phocagallery_img_votes_statistics`;
CREATE TABLE IF NOT EXISTS `jos_phocagallery_img_votes_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgid` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `average` float(8,6) NOT NULL DEFAULT '0.000000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `jos_phocagallery_img_votes_statistics`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_phocagallery_user`
--

DROP TABLE IF EXISTS `jos_phocagallery_user`;
CREATE TABLE IF NOT EXISTS `jos_phocagallery_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT '0',
  `avatar` varchar(40) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `jos_phocagallery_user`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_phocagallery_votes`
--

DROP TABLE IF EXISTS `jos_phocagallery_votes`;
CREATE TABLE IF NOT EXISTS `jos_phocagallery_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rating` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `jos_phocagallery_votes`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_phocagallery_votes_statistics`
--

DROP TABLE IF EXISTS `jos_phocagallery_votes_statistics`;
CREATE TABLE IF NOT EXISTS `jos_phocagallery_votes_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `average` float(8,6) NOT NULL DEFAULT '0.000000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `jos_phocagallery_votes_statistics`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_plugins`
--

DROP TABLE IF EXISTS `jos_plugins`;
CREATE TABLE IF NOT EXISTS `jos_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `element` varchar(100) NOT NULL DEFAULT '',
  `folder` varchar(100) NOT NULL DEFAULT '',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(3) NOT NULL DEFAULT '0',
  `iscore` tinyint(3) NOT NULL DEFAULT '0',
  `client_id` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=47 ;

--
-- Zrzut danych tabeli `jos_plugins`
--

INSERT INTO `jos_plugins` (`id`, `name`, `element`, `folder`, `access`, `ordering`, `published`, `iscore`, `client_id`, `checked_out`, `checked_out_time`, `params`) VALUES
(1, 'Uwierzytelnianie - Joomla', 'joomla', 'authentication', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(2, 'Uwierzytelnienie - LDAP', 'ldap', 'authentication', 0, 2, 0, 1, 0, 0, '0000-00-00 00:00:00', 'host=\nport=389\nuse_ldapV3=0\nnegotiate_tls=0\nno_referrals=0\nauth_method=bind\nbase_dn=\nsearch_string=\nusers_dn=\nusername=\npassword=\nldap_fullname=fullName\nldap_email=mail\nldap_uid=uid\n\n'),
(3, 'Uwierzytelnienie - GMail', 'gmail', 'authentication', 0, 4, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(4, 'Uwierzytelnienie - OpenID', 'openid', 'authentication', 0, 3, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(5, 'Użytkownik - Joomla!', 'joomla', 'user', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', 'autoregister=1\n\n'),
(6, 'Szukaj - Artykuły', 'content', 'search', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\nsearch_content=1\nsearch_uncategorised=1\nsearch_archived=1\n\n'),
(7, 'Szukaj - Kontakty', 'contacts', 'search', 0, 3, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(8, 'Szukaj - Kategorie', 'categories', 'search', 0, 4, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(9, 'Szukaj - Sekcje', 'sections', 'search', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(10, 'Szukaj - Spinacz RSS', 'newsfeeds', 'search', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(11, 'Szukaj - Zakładki', 'weblinks', 'search', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(12, 'Artykuły - Podział strony', 'pagebreak', 'content', 0, 10000, 1, 1, 0, 0, '0000-00-00 00:00:00', 'enabled=1\ntitle=1\nmultipage_toc=1\nshowall=1\n\n'),
(13, 'Artykuły - Ocenianie', 'vote', 'content', 0, 4, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(14, 'Artykuły - Maskuj email', 'emailcloak', 'content', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'mode=1\n\n'),
(15, 'Artykuły - Wyróżniaj kod (GeSHi)', 'geshi', 'content', 0, 5, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(16, 'Artykuły - Wpinacz modułów', 'loadmodule', 'content', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'enabled=1\nstyle=0\n\n'),
(17, 'Artykuły - Paginacja', 'pagenavigation', 'content', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'position=1\n\n'),
(18, 'Edytor - Bez edytora', 'none', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(19, 'Edytor - TinyMCE 2.0', 'tinymce', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', 'mode=extended\nskin=0\ncompressed=0\ncleanup_startup=0\ncleanup_save=2\nentity_encoding=raw\nlang_mode=1\nlang_code=pl\ntext_direction=ltr\ncontent_css=1\ncontent_css_custom=\nrelative_urls=1\nnewlines=0\ninvalid_elements=applet\nextended_elements=\ntoolbar=top\ntoolbar_align=left\nhtml_height=550\nhtml_width=750\nelement_path=1\nfonts=1\npaste=1\nsearchreplace=1\ninsertdate=1\nformat_date=%Y-%m-%d\ninserttime=1\nformat_time=%H:%M:%S\ncolors=1\ntable=1\nsmilies=1\nmedia=1\nhr=1\ndirectionality=1\nfullscreen=1\nstyle=1\nlayer=1\nxhtmlxtras=0\nvisualchars=1\nnonbreaking=1\nblockquote=1\ntemplate=0\nadvimage=1\nadvlink=1\nautosave=0\ncontextmenu=1\ninlinepopups=1\nsafari=0\ncustom_plugin=\ncustom_button=\n\n'),
(20, 'Edytor - XStandard Lite 2.0', 'xstandard', 'editors', 0, 0, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(21, 'Edytor - Przycisk Grafika', 'image', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(22, 'Edytor - Przycisk Podziel stronę', 'pagebreak', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(23, 'Edytor - Przycisk Więcej', 'readmore', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(24, 'XML-RPC - Joomla', 'joomla', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(25, 'XML-RPC - Blogger API', 'blogger', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', 'catid=1\nsectionid=0\n\n'),
(27, 'System - Proste adresy', 'sef', 'system', 0, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(28, 'System - Diagnostyka', 'debug', 'system', 0, 2, 1, 0, 0, 0, '0000-00-00 00:00:00', 'queries=1\nmemory=1\nlangauge=1\n\n'),
(29, 'System - Obsługa spuścizny', 'legacy', 'system', 0, 3, 0, 1, 0, 0, '0000-00-00 00:00:00', 'route=0\n\n'),
(30, 'System - Pamięć podręczna', 'cache', 'system', 0, 4, 0, 1, 0, 0, '0000-00-00 00:00:00', 'browsercache=0\ncachetime=15\n\n'),
(31, 'System - Dziennik', 'log', 'system', 0, 5, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(32, 'System - Pamiętaj mnie', 'remember', 'system', 0, 6, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(33, 'System - Dawne adresy', 'backlink', 'system', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(34, 'Content - Attachments', 'attachments', 'content', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(35, 'Editor Button - AddAttachment', 'add_attachment', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(37, 'System - Jfdatabase', 'jfdatabase', 'system', 0, -100, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(38, 'System - Jfrouter', 'jfrouter', 'system', 0, -101, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(39, 'Artykuły - Jfalternative', 'jfalternative', 'content', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(40, 'Szukaj - Jfcategories', 'jfcategories', 'search', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(41, 'Szukaj - Jfcontacts', 'jfcontacts', 'search', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(42, 'Szukaj - Jfcontent', 'jfcontent', 'search', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(43, 'Szukaj - Jfnewsfeeds', 'jfnewsfeeds', 'search', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(44, 'Szukaj - Jfsections', 'jfsections', 'search', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(45, 'Szukaj - Jfweblinks', 'jfweblinks', 'search', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(46, 'Joomfish - Missing_translation', 'missing_translation', 'joomfish', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_polls`
--

DROP TABLE IF EXISTS `jos_polls`;
CREATE TABLE IF NOT EXISTS `jos_polls` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `voters` int(9) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `lag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `jos_polls`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_poll_data`
--

DROP TABLE IF EXISTS `jos_poll_data`;
CREATE TABLE IF NOT EXISTS `jos_poll_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pollid` int(11) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pollid` (`pollid`,`text`(1))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `jos_poll_data`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_poll_date`
--

DROP TABLE IF EXISTS `jos_poll_date`;
CREATE TABLE IF NOT EXISTS `jos_poll_date` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL DEFAULT '0',
  `poll_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `jos_poll_date`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_poll_menu`
--

DROP TABLE IF EXISTS `jos_poll_menu`;
CREATE TABLE IF NOT EXISTS `jos_poll_menu` (
  `pollid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pollid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jos_poll_menu`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_sections`
--

DROP TABLE IF EXISTS `jos_sections`;
CREATE TABLE IF NOT EXISTS `jos_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` text NOT NULL,
  `scope` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(30) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_scope` (`scope`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `jos_sections`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_session`
--

DROP TABLE IF EXISTS `jos_session`;
CREATE TABLE IF NOT EXISTS `jos_session` (
  `username` varchar(150) DEFAULT '',
  `time` varchar(14) DEFAULT '',
  `session_id` varchar(200) NOT NULL DEFAULT '0',
  `guest` tinyint(4) DEFAULT '1',
  `userid` int(11) DEFAULT '0',
  `usertype` varchar(50) DEFAULT '',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  PRIMARY KEY (`session_id`(64)),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jos_session`
--

INSERT INTO `jos_session` (`username`, `time`, `session_id`, `guest`, `userid`, `usertype`, `gid`, `client_id`, `data`) VALUES
('', '1275993426', '6n4ua992eteqnmqnkbklme1772', 1, 0, '', 0, 0, '__default|a:8:{s:15:"session.counter";i:5;s:19:"session.timer.start";i:1275993221;s:18:"session.timer.last";i:1275993227;s:17:"session.timer.now";i:1275993426;s:22:"session.client.browser";s:85:"Mozilla/5.0 (Windows; U; Windows NT 6.1; pl; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:2:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}s:11:"application";a:1:{s:4:"data";O:8:"stdClass":1:{s:4:"lang";s:5:"pl-PL";}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:3:"gid";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:3:"aid";i:0;s:5:"guest";i:1;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:59:"D:\\xampp\\htdocs\\new\\libraries\\joomla\\html\\parameter\\element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}s:13:"session.token";s:32:"62f98d6b2db4a7eba7a4e05e44bb0379";}'),
('admin', '1275993431', '04cf3226e0bd7f6915b56a98d4f56fa8', 0, 62, 'Super Administrator', 25, 1, '__default|a:8:{s:15:"session.counter";i:177;s:19:"session.timer.start";i:1275991657;s:18:"session.timer.last";i:1275993386;s:17:"session.timer.now";i:1275993431;s:22:"session.client.browser";s:85:"Mozilla/5.0 (Windows; U; Windows NT 6.1; pl; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:6:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}s:11:"application";a:1:{s:4:"data";O:8:"stdClass":1:{s:4:"lang";s:0:"";}}s:6:"global";a:1:{s:4:"data";O:8:"stdClass":1:{s:4:"list";O:8:"stdClass":1:{s:5:"limit";i:0;}}}s:13:"com_installer";a:1:{s:4:"data";O:8:"stdClass":2:{s:10:"limitstart";O:8:"stdClass":2:{s:6:"module";i:0;s:6:"plugin";i:0;}s:7:"plugins";O:8:"stdClass":1:{s:5:"group";s:0:"";}}}s:11:"com_plugins";a:1:{s:4:"data";O:8:"stdClass":2:{s:4:"site";O:8:"stdClass":5:{s:12:"filter_order";s:8:"p.folder";s:16:"filter_order_Dir";s:0:"";s:12:"filter_state";s:0:"";s:11:"filter_type";s:1:"1";s:6:"search";s:0:"";}s:10:"limitstart";i:20;}}s:9:"com_menus";a:1:{s:4:"data";O:8:"stdClass":1:{s:8:"menutype";s:8:"mainmenu";}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";s:2:"62";s:4:"name";s:13:"Administrator";s:8:"username";s:5:"admin";s:5:"email";s:12:"root@localhost.com";s:8:"password";s:65:"2ea64f1dca6dd510e0b3fa5244e47498:SicHXoNcKTmwqPJLANC2H6SB2KMrtxNO";s:14:"password_clear";s:0:"";s:8:"usertype";s:19:"Super Administrator";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"1";s:3:"gid";s:2:"25";s:12:"registerDate";s:19:"2010-06-08 12:07:01";s:13:"lastvisitDate";s:19:"0000-00-00 00:00:00";s:10:"activation";s:0:"";s:6:"params";s:0:"";s:3:"aid";i:2;s:5:"guest";i:0;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:59:"D:\\xampp\\htdocs\\new\\libraries\\joomla\\html\\parameter\\element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}s:13:"session.token";s:32:"032ddd3adeca717665aa4fdb923aef83";}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_stats_agents`
--

DROP TABLE IF EXISTS `jos_stats_agents`;
CREATE TABLE IF NOT EXISTS `jos_stats_agents` (
  `agent` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jos_stats_agents`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_templates_menu`
--

DROP TABLE IF EXISTS `jos_templates_menu`;
CREATE TABLE IF NOT EXISTS `jos_templates_menu` (
  `template` varchar(255) NOT NULL DEFAULT '',
  `menuid` int(11) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`menuid`,`client_id`,`template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `jos_templates_menu`
--

INSERT INTO `jos_templates_menu` (`template`, `menuid`, `client_id`) VALUES
('rhuk_milkyway', 0, 0),
('khepri', 0, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_users`
--

DROP TABLE IF EXISTS `jos_users`;
CREATE TABLE IF NOT EXISTS `jos_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `gid_block` (`gid`,`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

--
-- Zrzut danych tabeli `jos_users`
--

INSERT INTO `jos_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `gid`, `registerDate`, `lastvisitDate`, `activation`, `params`) VALUES
(62, 'Administrator', 'admin', 'root@localhost.com', '2ea64f1dca6dd510e0b3fa5244e47498:SicHXoNcKTmwqPJLANC2H6SB2KMrtxNO', 'Super Administrator', 0, 1, 25, '2010-06-08 12:07:01', '2010-06-08 10:07:43', '', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `jos_weblinks`
--

DROP TABLE IF EXISTS `jos_weblinks`;
CREATE TABLE IF NOT EXISTS `jos_weblinks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`,`published`,`archived`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `jos_weblinks`
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
