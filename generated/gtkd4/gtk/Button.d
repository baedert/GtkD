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


module gtk.Button;

private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.ActionableIF;
private import gtk.ActionableT;
private import gtk.Bin;
private import gtk.Image;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;
private import std.algorithm;


/**
 * The #GtkButton widget is generally used to trigger a callback function that is
 * called when the button is pressed.  The various signals and how to use them
 * are outlined below.
 * 
 * The #GtkButton widget can hold any valid child widget.  That is, it can hold
 * almost any other standard #GtkWidget.  The most commonly used child is the
 * #GtkLabel.
 * 
 * # CSS nodes
 * 
 * GtkButton has a single CSS node with name button. The node will get the
 * style classes .image-button or .text-button, if the content is just an
 * image or label, respectively. It may also receive the .flat style class.
 * 
 * Other style classes that are commonly used with GtkButton include
 * .suggested-action and .destructive-action. In special cases, buttons
 * can be made round by adding the .circular style class.
 * 
 * Button-like widgets like #GtkToggleButton, #GtkMenuButton, #GtkVolumeButton,
 * #GtkLockButton, #GtkColorButton or #GtkFontButton use style classes such as
 * .toggle, .popup, .scale, .lock, .color on the button node
 * to differentiate themselves from a plain GtkButton.
 */
public class Button : Bin, ActionableIF
{
	/** the main Gtk struct */
	protected GtkButton* gtkButton;

	/** Get the main Gtk struct */
	public GtkButton* getButtonStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkButton;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkButton;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkButton* gtkButton, bool ownedRef = false)
	{
		this.gtkButton = gtkButton;
		super(cast(GtkBin*)gtkButton, ownedRef);
	}

	// add the Actionable capabilities
	mixin ActionableT!(GtkButton);

	/**
	 * Creates a new GtkButton containing a label.
	 * If characters in label are preceded by an underscore, they are underlined.
	 * If you need a literal underscore character in a label, use '__' (two
	 * underscores). The first underlined character represents a keyboard
	 * accelerator called a mnemonic.
	 * Pressing Alt and that key activates the button.
	 * Params:
	 *  label = The text of the button, with an underscore in front of the
	 *  mnemonic character
	 *  mnemonic = true if the button has an mnemnonic
	 * Returns:
	 *  a new GtkButton
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this (string label, bool mnemonic=true)
	{
		GtkButton* p;

		if ( mnemonic )
		{
			// GtkWidget* gtk_button_new_with_mnemonic (const gchar *label);
			p = cast(GtkButton*)gtk_button_new_with_mnemonic(Str.toStringz(label));
		}
		else
		{
			// GtkWidget* gtk_button_new_with_label (const gchar *label);
			p = cast(GtkButton*)gtk_button_new_with_label(Str.toStringz(label));
		}

		if(p is null)
		{
			throw new ConstructionException("null returned by gtk_button_new_with_label");
		}

		this(p);
	}

	/** */
	public this(string label, void delegate(Button) dlg, bool mnemonic=true)
	{
		this(label, mnemonic);
		addOnClicked(dlg);
	}

	/** */
	public this(string label, void delegate(Button) dlg, string action)
	{
		this(label);
		setActionName(action);
		addOnClicked(dlg);
	}

	/**
	 */

	/** */
	public static GType getType()
	{
		return gtk_button_get_type();
	}

	/**
	 * Creates a new #GtkButton widget. To add a child widget to the button,
	 * use gtk_container_add().
	 *
	 * Returns: The newly created #GtkButton widget.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_button_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkButton*) __p);
	}

	/**
	 * Creates a new button containing an icon from the current icon theme.
	 *
	 * If the icon name isn’t known, a “broken image” icon will be
	 * displayed instead. If the current icon theme is changed, the icon
	 * will be updated appropriately.
	 *
	 * Params:
	 *     iconName = an icon name or %NULL
	 *
	 * Returns: a new #GtkButton displaying the themed icon
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string iconName)
	{
		auto __p = gtk_button_new_from_icon_name(Str.toStringz(iconName));

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_from_icon_name");
		}

		this(cast(GtkButton*) __p);
	}

	/**
	 * Returns the icon name set via gtk_button_set_icon_name().
	 *
	 * Returns: The icon name set via gtk_button_set_icon_name()
	 */
	public string getIconName()
	{
		return Str.toString(gtk_button_get_icon_name(gtkButton));
	}

	/**
	 * Fetches the text from the label of the button, as set by
	 * gtk_button_set_label(). If the label text has not
	 * been set the return value will be %NULL. This will be the
	 * case if you create an empty button with gtk_button_new() to
	 * use as a container.
	 *
	 * Returns: The text of the label widget. This string is owned
	 *     by the widget and must not be modified or freed.
	 */
	public string getLabel()
	{
		return Str.toString(gtk_button_get_label(gtkButton));
	}

	/**
	 * Returns the current relief style of the given #GtkButton.
	 *
	 * Returns: The current #GtkReliefStyle
	 */
	public GtkReliefStyle getRelief()
	{
		return gtk_button_get_relief(gtkButton);
	}

	/**
	 * Returns whether an embedded underline in the button label indicates a
	 * mnemonic. See gtk_button_set_use_underline().
	 *
	 * Returns: %TRUE if an embedded underline in the button label
	 *     indicates the mnemonic accelerator keys.
	 */
	public bool getUseUnderline()
	{
		return gtk_button_get_use_underline(gtkButton) != 0;
	}

	/**
	 * Adds a #GtkImage with the given icon name as a child. If @button already
	 * contains a child widget, that child widget will be removed and replaced
	 * with the image.
	 *
	 * Params:
	 *     iconName = An icon name
	 */
	public void setIconName(string iconName)
	{
		gtk_button_set_icon_name(gtkButton, Str.toStringz(iconName));
	}

	/**
	 * Sets the text of the label of the button to @label.
	 *
	 * This will also clear any previously set labels.
	 *
	 * Params:
	 *     label = a string
	 */
	public void setLabel(string label)
	{
		gtk_button_set_label(gtkButton, Str.toStringz(label));
	}

	/**
	 * Sets the relief style of the edges of the given #GtkButton widget.
	 * Two styles exist, %GTK_RELIEF_NORMAL and %GTK_RELIEF_NONE.
	 * The default style is, as one can guess, %GTK_RELIEF_NORMAL.
	 *
	 * Params:
	 *     relief = The GtkReliefStyle as described above
	 */
	public void setRelief(GtkReliefStyle relief)
	{
		gtk_button_set_relief(gtkButton, relief);
	}

	/**
	 * If true, an underline in the text of the button label indicates
	 * the next character should be used for the mnemonic accelerator key.
	 *
	 * Params:
	 *     useUnderline = %TRUE if underlines in the text indicate mnemonics
	 */
	public void setUseUnderline(bool useUnderline)
	{
		gtk_button_set_use_underline(gtkButton, useUnderline);
	}

	/**
	 * The ::activate signal on GtkButton is an action signal and
	 * emitting it causes the button to animate press then release.
	 * Applications should never connect to this signal, but use the
	 * #GtkButton::clicked signal.
	 */
	gulong addOnActivate(void delegate(Button) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "activate", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted when the button has been activated (pressed and released).
	 */
	gulong addOnClicked(void delegate(Button) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "clicked", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
