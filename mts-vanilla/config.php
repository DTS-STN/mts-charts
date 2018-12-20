<?php if (!defined('APPLICATION')) exit();

// Conversations
$Configuration['Conversations']['Version'] = '2.4.201';

// Database
$Configuration['Database']['Name'] = 'vanilladb';
$Configuration['Database']['Host'] = 'mts-vanilla-mariadb';
$Configuration['Database']['User'] = 'vanilla';
$Configuration['Database']['Password'] = 'changeme';

// EnabledApplications
$Configuration['EnabledApplications']['Conversations'] = 'conversations';
$Configuration['EnabledApplications']['Vanilla'] = 'vanilla';

// EnabledLocales
$Configuration['EnabledLocales']['vf_fr_CA'] = 'fr_CA';

// EnabledPlugins
$Configuration['EnabledPlugins']['recaptcha'] = true;
$Configuration['EnabledPlugins']['GettingStarted'] = 'GettingStarted';
$Configuration['EnabledPlugins']['stubcontent'] = true;
$Configuration['EnabledPlugins']['swagger-ui'] = true;
$Configuration['EnabledPlugins']['Multilingual'] = true;

// Garden
$Configuration['Garden']['Title'] = 'ESDC - MTS';
$Configuration['Garden']['Cookie']['Salt'] = 'ZWnjDZbvHOy2HeSB';
$Configuration['Garden']['Cookie']['Domain'] = '';
$Configuration['Garden']['Registration']['ConfirmEmail'] = true;
$Configuration['Garden']['Email']['SupportName'] = 'ESDC - MTS';
$Configuration['Garden']['Email']['Format'] = 'text';
$Configuration['Garden']['SystemUserID'] = 1;
$Configuration['Garden']['InputFormatter'] = 'Markdown';
$Configuration['Garden']['Version'] = 'Undefined';
$Configuration['Garden']['CanProcessImages'] = true;
$Configuration['Garden']['Installed'] = true;
$Configuration['Garden']['Upload']['AllowedFileExtensions'] = array (
  0 => 'txt',
  1 => 'jpg',
  2 => 'jpeg',
  3 => 'gif',
  4 => 'png',
  5 => 'bmp',
  6 => 'tiff',
  7 => 'zip',
  8 => 'gz',
  9 => 'tar.gz',
  10 => 'tgz',
  11 => 'psd',
  12 => 'ai',
  13 => 'fla',
  14 => 'swf',
  15 => 'pdf',
  16 => 'doc',
  17 => 'xls',
  18 => 'ppt',
  19 => 'docx',
  20 => 'xlsx',
  21 => 'log',
  22 => 'rar',
  23 => '7z',
  24 => 'mp3',
  25 => 'wav',
  26 => 'aiff',
  27 => 'mov',
);
$Configuration['Garden']['Upload']['MaxFileSize'] = '50M';
$Configuration['Garden']['Locale'] = 'en';
$Configuration['Garden']['HomepageTitle'] = 'ESDC - Mobile Technology Solutions';
$Configuration['Garden']['Description'] = 'Unclassified Information Only!';
$Configuration['Garden']['Logo'] = 'e26f9df5366b7942cd132dbfa46ee7f7.png';
$Configuration['Garden']['MobileLogo'] = '99fcd268a323b37454499ac16dda395f.png';
$Configuration['Garden']['FavIcon'] = 'favicon_16d4c5b04da96cee2aa63f0bdfdc3e37.ico';
$Configuration['Garden']['TouchIcon'] = 'favicon-152-9a415e4606a12f873124de8d9611a28b.png';
$Configuration['Garden']['ShareImage'] = '';
$Configuration['Garden']['MobileAddressBarColor'] = '';
$Configuration['Garden']['Theme'] = 'bittersweet';

// Plugins
$Configuration['Plugins']['GettingStarted']['Dashboard'] = '1';
$Configuration['Plugins']['GettingStarted']['Plugins'] = '1';

// Routes
$Configuration['Routes']['YXBwbGUtdG91Y2gtaWNvbi5wbmc='] = array (
  0 => 'utility/showtouchicon',
  1 => 'Internal',
);
$Configuration['Routes']['DefaultController'] = 'discussions';

// Vanilla
$Configuration['Vanilla']['Version'] = '2.4.201';

// Last edited by ben (10.240.0.4) 2018-12-18 20:09:53