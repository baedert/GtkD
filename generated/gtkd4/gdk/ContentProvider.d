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


module gdk.ContentProvider;

private import gdk.ContentFormats;
private import gdk.c.functions;
public  import gdk.c.types;
private import gio.AsyncResultIF;
private import gio.Cancellable;
private import gio.OutputStream;
private import glib.Bytes;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Signals;
private import gobject.Value;
private import std.algorithm;


/**
 * A GdkContentProvider is used to provide content for the clipboard in
 * a number of formats.
 * 
 * To create a GdkContentProvider, use gdk_content_provider_new_for_value() or
 * gdk_content_provider_new_for_bytes().
 * 
 * GDK knows how to handle common text and image formats out-of-the-box. See
 * #GdkContentSerializer and #GdkContentDeserializer if you want to add support
 * for application-specific data formats.
 */
public class ContentProvider : ObjectG
{
	/** the main Gtk struct */
	protected GdkContentProvider* gdkContentProvider;

	/** Get the main Gtk struct */
	public GdkContentProvider* getContentProviderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gdkContentProvider;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gdkContentProvider;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GdkContentProvider* gdkContentProvider, bool ownedRef = false)
	{
		this.gdkContentProvider = gdkContentProvider;
		super(cast(GObject*)gdkContentProvider, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gdk_content_provider_get_type();
	}

	/**
	 * Create a content provider that provides the given @bytes as data for
	 * the given @mime_type.
	 *
	 * Params:
	 *     mimeType = the mime type
	 *     bytes = a #GBytes with the data for @mime_type
	 *
	 * Returns: a new #GdkContentProvider
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string mimeType, Bytes bytes)
	{
		auto __p = gdk_content_provider_new_for_bytes(Str.toStringz(mimeType), (bytes is null) ? null : bytes.getBytesStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_for_bytes");
		}

		this(cast(GdkContentProvider*) __p, true);
	}

	/**
	 * Create a content provider that provides the given @value.
	 *
	 * Params:
	 *     value = a #GValue
	 *
	 * Returns: a new #GdkContentProvider
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Value value)
	{
		auto __p = gdk_content_provider_new_for_value((value is null) ? null : value.getValueStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_for_value");
		}

		this(cast(GdkContentProvider*) __p, true);
	}

	/**
	 * Emits the #GdkContentProvider::contents-changed signal.
	 */
	public void contentChanged()
	{
		gdk_content_provider_content_changed(gdkContentProvider);
	}

	/**
	 * Gets the convtents of @provider stored in @value.
	 *
	 * The @value will have been initialized to the #GType the value should be
	 * provided in. This given #GType does not need to be listed in the formats
	 * returned by gdk_content_provider_ref_formats(). However, if the given
	 * #GType is not supported, this operation can fail and
	 * #G_IO_ERROR_NOT_SUPPORTED will be reported.
	 *
	 * Params:
	 *     value = the #GValue to fill
	 *
	 * Returns: %TRUE if the value was set successfully. Otherwise
	 *     @error will be set to describe the failure.
	 *
	 * Throws: GException on failure.
	 */
	public bool getValue(Value value)
	{
		GError* err = null;

		auto __p = gdk_content_provider_get_value(gdkContentProvider, (value is null) ? null : value.getValueStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return __p;
	}

	/**
	 * Gets the formats that the provider can provide its current contents in.
	 *
	 * Returns: The formats of the provider
	 */
	public ContentFormats refFormats()
	{
		auto __p = gdk_content_provider_ref_formats(gdkContentProvider);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ContentFormats)(cast(GdkContentFormats*) __p, true);
	}

	/**
	 * Gets the formats that the provider suggests other applications to store
	 * the data in.
	 * An example of such an application would be a clipboard manager.
	 *
	 * This can be assumed to be a subset of gdk_content_provider_ref_formats().
	 *
	 * Returns: The storable formats of the provider
	 */
	public ContentFormats refStorableFormats()
	{
		auto __p = gdk_content_provider_ref_storable_formats(gdkContentProvider);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ContentFormats)(cast(GdkContentFormats*) __p, true);
	}

	/**
	 * Asynchronously writes the contents of @provider to @stream in the given
	 * @mime_type. When the operation is finished @callback will be called. You
	 * can then call gdk_content_provider_write_mime_type_finish() to get the
	 * result of the operation.
	 *
	 * The given mime type does not need to be listed in the formats returned by
	 * gdk_content_provider_ref_formats(). However, if the given #GType is not
	 * supported, #G_IO_ERROR_NOT_SUPPORTED will be reported.
	 *
	 * The given @stream will not be closed.
	 *
	 * Params:
	 *     mimeType = the mime type to provide the data in
	 *     stream = the #GOutputStream to write to
	 *     ioPriority = the [I/O priority][io-priority]
	 *         of the request.
	 *     cancellable = optional #GCancellable object, %NULL to ignore.
	 *     callback = callback to call when the request is satisfied
	 *     userData = the data to pass to callback function
	 */
	public void writeMimeTypeAsync(string mimeType, OutputStream stream, int ioPriority, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		gdk_content_provider_write_mime_type_async(gdkContentProvider, Str.toStringz(mimeType), (stream is null) ? null : stream.getOutputStreamStruct(), ioPriority, (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Finishes an asynchronous write operation started with
	 * gdk_content_provider_write_mime_type_async().
	 *
	 * Params:
	 *     result = a #GAsyncResult
	 *
	 * Returns: %TRUE if the operation was completed successfully. Otherwise
	 *     @error will be set to describe the failure.
	 *
	 * Throws: GException on failure.
	 */
	public bool writeMimeTypeFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto __p = gdk_content_provider_write_mime_type_finish(gdkContentProvider, (result is null) ? null : result.getAsyncResultStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return __p;
	}

	/** */
	gulong addOnContentChanged(void delegate(ContentProvider) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "content-changed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
