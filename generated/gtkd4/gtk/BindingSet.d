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


module gtk.BindingSet;

private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * A binding set maintains a list of activatable key bindings.
 * A single binding set can match multiple types of widgets.
 * Similar to style contexts, can be matched by any information contained
 * in a widgets #GtkWidgetPath. When a binding within a set is matched upon
 * activation, an action signal is emitted on the target widget to carry out
 * the actual activation.
 */
public class BindingSet
{
	/** the main Gtk struct */
	protected GtkBindingSet* gtkBindingSet;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GtkBindingSet* getBindingSetStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkBindingSet;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gtkBindingSet;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkBindingSet* gtkBindingSet, bool ownedRef = false)
	{
		this.gtkBindingSet = gtkBindingSet;
		this.ownedRef = ownedRef;
	}


	/**
	 * Find a key binding matching @keyval and @modifiers within
	 * @binding_set and activate the binding on @object.
	 *
	 * Params:
	 *     keyval = key value of the binding
	 *     modifiers = key modifier of the binding
	 *     object = object to activate when binding found
	 *
	 * Returns: %TRUE if a binding was found and activated
	 */
	public bool activate(uint keyval, GdkModifierType modifiers, ObjectG object)
	{
		return gtk_binding_set_activate(gtkBindingSet, keyval, modifiers, (object is null) ? null : object.getObjectGStruct()) != 0;
	}

	/**
	 * This function returns the binding set named after the type name of
	 * the passed in class structure. New binding sets are created on
	 * demand by this function.
	 *
	 * Params:
	 *     objectClass = a valid #GObject class
	 *
	 * Returns: the binding set corresponding to
	 *     @object_class
	 */
	public static BindingSet byClass(void* objectClass)
	{
		auto __p = gtk_binding_set_by_class(objectClass);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(BindingSet)(cast(GtkBindingSet*) __p);
	}

	/**
	 * Find a binding set by its globally unique name.
	 *
	 * The @set_name can either be a name used for gtk_binding_set_new()
	 * or the type name of a class used in gtk_binding_set_by_class().
	 *
	 * Params:
	 *     setName = unique binding set name
	 *
	 * Returns: %NULL or the specified binding set
	 */
	public static BindingSet find(string setName)
	{
		auto __p = gtk_binding_set_find(Str.toStringz(setName));

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(BindingSet)(cast(GtkBindingSet*) __p);
	}

	/**
	 * GTK+ maintains a global list of binding sets. Each binding set has
	 * a unique name which needs to be specified upon creation.
	 *
	 * Params:
	 *     setName = unique name of this binding set
	 *
	 * Returns: new binding set
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string setName)
	{
		auto __p = gtk_binding_set_new(Str.toStringz(setName));

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkBindingSet*) __p);
	}

	/**
	 * Find a key binding matching @keyval and @modifiers and activate the
	 * binding on @object.
	 *
	 * Params:
	 *     object = object to activate when binding found
	 *     keyval = key value of the binding
	 *     modifiers = key modifier of the binding
	 *
	 * Returns: %TRUE if a binding was found and activated
	 */
	public static bool bindingsActivate(ObjectG object, uint keyval, GdkModifierType modifiers)
	{
		return gtk_bindings_activate((object is null) ? null : object.getObjectGStruct(), keyval, modifiers) != 0;
	}

	/**
	 * Looks up key bindings for @object to find one matching
	 * @event, and if one was found, activate it.
	 *
	 * Params:
	 *     object = a #GObject (generally must be a widget)
	 *     event = a #GdkEventKey
	 *
	 * Returns: %TRUE if a matching key binding was found
	 */
	public static bool bindingsActivateEvent(ObjectG object, GdkEventKey* event)
	{
		return gtk_bindings_activate_event((object is null) ? null : object.getObjectGStruct(), event) != 0;
	}
}
