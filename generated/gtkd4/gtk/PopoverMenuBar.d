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


module gtk.PopoverMenuBar;

private import gio.MenuModel;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * GtkPopoverMenuBar presents a horizontal bar of items that pop
 * up popover menus when clicked.
 * 
 * The only way to create instances of GtkPopoverMenuBar is
 * from a #GMenuModel.
 * 
 * # CSS nodes
 * 
 * |[<!-- language="plain" -->
 * menubar
 * ├── item[.active]
 * ┊   ╰── popover
 * ╰── item
 * ╰── popover
 * ]|
 * 
 * GtkPopoverMenuBar has a single CSS node with name menubar, below which
 * each item has its CSS node, and below that the corresponding popover.
 * 
 * The item whose popover is currently open gets the .active
 * style class.
 */
public class PopoverMenuBar : Widget
{
	/** the main Gtk struct */
	protected GtkPopoverMenuBar* gtkPopoverMenuBar;

	/** Get the main Gtk struct */
	public GtkPopoverMenuBar* getPopoverMenuBarStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkPopoverMenuBar;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkPopoverMenuBar;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkPopoverMenuBar* gtkPopoverMenuBar, bool ownedRef = false)
	{
		this.gtkPopoverMenuBar = gtkPopoverMenuBar;
		super(cast(GtkWidget*)gtkPopoverMenuBar, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_popover_menu_bar_get_type();
	}

	/**
	 * Creates a #GtkPopoverMenuBar from a #GMenuModel.
	 *
	 * Params:
	 *     model = a #GMenuModel, or %NULL
	 *
	 * Returns: a new #GtkPopoverMenuBar
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(MenuModel model)
	{
		auto __p = gtk_popover_menu_bar_new_from_model((model is null) ? null : model.getMenuModelStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_from_model");
		}

		this(cast(GtkPopoverMenuBar*) __p);
	}

	/**
	 * Returns the model from which the contents of @bar are taken.
	 *
	 * Returns: a #GMenuModel
	 */
	public MenuModel getMenuModel()
	{
		auto __p = gtk_popover_menu_bar_get_menu_model(gtkPopoverMenuBar);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(MenuModel)(cast(GMenuModel*) __p);
	}

	/**
	 * Sets a menu model from which @bar should take
	 * its contents.
	 *
	 * Params:
	 *     model = a #GMenuModel, or %NULL
	 */
	public void setMenuModel(MenuModel model)
	{
		gtk_popover_menu_bar_set_menu_model(gtkPopoverMenuBar, (model is null) ? null : model.getMenuModelStruct());
	}
}
