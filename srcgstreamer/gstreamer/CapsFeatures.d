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


module gstreamer.CapsFeatures;

private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gstreamerc.gstreamer;
public  import gstreamerc.gstreamertypes;


/**
 * #GstCapsFeatures can optionally be set on a #GstCaps to add requirements
 * for additional features for a specific #GstStructure. Caps structures with
 * the same name but with a non-equal set of caps features are not compatible.
 * If a pad supports multiple sets of features it has to add multiple equal
 * structures with different feature sets to the caps.
 * 
 * Empty #GstCapsFeatures are equivalent with the #GstCapsFeatures that only
 * contain #GST_CAPS_FEATURE_MEMORY_SYSTEM_MEMORY. ANY #GstCapsFeatures as
 * created by gst_caps_features_new_any() are equal to any other #GstCapsFeatures
 * and can be used to specify that any #GstCapsFeatures would be supported, e.g.
 * for elements that don't touch buffer memory. #GstCaps with ANY #GstCapsFeatures
 * are considered non-fixed and during negotiation some #GstCapsFeatures have
 * to be selected.
 * 
 * Examples for caps features would be the requirement of a specific #GstMemory
 * types or the requirement of having a specific #GstMeta on the buffer. Features
 * are given as a string of the format "memory:GstMemoryTypeName" or
 * "meta:GstMetaAPIName".
 */
public class CapsFeatures
{
	/** the main Gtk struct */
	protected GstCapsFeatures* gstCapsFeatures;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstCapsFeatures* getCapsFeaturesStruct()
	{
		return gstCapsFeatures;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstCapsFeatures;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstCapsFeatures* gstCapsFeatures, bool ownedRef = false)
	{
		this.gstCapsFeatures = gstCapsFeatures;
		this.ownedRef = ownedRef;
	}

	/**
	 * Creates a new, ANY #GstCapsFeatures. This will be equal
	 * to any other #GstCapsFeatures but caps with these are
	 * unfixed.
	 *
	 * Free-function: gst_caps_features_free
	 *
	 * Return: a new, ANY #GstCapsFeatures
	 *
	 * Since: 1.2
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public static newAny()
	{
		auto p = gst_caps_features_new_any();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new_any");
		}
		
		return new CapsFeatures(cast(GstCapsFeatures*)p);
	}

	/**
	 */

	/** */
	public static GType getType()
	{
		return gst_caps_features_get_type();
	}

	/**
	 * Creates a new, empty #GstCapsFeatures.
	 *
	 * Free-function: gst_caps_features_free
	 *
	 * Return: a new, empty #GstCapsFeatures
	 *
	 * Since: 1.2
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = gst_caps_features_new_empty();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new_empty");
		}
		
		this(cast(GstCapsFeatures*) p);
	}

	/**
	 * Creates a new #GstCapsFeatures with the given features.
	 *
	 * Free-function: gst_caps_features_free
	 *
	 * Params:
	 *     feature1 = name of first feature to set
	 *     varargs = variable argument list
	 *
	 * Return: a new, empty #GstCapsFeatures
	 *
	 * Since: 1.2
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(GQuark feature1, void* varargs)
	{
		auto p = gst_caps_features_new_id_valist(feature1, varargs);
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new_id_valist");
		}
		
		this(cast(GstCapsFeatures*) p);
	}

	/**
	 * Creates a new #GstCapsFeatures with the given features.
	 *
	 * Free-function: gst_caps_features_free
	 *
	 * Params:
	 *     feature1 = name of first feature to set
	 *     varargs = variable argument list
	 *
	 * Return: a new, empty #GstCapsFeatures
	 *
	 * Since: 1.2
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string feature1, void* varargs)
	{
		auto p = gst_caps_features_new_valist(Str.toStringz(feature1), varargs);
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new_valist");
		}
		
		this(cast(GstCapsFeatures*) p);
	}

	/**
	 * Adds @feature to @features.
	 *
	 * Params:
	 *     feature = a feature.
	 *
	 * Since: 1.2
	 */
	public void add(string feature)
	{
		gst_caps_features_add(gstCapsFeatures, Str.toStringz(feature));
	}

	/**
	 * Adds @feature to @features.
	 *
	 * Params:
	 *     feature = a feature.
	 *
	 * Since: 1.2
	 */
	public void addId(GQuark feature)
	{
		gst_caps_features_add_id(gstCapsFeatures, feature);
	}

	/**
	 * Check if @features contains @feature.
	 *
	 * Params:
	 *     feature = a feature
	 *
	 * Return: %TRUE if @features contains @feature.
	 *
	 * Since: 1.2
	 */
	public bool contains(string feature)
	{
		return gst_caps_features_contains(gstCapsFeatures, Str.toStringz(feature)) != 0;
	}

	/**
	 * Check if @features contains @feature.
	 *
	 * Params:
	 *     feature = a feature
	 *
	 * Return: %TRUE if @features contains @feature.
	 *
	 * Since: 1.2
	 */
	public bool containsId(GQuark feature)
	{
		return gst_caps_features_contains_id(gstCapsFeatures, feature) != 0;
	}

	/**
	 * Duplicates a #GstCapsFeatures and all its values.
	 *
	 * Free-function: gst_caps_features_free
	 *
	 * Return: a new #GstCapsFeatures.
	 *
	 * Since: 1.2
	 */
	public CapsFeatures copy()
	{
		auto p = gst_caps_features_copy(gstCapsFeatures);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(CapsFeatures)(cast(GstCapsFeatures*) p, true);
	}

	/**
	 * Frees a #GstCapsFeatures and all its values. The caps features must not
	 * have a parent when this function is called.
	 *
	 * Since: 1.2
	 */
	public void free()
	{
		gst_caps_features_free(gstCapsFeatures);
	}

	/**
	 * Returns the @i-th feature of @features.
	 *
	 * Params:
	 *     i = index of the feature
	 *
	 * Return: The @i-th feature of @features.
	 *
	 * Since: 1.2
	 */
	public string getNth(uint i)
	{
		return Str.toString(gst_caps_features_get_nth(gstCapsFeatures, i));
	}

	/**
	 * Returns the @i-th feature of @features.
	 *
	 * Params:
	 *     i = index of the feature
	 *
	 * Return: The @i-th feature of @features.
	 *
	 * Since: 1.2
	 */
	public GQuark getNthId(uint i)
	{
		return gst_caps_features_get_nth_id(gstCapsFeatures, i);
	}

	/**
	 * Returns the number of features in @features.
	 *
	 * Return: The number of features in @features.
	 *
	 * Since: 1.2
	 */
	public uint getSize()
	{
		return gst_caps_features_get_size(gstCapsFeatures);
	}

	/**
	 * Check if @features is %GST_CAPS_FEATURES_ANY.
	 *
	 * Return: %TRUE if @features is %GST_CAPS_FEATURES_ANY.
	 *
	 * Since: 1.2
	 */
	public bool isAny()
	{
		return gst_caps_features_is_any(gstCapsFeatures) != 0;
	}

	/**
	 * Check if @features1 and @features2 are equal.
	 *
	 * Params:
	 *     features2 = a #GstCapsFeatures.
	 *
	 * Return: %TRUE if @features1 and @features2 are equal.
	 *
	 * Since: 1.2
	 */
	public bool isEqual(CapsFeatures features2)
	{
		return gst_caps_features_is_equal(gstCapsFeatures, (features2 is null) ? null : features2.getCapsFeaturesStruct()) != 0;
	}

	/**
	 * Removes @feature from @features.
	 *
	 * Params:
	 *     feature = a feature.
	 *
	 * Since: 1.2
	 */
	public void remove(string feature)
	{
		gst_caps_features_remove(gstCapsFeatures, Str.toStringz(feature));
	}

	/**
	 * Removes @feature from @features.
	 *
	 * Params:
	 *     feature = a feature.
	 *
	 * Since: 1.2
	 */
	public void removeId(GQuark feature)
	{
		gst_caps_features_remove_id(gstCapsFeatures, feature);
	}

	/**
	 * Sets the parent_refcount field of #GstCapsFeatures. This field is used to
	 * determine whether a caps features is mutable or not. This function should only be
	 * called by code implementing parent objects of #GstCapsFeatures, as described in
	 * the MT Refcounting section of the design documents.
	 *
	 * Params:
	 *     refcount = a pointer to the parent's refcount
	 *
	 * Return: %TRUE if the parent refcount could be set.
	 *
	 * Since: 1.2
	 */
	public bool setParentRefcount(int* refcount)
	{
		return gst_caps_features_set_parent_refcount(gstCapsFeatures, refcount) != 0;
	}

	/**
	 * Converts @features to a human-readable string representation.
	 *
	 * For debugging purposes its easier to do something like this:
	 * |[
	 * GST_LOG ("features is %" GST_PTR_FORMAT, features);
	 * ]|
	 * This prints the features in human readable form.
	 *
	 * Free-function: g_free
	 *
	 * Return: a pointer to string allocated by g_malloc().
	 *     g_free() after usage.
	 *
	 * Since: 1.2
	 */
	public override string toString()
	{
		auto retStr = gst_caps_features_to_string(gstCapsFeatures);
		
		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Creates a #GstCapsFeatures from a string representation.
	 *
	 * Free-function: gst_caps_features_free
	 *
	 * Params:
	 *     features = a string representation of a #GstCapsFeatures.
	 *
	 * Return: a new #GstCapsFeatures or
	 *     %NULL when the string could not be parsed. Free with
	 *     gst_caps_features_free() after use.
	 *
	 * Since: 1.2
	 */
	public static CapsFeatures fromString(string features)
	{
		auto p = gst_caps_features_from_string(Str.toStringz(features));
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(CapsFeatures)(cast(GstCapsFeatures*) p, true);
	}
}
