<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'eh');

/** MySQL database password */
define('DB_PASSWORD', 'eh');

/** MySQL hostname */
define('DB_HOST', 'mysql');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '{Khv}:b-H}rboqy4Z<iP+x=)S-|qY>0c*Bo%(|;TxoZKS2js9#C$u=f;3O~AqHg5');
define('SECURE_AUTH_KEY',  '.m/`K#S/TiQ-ge2/hgo#b#;nW+O_Wc-{Kv%{S-Nx!){XxyHQK4E>Qj<B5pg^P!xt');
define('LOGGED_IN_KEY',    'v1oO-W=f4=G9wtc4&4vZ2RiW-wOT7)hXB*:g s@aS@Imm5m$JMOpy`T@2w+| :&/');
define('NONCE_KEY',        '2y!?<t~xv PNBz+x>W#pBb%Uu-9JCbr9E{xQ/BnBMosQfNkamAo5ojJd(?QTF../');
define('AUTH_SALT',        'tC|A8S WDKT+:&*CD=-{YeWj^|=}jbHR2,5TNd:aE7BCkd]uB+Aw;=n>MOy5*-*]');
define('SECURE_AUTH_SALT', 'co%Q^++^ElG76&FFa7m-rB5ajHk5qjAQ|V^>e!`[SMrj1,VDG]e,?{HWNnZwIn@u');
define('LOGGED_IN_SALT',   'OQP</=$lr^2I; 9~OwZSqSq;kE>-E}s[2;U3s|w[Rc|6I(YXE$)(_;T3];L$?84l');
define('NONCE_SALT',       '2]-]qiV@.Gh5JN}+OVd|JMm%Z?l<asY-&eN~h+-DC%0e&B+;C?JLIqr/QaFMJ#QE');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
