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


module gtk.Builder;

private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.MemorySlice;
private import glib.Module;
private import glib.Str;
private import glib.c.functions;
private import gobject.Closure;
private import gobject.ObjectG;
private import gobject.ParamSpec;
private import gobject.Type;
private import gobject.Value;
private import gobject.c.functions;
private import gtk.BuilderScopeIF;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;
private import gtkd.paths;
private import std.string;


/**
 * A GtkBuilder is an auxiliary object that reads textual descriptions
 * of a user interface and instantiates the described objects. To create
 * a GtkBuilder from a user interface description, call
 * gtk_builder_new_from_file(), gtk_builder_new_from_resource() or
 * gtk_builder_new_from_string().
 * 
 * In the (unusual) case that you want to add user interface
 * descriptions from multiple sources to the same GtkBuilder you can
 * call gtk_builder_new() to get an empty builder and populate it by
 * (multiple) calls to gtk_builder_add_from_file(),
 * gtk_builder_add_from_resource() or gtk_builder_add_from_string().
 * 
 * A GtkBuilder holds a reference to all objects that it has constructed
 * and drops these references when it is finalized. This finalization can
 * cause the destruction of non-widget objects or widgets which are not
 * contained in a toplevel window. For toplevel windows constructed by a
 * builder, it is the responsibility of the user to call gtk_widget_destroy()
 * to get rid of them and all the widgets they contain.
 * 
 * The functions gtk_builder_get_object() and gtk_builder_get_objects()
 * can be used to access the widgets in the interface by the names assigned
 * to them inside the UI description. Toplevel windows returned by these
 * functions will stay around until the user explicitly destroys them
 * with gtk_widget_destroy(). Other widgets will either be part of a
 * larger hierarchy constructed by the builder (in which case you should
 * not have to worry about their lifecycle), or without a parent, in which
 * case they have to be added to some container to make use of them.
 * Non-widget objects need to be reffed with g_object_ref() to keep them
 * beyond the lifespan of the builder.
 * 
 * The function gtk_builder_connect_signals() and variants thereof can be
 * used to connect handlers to the named signals in the description.
 * 
 * # GtkBuilder UI Definitions # {#BUILDER-UI}
 * 
 * GtkBuilder parses textual descriptions of user interfaces which are
 * specified in an XML format which can be roughly described by the
 * RELAX NG schema below. We refer to these descriptions as “GtkBuilder
 * UI definitions” or just “UI definitions” if the context is clear.
 * 
 * [RELAX NG Compact Syntax](https://gitlab.gnome.org/GNOME/gtk/tree/master/gtk/gtkbuilder.rnc)
 * 
 * The toplevel element is <interface>. It optionally takes a “domain”
 * attribute, which will make the builder look for translated strings
 * using dgettext() in the domain specified. This can also be done by
 * calling gtk_builder_set_translation_domain() on the builder.
 * Objects are described by <object> elements, which can contain
 * <property> elements to set properties, <signal> elements which
 * connect signals to handlers, and <child> elements, which describe
 * child objects (most often widgets inside a container, but also e.g.
 * actions in an action group, or columns in a tree model). A <child>
 * element contains an <object> element which describes the child object.
 * The target toolkit version(s) are described by <requires> elements,
 * the “lib” attribute specifies the widget library in question (currently
 * the only supported value is “gtk+”) and the “version” attribute specifies
 * the target version in the form “<major>.<minor>”. The builder will error
 * out if the version requirements are not met.
 * 
 * Typically, the specific kind of object represented by an <object>
 * element is specified by the “class” attribute. If the type has not
 * been loaded yet, GTK+ tries to find the get_type() function from the
 * class name by applying heuristics. This works in most cases, but if
 * necessary, it is possible to specify the name of the get_type() function
 * explictly with the "type-func" attribute. As a special case, GtkBuilder
 * allows to use an object that has been constructed by a #GtkUIManager in
 * another part of the UI definition by specifying the id of the #GtkUIManager
 * in the “constructor” attribute and the name of the object in the “id”
 * attribute.
 * 
 * Objects may be given a name with the “id” attribute, which allows the
 * application to retrieve them from the builder with gtk_builder_get_object().
 * An id is also necessary to use the object as property value in other
 * parts of the UI definition. GTK+ reserves ids starting and ending
 * with ___ (3 underscores) for its own purposes.
 * 
 * Setting properties of objects is pretty straightforward with the
 * <property> element: the “name” attribute specifies the name of the
 * property, and the content of the element specifies the value.
 * If the “translatable” attribute is set to a true value, GTK+ uses
 * gettext() (or dgettext() if the builder has a translation domain set)
 * to find a translation for the value. This happens before the value
 * is parsed, so it can be used for properties of any type, but it is
 * probably most useful for string properties. It is also possible to
 * specify a context to disambiguate short strings, and comments which
 * may help the translators.
 * 
 * GtkBuilder can parse textual representations for the most common
 * property types: characters, strings, integers, floating-point numbers,
 * booleans (strings like “TRUE”, “t”, “yes”, “y”, “1” are interpreted
 * as %TRUE, strings like “FALSE”, “f”, “no”, “n”, “0” are interpreted
 * as %FALSE), enumerations (can be specified by their name, nick or
 * integer value), flags (can be specified by their name, nick, integer
 * value, optionally combined with “|”, e.g. “GTK_VISIBLE|GTK_REALIZED”)
 * and colors (in a format understood by gdk_rgba_parse()).
 * 
 * GVariants can be specified in the format understood by g_variant_parse(),
 * and pixbufs can be specified as a filename of an image file to load.
 * 
 * Objects can be referred to by their name and by default refer to
 * objects declared in the local xml fragment and objects exposed via
 * gtk_builder_expose_object(). In general, GtkBuilder allows forward
 * references to objects — declared in the local xml; an object doesn’t
 * have to be constructed before it can be referred to. The exception
 * to this rule is that an object has to be constructed before it can
 * be used as the value of a construct-only property.
 * 
 * It is also possible to bind a property value to another object's
 * property value using the attributes
 * "bind-source" to specify the source object of the binding, and
 * optionally, "bind-property" and "bind-flags" to specify the
 * source property and source binding flags respectively.
 * Internally builder implements this using GBinding objects.
 * For more information see g_object_bind_property()
 * 
 * Sometimes it is necessary to refer to widgets which have implicitly
 * been constructed by GTK+ as part of a composite widget, to set
 * properties on them or to add further children (e.g. the @vbox of
 * a #GtkDialog). This can be achieved by setting the “internal-child”
 * property of the <child> element to a true value. Note that GtkBuilder
 * still requires an <object> element for the internal child, even if it
 * has already been constructed.
 * 
 * A number of widgets have different places where a child can be added
 * (e.g. tabs vs. page content in notebooks). This can be reflected in
 * a UI definition by specifying the “type” attribute on a <child>
 * The possible values for the “type” attribute are described in the
 * sections describing the widget-specific portions of UI definitions.
 * 
 * # Signal handlers and function pointers
 * 
 * Signal handlers are set up with the <signal> element. The “name”
 * attribute specifies the name of the signal, and the “handler” attribute
 * specifies the function to connect to the signal.
 * The remaining attributes, “after”, “swapped” and “object”, have the
 * same meaning as the corresponding parameters of the
 * g_signal_connect_object() or g_signal_connect_data() functions. A
 * “last_modification_time” attribute is also allowed, but it does not
 * have a meaning to the builder.
 * 
 * If you rely on #GModule support to lookup callbacks in the symbol table,
 * the following details should be noted:
 * 
 * When compiling applications for Windows, you must declare signal callbacks
 * with #G_MODULE_EXPORT, or they will not be put in the symbol table.
 * On Linux and Unices, this is not necessary; applications should instead
 * be compiled with the -Wl,--export-dynamic CFLAGS, and linked against
 * gmodule-export-2.0.
 * 
 * # A GtkBuilder UI Definition
 * 
 * |[
 * <interface>
 * <object class="GtkDialog" id="dialog1">
 * <child internal-child="vbox">
 * <object class="GtkBox" id="vbox1">
 * <child internal-child="action_area">
 * <object class="GtkBox" id="hbuttonbox1">
 * <child>
 * <object class="GtkButton" id="ok_button">
 * <property name="label">gtk-ok</property>
 * <signal name="clicked" handler="ok_button_clicked"/>
 * </object>
 * </child>
 * </object>
 * </child>
 * </object>
 * </child>
 * </object>
 * </interface>
 * ]|
 * 
 * Beyond this general structure, several object classes define their
 * own XML DTD fragments for filling in the ANY placeholders in the DTD
 * above. Note that a custom element in a <child> element gets parsed by
 * the custom tag handler of the parent object, while a custom element in
 * an <object> element gets parsed by the custom tag handler of the object.
 * 
 * These XML fragments are explained in the documentation of the
 * respective objects.
 * 
 * Additionally, since 3.10 a special <template> tag has been added
 * to the format allowing one to define a widget class’s components.
 * See the [GtkWidget documentation][composite-templates] for details.
 */
public class Builder : ObjectG
{
	/** the main Gtk struct */
	protected GtkBuilder* gtkBuilder;

	/** Get the main Gtk struct */
	public GtkBuilder* getBuilderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkBuilder;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkBuilder;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkBuilder* gtkBuilder, bool ownedRef = false)
	{
		this.gtkBuilder = gtkBuilder;
		super(cast(GObject*)gtkBuilder, ownedRef);
	}

	/**
	 * Creates a new builder object.
	 * Since 2.12
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this ()
	{
		// GtkBuilder* gtk_builder_new (void);
		auto p = gtk_builder_new();
		if(p is null)
		{
			throw new ConstructionException("null returned by gtk_builder_new()");
		}
		this(cast(GtkBuilder*) p);
	}

	/**
	 * This function is a modification of _gtk_builder_resolve_type_lazily from "gtk/gtkbuilder.c".
	 * It is needed because it assumes we are linking at compile time to the gtk libs.
	 * specifically the NULL in g_module_open( NULL, 0 );
	 * It replaces the default function pointer "get_type_from_name" in GtkBuilderClass.
	 */
	extern(C) private static GType gtk_builder_real_get_type_from_name_override ( GtkBuilder* builder, const(char)* name )
	{
		GType gtype;
		gtype = g_type_from_name( name );
		if (gtype != GType.INVALID)
		{
			return gtype;
		}

		/*
		 * Try to map a type name to a _get_type function
		 * and call it, eg:
		 *
		 * GtkWindow -> gtk_window_get_type
		 * GtkBox -> gtk_hbox_get_type
		 * GtkUIManager -> gtk_ui_manager_get_type
		 *
		 */
		char   c;
		string symbol_name;

		for (int i = 0; name[i] != '\0'; i++)
		{
			c = name[i];
			/* skip if uppercase, first or previous is uppercase */
			if ((c == Str.asciiToupper (c) &&
				i > 0 && name[i-1] != Str.asciiToupper (name[i-1])) ||
			(i > 2 && name[i]   == Str.asciiToupper (name[i]) &&
			name[i-1] == Str.asciiToupper (name[i-1]) &&
			name[i-2] == Str.asciiToupper (name[i-2]))
			)

			symbol_name ~= '_';
			symbol_name ~= Str.asciiTolower (c);
		}
		symbol_name ~=  "_get_type" ;

		/* scan linked librarys for function symbol */
		foreach ( lib; importLibs )
		{
			GType function() func;
			Module mod = Module.open( lib, GModuleFlags.LAZY );
			if( mod is null )
				continue;

			scope(exit) mod.close();

			if ( mod.symbol( symbol_name, cast(void**)&func ) ) {
				return func();
		}
	}

	return GType.INVALID;
}

/**
 * Gets all objects that have been constructed by builder.
 * Since 2.12
 * Returns: an array containing all the objects constructed by the GtkBuilder instance.
 */
public ObjectG[] getObjects()
{
	ObjectG[] objects;

	// GSList* gtk_builder_get_objects (GtkBuilder *builder);
	GSList* list = gtk_builder_get_objects(gtkBuilder);

	while ( list.next !is null )
	{
		objects ~= ObjectG.getDObject!(ObjectG)(cast(GObject*) list.data);
		list = list.next;
	}

	g_slist_free(list);

	return objects;
}

/**
 */

/** */
public static GType getType()
{
	return gtk_builder_get_type();
}

/**
 * Builds the [GtkBuilder UI definition][BUILDER-UI]
 * in the file @filename.
 *
 * If there is an error opening the file or parsing the description then
 * the program will be aborted.  You should only ever attempt to parse
 * user interface descriptions that are shipped as part of your program.
 *
 * Params:
 *     filename = filename of user interface description file
 *
 * Returns: a #GtkBuilder containing the described interface
 *
 * Throws: ConstructionException GTK+ fails to create the object.
 */
public this(string filename)
{
	auto __p = gtk_builder_new_from_file(Str.toStringz(filename));

	if(__p is null)
	{
		throw new ConstructionException("null returned by new_from_file");
	}

	this(cast(GtkBuilder*) __p, true);
}

/**
 * Parses a file containing a [GtkBuilder UI definition][BUILDER-UI]
 * and merges it with the current contents of @builder.
 *
 * Most users will probably want to use gtk_builder_new_from_file().
 *
 * If an error occurs, 0 will be returned and @error will be assigned a
 * #GError from the #GTK_BUILDER_ERROR, #G_MARKUP_ERROR or #G_FILE_ERROR
 * domain.
 *
 * It’s not really reasonable to attempt to handle failures of this
 * call. You should not use this function with untrusted files (ie:
 * files that are not part of your application). Broken #GtkBuilder
 * files can easily crash your program, and it’s possible that memory
 * was leaked leading up to the reported failure. The only reasonable
 * thing to do when an error is detected is to call g_error().
 *
 * Params:
 *     filename = the name of the file to parse
 *
 * Returns: %TRUE on success, %FALSE if an error occurred
 *
 * Throws: GException on failure.
 */
public bool addFromFile(string filename)
{
	GError* err = null;

	auto __p = gtk_builder_add_from_file(gtkBuilder, Str.toStringz(filename), &err) != 0;

	if (err !is null)
	{
		throw new GException( new ErrorG(err) );
	}

	return __p;
}

/**
 * Parses a resource file containing a [GtkBuilder UI definition][BUILDER-UI]
 * and merges it with the current contents of @builder.
 *
 * Most users will probably want to use gtk_builder_new_from_resource().
 *
 * If an error occurs, 0 will be returned and @error will be assigned a
 * #GError from the #GTK_BUILDER_ERROR, #G_MARKUP_ERROR or #G_RESOURCE_ERROR
 * domain.
 *
 * It’s not really reasonable to attempt to handle failures of this
 * call.  The only reasonable thing to do when an error is detected is
 * to call g_error().
 *
 * Params:
 *     resourcePath = the path of the resource file to parse
 *
 * Returns: %TRUE on success, %FALSE if an error occurred
 *
 * Throws: GException on failure.
 */
public bool addFromResource(string resourcePath)
{
	GError* err = null;

	auto __p = gtk_builder_add_from_resource(gtkBuilder, Str.toStringz(resourcePath), &err) != 0;

	if (err !is null)
	{
		throw new GException( new ErrorG(err) );
	}

	return __p;
}

/**
 * Parses a string containing a [GtkBuilder UI definition][BUILDER-UI]
 * and merges it with the current contents of @builder.
 *
 * Most users will probably want to use gtk_builder_new_from_string().
 *
 * Upon errors %FALSE will be returned and @error will be assigned a
 * #GError from the #GTK_BUILDER_ERROR, #G_MARKUP_ERROR or
 * #G_VARIANT_PARSE_ERROR domain.
 *
 * It’s not really reasonable to attempt to handle failures of this
 * call.  The only reasonable thing to do when an error is detected is
 * to call g_error().
 *
 * Params:
 *     buffer = the string to parse
 *
 * Returns: %TRUE on success, %FALSE if an error occurred
 *
 * Throws: GException on failure.
 */
public bool addFromString(string buffer)
{
	GError* err = null;

	auto __p = gtk_builder_add_from_string(gtkBuilder, Str.toStringz(buffer), cast(ptrdiff_t)buffer.length, &err) != 0;

	if (err !is null)
	{
		throw new GException( new ErrorG(err) );
	}

	return __p;
}

/**
 * Parses a file containing a [GtkBuilder UI definition][BUILDER-UI]
 * building only the requested objects and merges
 * them with the current contents of @builder.
 *
 * Upon errors 0 will be returned and @error will be assigned a
 * #GError from the #GTK_BUILDER_ERROR, #G_MARKUP_ERROR or #G_FILE_ERROR
 * domain.
 *
 * If you are adding an object that depends on an object that is not
 * its child (for instance a #GtkTreeView that depends on its
 * #GtkTreeModel), you have to explicitly list all of them in @object_ids.
 *
 * Params:
 *     filename = the name of the file to parse
 *     objectIds = nul-terminated array of objects to build
 *
 * Returns: %TRUE on success, %FALSE if an error occurred
 *
 * Throws: GException on failure.
 */
public bool addObjectsFromFile(string filename, string[] objectIds)
{
	GError* err = null;

	auto __p = gtk_builder_add_objects_from_file(gtkBuilder, Str.toStringz(filename), Str.toStringzArray(objectIds), &err) != 0;

	if (err !is null)
	{
		throw new GException( new ErrorG(err) );
	}

	return __p;
}

/**
 * Parses a resource file containing a [GtkBuilder UI definition][BUILDER-UI]
 * building only the requested objects and merges
 * them with the current contents of @builder.
 *
 * Upon errors 0 will be returned and @error will be assigned a
 * #GError from the #GTK_BUILDER_ERROR, #G_MARKUP_ERROR or #G_RESOURCE_ERROR
 * domain.
 *
 * If you are adding an object that depends on an object that is not
 * its child (for instance a #GtkTreeView that depends on its
 * #GtkTreeModel), you have to explicitly list all of them in @object_ids.
 *
 * Params:
 *     resourcePath = the path of the resource file to parse
 *     objectIds = nul-terminated array of objects to build
 *
 * Returns: %TRUE on success, %FALSE if an error occurred
 *
 * Throws: GException on failure.
 */
public bool addObjectsFromResource(string resourcePath, string[] objectIds)
{
	GError* err = null;

	auto __p = gtk_builder_add_objects_from_resource(gtkBuilder, Str.toStringz(resourcePath), Str.toStringzArray(objectIds), &err) != 0;

	if (err !is null)
	{
		throw new GException( new ErrorG(err) );
	}

	return __p;
}

/**
 * Parses a string containing a [GtkBuilder UI definition][BUILDER-UI]
 * building only the requested objects and merges
 * them with the current contents of @builder.
 *
 * Upon errors %FALSE will be returned and @error will be assigned a
 * #GError from the #GTK_BUILDER_ERROR or #G_MARKUP_ERROR domain.
 *
 * If you are adding an object that depends on an object that is not
 * its child (for instance a #GtkTreeView that depends on its
 * #GtkTreeModel), you have to explicitly list all of them in @object_ids.
 *
 * Params:
 *     buffer = the string to parse
 *     length = the length of @buffer (may be -1 if @buffer is nul-terminated)
 *     objectIds = nul-terminated array of objects to build
 *
 * Returns: %TRUE on success, %FALSE if an error occurred
 *
 * Throws: GException on failure.
 */
public bool addObjectsFromString(string buffer, ptrdiff_t length, string[] objectIds)
{
	GError* err = null;

	auto __p = gtk_builder_add_objects_from_string(gtkBuilder, Str.toStringz(buffer), length, Str.toStringzArray(objectIds), &err) != 0;

	if (err !is null)
	{
		throw new GException( new ErrorG(err) );
	}

	return __p;
}

/**
 * Creates a closure to invoke the function called @function_name.
 *
 * If a closure function was set via gtk_builder_set_closure_func(),
 * will be invoked.
 * Otherwise, gtk_builder_create_cclosure() will be called.
 *
 * If no closure could be created, %NULL will be returned and @error will
 * be set.
 *
 * Params:
 *     functionName = name of the function to look up
 *     flags = closure creation flags
 *     object = Object to create the closure with
 *
 * Returns: A new closure for invoking @function_name
 *
 * Throws: GException on failure.
 */
public Closure createClosure(string functionName, GtkBuilderClosureFlags flags, ObjectG object)
{
	GError* err = null;

	auto __p = gtk_builder_create_closure(gtkBuilder, Str.toStringz(functionName), flags, (object is null) ? null : object.getObjectGStruct(), &err);

	if (err !is null)
	{
		throw new GException( new ErrorG(err) );
	}

	if(__p is null)
	{
		return null;
	}

	return ObjectG.getDObject!(Closure)(cast(GClosure*) __p, true);
}

/**
 * Add @object to the @builder object pool so it can be referenced just like any
 * other object built by builder.
 *
 * Params:
 *     name = the name of the object exposed to the builder
 *     object = the object to expose
 */
public void exposeObject(string name, ObjectG object)
{
	gtk_builder_expose_object(gtkBuilder, Str.toStringz(name), (object is null) ? null : object.getObjectGStruct());
}

/**
 * Main private entry point for building composite container
 * components from template XML.
 *
 * This is exported purely to let gtk-builder-tool validate
 * templates, applications have no need to call this function.
 *
 * Params:
 *     widget = the widget that is being extended
 *     templateType = the type that the template is for
 *     buffer = the string to parse
 *     length = the length of @buffer (may be -1 if @buffer is nul-terminated)
 *
 * Returns: A positive value on success, 0 if an error occurred
 *
 * Throws: GException on failure.
 */
public bool extendWithTemplate(Widget widget, GType templateType, string buffer, ptrdiff_t length)
{
	GError* err = null;

	auto __p = gtk_builder_extend_with_template(gtkBuilder, (widget is null) ? null : widget.getWidgetStruct(), templateType, Str.toStringz(buffer), length, &err) != 0;

	if (err !is null)
	{
		throw new GException( new ErrorG(err) );
	}

	return __p;
}

/**
 * Gets the current object set via gtk_builder_set_current_object().
 *
 * Returns: the current object
 */
public ObjectG getCurrentObject()
{
	auto __p = gtk_builder_get_current_object(gtkBuilder);

	if(__p is null)
	{
		return null;
	}

	return ObjectG.getDObject!(ObjectG)(cast(GObject*) __p);
}

/**
 * Gets the object named @name. Note that this function does not
 * increment the reference count of the returned object.
 *
 * Params:
 *     name = name of object to get
 *
 * Returns: the object named @name or %NULL if
 *     it could not be found in the object tree.
 */
public ObjectG getObject(string name)
{
	auto __p = gtk_builder_get_object(gtkBuilder, Str.toStringz(name));

	if(__p is null)
	{
		return null;
	}

	return ObjectG.getDObject!(ObjectG)(cast(GObject*) __p);
}

/**
 * Gets the scope in use that was set via gtk_builder_set_scope().
 *
 * See the #GtkBuilderScope documentation for details.
 *
 * Returns: the current scope
 */
public BuilderScopeIF getScope()
{
	auto __p = gtk_builder_get_scope(gtkBuilder);

	if(__p is null)
	{
		return null;
	}

	return ObjectG.getDObject!(BuilderScopeIF)(cast(GtkBuilderScope*) __p);
}

/**
 * Gets the translation domain of @builder.
 *
 * Returns: the translation domain or %NULL
 *     in case it was never set or explicitly unset via gtk_builder_set_translation_domain().
 *     This string is owned by the builder object and must not be modified or freed.
 */
public string getTranslationDomain()
{
	return Str.toString(gtk_builder_get_translation_domain(gtkBuilder));
}

/**
 * Looks up a type by name, using the virtual function that
 * #GtkBuilder has for that purpose. This is mainly used when
 * implementing the #GtkBuildable interface on a type.
 *
 * Params:
 *     typeName = type name to lookup
 *
 * Returns: the #GType found for @type_name or #G_TYPE_INVALID
 *     if no type was found
 */
public GType getTypeFromName(string typeName)
{
	return gtk_builder_get_type_from_name(gtkBuilder, Str.toStringz(typeName));
}

/**
 * Sets the current object for the @builder. The current object can be
 * tought of as the `this` object that the builder is working for and
 * will often be used as the default object when an object is optional.
 *
 * gtk_widget_init_template() for example will set the current object to
 * the widget the template is inited for.
 * For functions like gtk_builder_new_from_resource(), the current object
 * will be %NULL.
 *
 * Params:
 *     currentObject = the new current object or
 *         %NULL for none
 */
public void setCurrentObject(ObjectG currentObject)
{
	gtk_builder_set_current_object(gtkBuilder, (currentObject is null) ? null : currentObject.getObjectGStruct());
}

/**
 * Sets the scope the builder should operate in.
 *
 * If @scope is %NULL a new #GtkBuilderCScope will be created.
 *
 * See the #GtkBuilderScope documentation for details.
 *
 * Params:
 *     scope_ = the scope to use or
 *         %NULL for the default
 */
public void setScope(BuilderScopeIF scope_)
{
	gtk_builder_set_scope(gtkBuilder, (scope_ is null) ? null : scope_.getBuilderScopeStruct());
}

/**
 * Sets the translation domain of @builder.
 * See #GtkBuilder:translation-domain.
 *
 * Params:
 *     domain = the translation domain or %NULL
 */
public void setTranslationDomain(string domain)
{
	gtk_builder_set_translation_domain(gtkBuilder, Str.toStringz(domain));
}

/**
 * This function demarshals a value from a string. This function
 * calls g_value_init() on the @value argument, so it need not be
 * initialised beforehand.
 *
 * This function can handle char, uchar, boolean, int, uint, long,
 * ulong, enum, flags, float, double, string, #GdkRGBA and
 * #GtkAdjustment type values. Support for #GtkWidget type values is
 * still to come.
 *
 * Upon errors %FALSE will be returned and @error will be assigned a
 * #GError from the #GTK_BUILDER_ERROR domain.
 *
 * Params:
 *     pspec = the #GParamSpec for the property
 *     string_ = the string representation of the value
 *     value = the #GValue to store the result in
 *
 * Returns: %TRUE on success
 *
 * Throws: GException on failure.
 */
public bool valueFromString(ParamSpec pspec, string string_, out Value value)
{
	GValue* outvalue = sliceNew!GValue();
	GError* err = null;

	auto __p = gtk_builder_value_from_string(gtkBuilder, (pspec is null) ? null : pspec.getParamSpecStruct(), Str.toStringz(string_), outvalue, &err) != 0;

	if (err !is null)
	{
		throw new GException( new ErrorG(err) );
	}

	value = ObjectG.getDObject!(Value)(outvalue, true);

	return __p;
}

/**
 * Like gtk_builder_value_from_string(), this function demarshals
 * a value from a string, but takes a #GType instead of #GParamSpec.
 * This function calls g_value_init() on the @value argument, so it
 * need not be initialised beforehand.
 *
 * Upon errors %FALSE will be returned and @error will be assigned a
 * #GError from the #GTK_BUILDER_ERROR domain.
 *
 * Params:
 *     type = the #GType of the value
 *     string_ = the string representation of the value
 *     value = the #GValue to store the result in
 *
 * Returns: %TRUE on success
 *
 * Throws: GException on failure.
 */
public bool valueFromStringType(GType type, string string_, out Value value)
{
	GValue* outvalue = sliceNew!GValue();
	GError* err = null;

	auto __p = gtk_builder_value_from_string_type(gtkBuilder, type, Str.toStringz(string_), outvalue, &err) != 0;

	if (err !is null)
	{
		throw new GException( new ErrorG(err) );
	}

	value = ObjectG.getDObject!(Value)(outvalue, true);

	return __p;
}
}
