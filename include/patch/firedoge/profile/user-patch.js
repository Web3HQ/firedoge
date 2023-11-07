/*** MaterialFox ***/
/**  Mandatory	  **/
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true); // default is false
user_pref("svg.context-properties.content.enabled", true); 				// default is false

/**  Recommended  (uncomment to apply) **/
/* Replicate Chrome behaviour for clipped tabs */
user_pref("browser.tabs.tabClipWidth", 83); 							// default is 140

/* Replicate Chrome's "Not Secure" text on HTTP */
user_pref("security.insecure_connection_text.enabled", true);

/* Warn before closing windows */
user_pref("browser.sessionstore.warnOnQuit", true);

/* Restore sessions */
user_pref("browser.startup.page", 3);

/* Prevent automatic updates */
user_pref("app.update.auto", false);

user_pref("layout.css.backdrop-filter.enabled", true);
user_pref("gfx.webrender.all", true);
user_pref("svg.context-properties.content.enabled", true);
