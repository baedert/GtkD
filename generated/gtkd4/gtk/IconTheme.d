/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */

// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage


module gtk.IconTheme;

private import gdk.Display;
private import gdk.PaintableIF;
private import gio.IconIF;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.ListG;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.IconInfo;
private import gtk.c.functions;
public  import gtk.c.types;
private import std.algorithm;


/**
 * #GtkIconTheme provides a facility for looking up icons by name
 * and size. The main reason for using a name rather than simply
 * providing a filename is to allow different icons to be used
 * depending on what “icon theme” is selected
 * by the user. The operation of icon themes on Linux and Unix
 * follows the [Icon Theme Specification](http://www.freedesktop.org/Standards/icon-theme-spec)
 * There is a fallback icon theme, named `hicolor`, where applications
 * should install their icons, but additional icon themes can be installed
 * as operating system vendors and users choose.
 * 
 * In many cases, named themes are used indirectly, via #GtkImage
 * rather than directly, but looking up icons
 * directly is also simple. The #GtkIconTheme object acts
 * as a database of all the icons in the current theme. You
 * can create new #GtkIconTheme objects, but it’s much more
 * efficient to use the standard icon theme for the #GdkDisplay
 * so that the icon information is shared with other people
 * looking up icons.
 * |[<!-- language="C" -->
 * GError *error = NULL;
 * GtkIconTheme *icon_theme;
 * GdkPaintable *paintable;
 * 
 * icon_theme = gtk_icon_theme_get_default ();
 * paintable = gtk_icon_theme_load_icon (icon_theme,
 * "my-icon-name", // icon name
 * 48, // icon size
 * 0,  // flags
 * &error);
 * if (!paintable)
 * {
 * g_warning ("Couldn’t load icon: %s", error->message);
 * g_error_free (error);
 * }
 * else
 * {
 * // Use the icon
 * g_object_unref (paintable);
 * }
 * ]|
 */
public class IconTheme : ObjectG
{
	/** the main Gtk struct */
	protected GtkIconTheme* gtkIconTheme;

	/** Get the main Gtk struct */
	public GtkIconTheme* getIconThemeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkIconTheme;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkIconTheme;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkIconTheme* gtkIconTheme, bool ownedRef = false)
	{
		this.gtkIconTheme = gtkIconTheme;
		super(cast(GObject*)gtkIconTheme, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_icon_theme_get_type();
	}

	/**
	 * Creates a new icon theme object. Icon theme objects are used
	 * to lookup up an icon by name in a particular icon theme.
	 * Usually, you’ll want to use gtk_icon_theme_get_default()
	 * or gtk_icon_theme_get_for_display() rather than creating
	 * a new icon theme object for scratch.
	 *
	 * Returns: the newly created #GtkIconTheme object.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_icon_theme_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkIconTheme*) __p, true);
	}

	/**
	 * Gets the icon theme for the default display. See
	 * gtk_icon_theme_get_for_display().
	 *
	 * Returns: A unique #GtkIconTheme associated with
	 *     the default display. This icon theme is associated with
	 *     the display and can be used as long as the display
	 *     is open. Do not ref or unref it.
	 */
	public static IconTheme getDefault()
	{
		auto __p = gtk_icon_theme_get_default();

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(IconTheme)(cast(GtkIconTheme*) __p);
	}

	/**
	 * Gets the icon theme object associated with @display; if this
	 * function has not previously been called for the given
	 * display, a new icon theme object will be created and
	 * associated with the display. Icon theme objects are
	 * fairly expensive to create, so using this function
	 * is usually a better choice than calling than gtk_icon_theme_new()
	 * and setting the display yourself; by using this function
	 * a single icon theme object will be shared between users.
	 *
	 * Params:
	 *     display = a #GdkDisplay
	 *
	 * Returns: A unique #GtkIconTheme associated with
	 *     the given display. This icon theme is associated with
	 *     the display and can be used as long as the display
	 *     is open. Do not ref or unref it.
	 */
	public static IconTheme getForDisplay(Display display)
	{
		auto __p = gtk_icon_theme_get_for_display((display is null) ? null : display.getDisplayStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(IconTheme)(cast(GtkIconTheme*) __p);
	}

	/**
	 * Adds a resource path that will be looked at when looking
	 * for icons, similar to search paths.
	 *
	 * This function should be used to make application-specific icons
	 * available as part of the icon theme.
	 *
	 * The resources are considered as part of the hicolor icon theme
	 * and must be located in subdirectories that are defined in the
	 * hicolor icon theme, such as `@path/16x16/actions/run.png`.
	 * Icons that are directly placed in the resource path instead
	 * of a subdirectory are also considered as ultimate fallback.
	 *
	 * Params:
	 *     path = a resource path
	 */
	public void addResourcePath(string path)
	{
		gtk_icon_theme_add_resource_path(gtkIconTheme, Str.toStringz(path));
	}

	/**
	 * Appends a directory to the search path.
	 * See gtk_icon_theme_set_search_path().
	 *
	 * Params:
	 *     path = directory name to append to the icon path
	 */
	public void appendSearchPath(string path)
	{
		gtk_icon_theme_append_search_path(gtkIconTheme, Str.toStringz(path));
	}

	/**
	 * Looks up a named icon and returns a #GtkIconInfo containing
	 * information such as the filename of the icon. The icon
	 * can then be rendered into a pixbuf using
	 * gtk_icon_info_load_icon(). (gtk_icon_theme_load_icon()
	 * combines these two steps if all you need is the pixbuf.)
	 *
	 * If @icon_names contains more than one name, this function
	 * tries them all in the given order before falling back to
	 * inherited icon themes.
	 *
	 * Params:
	 *     iconNames = %NULL-terminated array of
	 *         icon names to lookup
	 *     size = desired icon size
	 *     flags = flags modifying the behavior of the icon lookup
	 *
	 * Returns: a #GtkIconInfo object
	 *     containing information about the icon, or %NULL if the icon wasn’t
	 *     found.
	 */
	public IconInfo chooseIcon(string[] iconNames, int size, GtkIconLookupFlags flags)
	{
		auto __p = gtk_icon_theme_choose_icon(gtkIconTheme, Str.toStringzArray(iconNames), size, flags);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(IconInfo)(cast(GtkIconInfo*) __p, true);
	}

	/**
	 * Looks up a named icon for a particular window scale and returns
	 * a #GtkIconInfo containing information such as the filename of the
	 * icon. The icon can then be rendered into a pixbuf using
	 * gtk_icon_info_load_icon(). (gtk_icon_theme_load_icon()
	 * combines these two steps if all you need is the pixbuf.)
	 *
	 * If @icon_names contains more than one name, this function
	 * tries them all in the given order before falling back to
	 * inherited icon themes.
	 *
	 * Params:
	 *     iconNames = %NULL-terminated
	 *         array of icon names to lookup
	 *     size = desired icon size
	 *     scale = desired scale
	 *     flags = flags modifying the behavior of the icon lookup
	 *
	 * Returns: a #GtkIconInfo object
	 *     containing information about the icon, or %NULL if the
	 *     icon wasn’t found.
	 */
	public IconInfo chooseIconForScale(string[] iconNames, int size, int scale, GtkIconLookupFlags flags)
	{
		auto __p = gtk_icon_theme_choose_icon_for_scale(gtkIconTheme, Str.toStringzArray(iconNames), size, scale, flags);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(IconInfo)(cast(GtkIconInfo*) __p, true);
	}

	/**
	 * Returns an array of integers describing the sizes at which
	 * the icon is available without scaling. A size of -1 means
	 * that the icon is available in a scalable format. The array
	 * is zero-terminated.
	 *
	 * Params:
	 *     iconName = the name of an icon
	 *
	 * Returns: A newly
	 *     allocated array describing the sizes at which the icon is
	 *     available. The array should be freed with g_free() when it is no
	 *     longer needed.
	 */
	public int[] getIconSizes(string iconName)
	{
		auto __p = gtk_icon_theme_get_icon_sizes(gtkIconTheme, Str.toStringz(iconName));

		return __p[0 .. getArrayLength(__p)];
	}

	/**
	 * Gets the current search path. See gtk_icon_theme_set_search_path().
	 *
	 * Params:
	 *     path = location to store a list of icon theme path directories or %NULL.
	 *         The stored value should be freed with g_strfreev().
	 */
	public void getSearchPath(out string path)
	{
		char* outpath = null;
		int nElements;

		gtk_icon_theme_get_search_path(gtkIconTheme, &outpath, &nElements);

		path = Str.toString(outpath, nElements);
	}

	/**
	 * Checks whether an icon theme includes an icon
	 * for a particular name.
	 *
	 * Params:
	 *     iconName = the name of an icon
	 *
	 * Returns: %TRUE if @self includes an
	 *     icon for @icon_name.
	 */
	public bool hasIcon(string iconName)
	{
		return gtk_icon_theme_has_icon(gtkIconTheme, Str.toStringz(iconName)) != 0;
	}

	/**
	 * Lists the icons in the current icon theme. Only a subset
	 * of the icons can be listed by providing a context string.
	 * The set of values for the context string is system dependent,
	 * but will typically include such values as “Applications” and
	 * “MimeTypes”. Contexts are explained in the
	 * [Icon Theme Specification](http://www.freedesktop.org/wiki/Specifications/icon-theme-spec).
	 * The standard contexts are listed in the
	 * [Icon Naming Specification](http://www.freedesktop.org/wiki/Specifications/icon-naming-spec).
	 *
	 * Params:
	 *     context = a string identifying a particular type of
	 *         icon, or %NULL to list all icons.
	 *
	 * Returns: a #GList list
	 *     holding the names of all the icons in the theme. You must
	 *     first free each element in the list with g_free(), then
	 *     free the list itself with g_list_free().
	 */
	public ListG listIcons(string context)
	{
		auto __p = gtk_icon_theme_list_icons(gtkIconTheme, Str.toStringz(context));

		if(__p is null)
		{
			return null;
		}

		return new ListG(cast(GList*) __p, true);
	}

	/**
	 * Looks up an icon in an icon theme, scales it to the given size
	 * and renders it into a pixbuf. This is a convenience function;
	 * if more details about the icon are needed, use
	 * gtk_icon_theme_lookup_icon() followed by gtk_icon_info_load_icon().
	 *
	 * Note that you probably want to listen for icon theme changes and
	 * update the icon. This is usually done by connecting to the
	 * GtkWidget::style-set signal. If for some reason you do not want to
	 * update the icon when the icon theme changes, you should consider
	 * using gdk_pixbuf_copy() to make a private copy of the pixbuf
	 * returned by this function. Otherwise GTK+ may need to keep the old
	 * icon theme loaded, which would be a waste of memory.
	 *
	 * Params:
	 *     iconName = the name of the icon to lookup
	 *     size = the desired icon size. The resulting icon may not be
	 *         exactly this size; see gtk_icon_info_load_icon().
	 *     flags = flags modifying the behavior of the icon lookup
	 *
	 * Returns: the rendered icon; this may be
	 *     a newly created icon or a new reference to an internal icon, so
	 *     you must not modify the icon. Use g_object_unref() to release
	 *     your reference to the icon. %NULL if the icon isn’t found.
	 *
	 * Throws: GException on failure.
	 */
	public PaintableIF loadIcon(string iconName, int size, GtkIconLookupFlags flags)
	{
		GError* err = null;

		auto __p = gtk_icon_theme_load_icon(gtkIconTheme, Str.toStringz(iconName), size, flags, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PaintableIF)(cast(GdkPaintable*) __p, true);
	}

	/**
	 * Looks up an icon in an icon theme for a particular window scale,
	 * scales it to the given size and renders it into a pixbuf. This is a
	 * convenience function; if more details about the icon are needed,
	 * use gtk_icon_theme_lookup_icon() followed by
	 * gtk_icon_info_load_icon().
	 *
	 * Note that you probably want to listen for icon theme changes and
	 * update the icon. This is usually done by connecting to the
	 * GtkWidget::style-set signal. If for some reason you do not want to
	 * update the icon when the icon theme changes, you should consider
	 * using gdk_pixbuf_copy() to make a private copy of the pixbuf
	 * returned by this function. Otherwise GTK+ may need to keep the old
	 * icon theme loaded, which would be a waste of memory.
	 *
	 * Params:
	 *     iconName = the name of the icon to lookup
	 *     size = the desired icon size. The resulting icon may not be
	 *         exactly this size; see gtk_icon_info_load_icon().
	 *     scale = desired scale
	 *     flags = flags modifying the behavior of the icon lookup
	 *
	 * Returns: the rendered icon; this may be
	 *     a newly created icon or a new reference to an internal icon, so
	 *     you must not modify the icon. Use g_object_unref() to release
	 *     your reference to the icon. %NULL if the icon isn’t found.
	 *
	 * Throws: GException on failure.
	 */
	public PaintableIF loadIconForScale(string iconName, int size, int scale, GtkIconLookupFlags flags)
	{
		GError* err = null;

		auto __p = gtk_icon_theme_load_icon_for_scale(gtkIconTheme, Str.toStringz(iconName), size, scale, flags, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PaintableIF)(cast(GdkPaintable*) __p, true);
	}

	/**
	 * Looks up an icon and returns a #GtkIconInfo containing information
	 * such as the filename of the icon. The icon can then be rendered
	 * into a pixbuf using gtk_icon_info_load_icon().
	 *
	 * When rendering on displays with high pixel densities you should not
	 * use a @size multiplied by the scaling factor returned by functions
	 * like gdk_surface_get_scale_factor(). Instead, you should use
	 * gtk_icon_theme_lookup_by_gicon_for_scale(), as the assets loaded
	 * for a given scaling factor may be different.
	 *
	 * Params:
	 *     icon = the #GIcon to look up
	 *     size = desired icon size
	 *     flags = flags modifying the behavior of the icon lookup
	 *
	 * Returns: a #GtkIconInfo containing
	 *     information about the icon, or %NULL if the icon wasn’t
	 *     found. Unref with g_object_unref()
	 */
	public IconInfo lookupByGicon(IconIF icon, int size, GtkIconLookupFlags flags)
	{
		auto __p = gtk_icon_theme_lookup_by_gicon(gtkIconTheme, (icon is null) ? null : icon.getIconStruct(), size, flags);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(IconInfo)(cast(GtkIconInfo*) __p, true);
	}

	/**
	 * Looks up an icon and returns a #GtkIconInfo containing information
	 * such as the filename of the icon. The icon can then be rendered into
	 * a pixbuf using gtk_icon_info_load_icon().
	 *
	 * Params:
	 *     icon = the #GIcon to look up
	 *     size = desired icon size
	 *     scale = the desired scale
	 *     flags = flags modifying the behavior of the icon lookup
	 *
	 * Returns: a #GtkIconInfo containing
	 *     information about the icon, or %NULL if the icon wasn’t
	 *     found. Unref with g_object_unref()
	 */
	public IconInfo lookupByGiconForScale(IconIF icon, int size, int scale, GtkIconLookupFlags flags)
	{
		auto __p = gtk_icon_theme_lookup_by_gicon_for_scale(gtkIconTheme, (icon is null) ? null : icon.getIconStruct(), size, scale, flags);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(IconInfo)(cast(GtkIconInfo*) __p, true);
	}

	/**
	 * Looks up a named icon and returns a #GtkIconInfo containing
	 * information such as the filename of the icon. The icon
	 * can then be rendered into a pixbuf using
	 * gtk_icon_info_load_icon(). (gtk_icon_theme_load_icon()
	 * combines these two steps if all you need is the pixbuf.)
	 *
	 * When rendering on displays with high pixel densities you should not
	 * use a @size multiplied by the scaling factor returned by functions
	 * like gdk_surface_get_scale_factor(). Instead, you should use
	 * gtk_icon_theme_lookup_icon_for_scale(), as the assets loaded
	 * for a given scaling factor may be different.
	 *
	 * Params:
	 *     iconName = the name of the icon to lookup
	 *     size = desired icon size
	 *     flags = flags modifying the behavior of the icon lookup
	 *
	 * Returns: a #GtkIconInfo object
	 *     containing information about the icon, or %NULL if the
	 *     icon wasn’t found.
	 */
	public IconInfo lookupIcon(string iconName, int size, GtkIconLookupFlags flags)
	{
		auto __p = gtk_icon_theme_lookup_icon(gtkIconTheme, Str.toStringz(iconName), size, flags);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(IconInfo)(cast(GtkIconInfo*) __p, true);
	}

	/**
	 * Looks up a named icon for a particular window scale and returns a
	 * #GtkIconInfo containing information such as the filename of the
	 * icon. The icon can then be rendered into a pixbuf using
	 * gtk_icon_info_load_icon(). (gtk_icon_theme_load_icon() combines
	 * these two steps if all you need is the pixbuf.)
	 *
	 * Params:
	 *     iconName = the name of the icon to lookup
	 *     size = desired icon size
	 *     scale = the desired scale
	 *     flags = flags modifying the behavior of the icon lookup
	 *
	 * Returns: a #GtkIconInfo object
	 *     containing information about the icon, or %NULL if the
	 *     icon wasn’t found.
	 */
	public IconInfo lookupIconForScale(string iconName, int size, int scale, GtkIconLookupFlags flags)
	{
		auto __p = gtk_icon_theme_lookup_icon_for_scale(gtkIconTheme, Str.toStringz(iconName), size, scale, flags);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(IconInfo)(cast(GtkIconInfo*) __p, true);
	}

	/**
	 * Prepends a directory to the search path.
	 * See gtk_icon_theme_set_search_path().
	 *
	 * Params:
	 *     path = directory name to prepend to the icon path
	 */
	public void prependSearchPath(string path)
	{
		gtk_icon_theme_prepend_search_path(gtkIconTheme, Str.toStringz(path));
	}

	/**
	 * Checks to see if the icon theme has changed; if it has, any
	 * currently cached information is discarded and will be reloaded
	 * next time @self is accessed.
	 *
	 * Returns: %TRUE if the icon theme has changed and needed
	 *     to be reloaded.
	 */
	public bool rescanIfNeeded()
	{
		return gtk_icon_theme_rescan_if_needed(gtkIconTheme) != 0;
	}

	/**
	 * Sets the name of the icon theme that the #GtkIconTheme object uses
	 * overriding system configuration. This function cannot be called
	 * on the icon theme objects returned from gtk_icon_theme_get_default()
	 * and gtk_icon_theme_get_for_display().
	 *
	 * Params:
	 *     themeName = name of icon theme to use instead of
	 *         configured theme, or %NULL to unset a previously set custom theme
	 */
	public void setCustomTheme(string themeName)
	{
		gtk_icon_theme_set_custom_theme(gtkIconTheme, Str.toStringz(themeName));
	}

	/**
	 * Sets the display for an icon theme; the display is used
	 * to track the user’s currently configured icon theme,
	 * which might be different for different displays.
	 *
	 * Params:
	 *     display = a #GdkDisplay
	 */
	public void setDisplay(Display display)
	{
		gtk_icon_theme_set_display(gtkIconTheme, (display is null) ? null : display.getDisplayStruct());
	}

	/**
	 * Sets the search path for the icon theme object. When looking
	 * for an icon theme, GTK+ will search for a subdirectory of
	 * one or more of the directories in @path with the same name
	 * as the icon theme containing an index.theme file. (Themes from
	 * multiple of the path elements are combined to allow themes to be
	 * extended by adding icons in the user’s home directory.)
	 *
	 * In addition if an icon found isn’t found either in the current
	 * icon theme or the default icon theme, and an image file with
	 * the right name is found directly in one of the elements of
	 * @path, then that image will be used for the icon name.
	 * (This is legacy feature, and new icons should be put
	 * into the fallback icon theme, which is called hicolor,
	 * rather than directly on the icon path.)
	 *
	 * Params:
	 *     path = array of
	 *         directories that are searched for icon themes
	 */
	public void setSearchPath(string[] path)
	{
		gtk_icon_theme_set_search_path(gtkIconTheme, Str.toStringzArray(path), cast(int)path.length);
	}

	/**
	 * Emitted when the current icon theme is switched or GTK+ detects
	 * that a change has occurred in the contents of the current
	 * icon theme.
	 */
	gulong addOnChanged(void delegate(IconTheme) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "changed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
