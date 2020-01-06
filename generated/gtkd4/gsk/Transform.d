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


module gsk.Transform;

private import glib.ConstructionException;
private import glib.MemorySlice;
private import glib.Str;
private import glib.StringG;
private import gobject.ObjectG;
private import graphene.Matrix;
private import graphene.Point;
private import graphene.Point3D;
private import graphene.Rect;
private import graphene.Vec3;
private import gsk.RenderNode;
private import gsk.c.functions;
public  import gsk.c.types;


/**
 * The `GskTransform` structure contains only private data.
 */
public class Transform
{
	/** the main Gtk struct */
	protected GskTransform* gskTransform;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GskTransform* getTransformStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gskTransform;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gskTransform;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GskTransform* gskTransform, bool ownedRef = false)
	{
		this.gskTransform = gskTransform;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( ownedRef )
			gsk_transform_unref(gskTransform);
	}


	/** */
	public static GType getType()
	{
		return gsk_transform_get_type();
	}

	/** */
	public this()
	{
		auto __p = gsk_transform_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GskTransform*) __p);
	}

	/**
	 * Checks two matrices for equality. Note that matrices need to be literally
	 * identical in their operations, it is not enough that they return the
	 * same result in gsk_transform_to_matrix().
	 *
	 * Params:
	 *     second = the second matrix
	 *
	 * Returns: %TRUE if the two matrices can be proven to be equal
	 */
	public bool equal(Transform second)
	{
		return gsk_transform_equal(gskTransform, (second is null) ? null : second.getTransformStruct()) != 0;
	}

	/**
	 * Returns the category this transform belongs to.
	 *
	 * Returns: The category of the transform
	 */
	public GskTransformCategory getCategory()
	{
		return gsk_transform_get_category(gskTransform);
	}

	/**
	 * Inverts the given transform.
	 *
	 * If @self is not invertible, %NULL is returned.
	 * Note that inverting %NULL also returns %NULL, which is
	 * the correct inverse of %NULL. If you need to differentiate
	 * between those cases, you should check @self is not %NULL
	 * before calling this function.
	 *
	 * Returns: The inverted transform or %NULL if the transform
	 *     cannot be inverted.
	 */
	public Transform invert()
	{
		auto __p = gsk_transform_invert(gskTransform);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Transform)(cast(GskTransform*) __p, true);
	}

	/**
	 * Multiplies @next with the given @matrix.
	 *
	 * Params:
	 *     matrix = the matrix to multiply @next with
	 *
	 * Returns: The new matrix
	 */
	public Transform matrix(Matrix matrix)
	{
		auto __p = gsk_transform_matrix(gskTransform, (matrix is null) ? null : matrix.getMatrixStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Transform)(cast(GskTransform*) __p, true);
	}

	/**
	 * Applies a perspective projection transform. This transform
	 * scales points in X and Y based on their Z value, scaling
	 * points with positive Z values away from the origin, and
	 * those with negative Z values towards the origin. Points
	 * on the z=0 plane are unchanged.
	 *
	 * Params:
	 *     depth = distance of the z=0 plane. Lower values give a more
	 *         flattened pyramid and therefore a more pronounced
	 *         perspective effect.
	 *
	 * Returns: The new matrix
	 */
	public Transform perspective(float depth)
	{
		auto __p = gsk_transform_perspective(gskTransform, depth);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Transform)(cast(GskTransform*) __p, true);
	}

	/**
	 * Converts @self into a human-readable string representation suitable
	 * for printing that can later be parsed with gsk_transform_parse().
	 *
	 * Params:
	 *     string_ = The string to print into
	 */
	public void print(StringG string_)
	{
		gsk_transform_print(gskTransform, (string_ is null) ? null : string_.getStringGStruct());
	}

	alias doref = ref_;
	/**
	 * Acquires a reference on the given #GskTransform.
	 *
	 * Returns: the #GskTransform with an additional reference
	 */
	public Transform ref_()
	{
		auto __p = gsk_transform_ref(gskTransform);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Transform)(cast(GskTransform*) __p);
	}

	/**
	 * Rotates @next @angle degrees in 2D - or in 3Dspeak, around the z axis.
	 *
	 * Params:
	 *     angle = the rotation angle, in degrees (clockwise)
	 *
	 * Returns: The new matrix
	 */
	public Transform rotate(float angle)
	{
		auto __p = gsk_transform_rotate(gskTransform, angle);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Transform)(cast(GskTransform*) __p, true);
	}

	/**
	 * Rotates @next @angle degrees around @axis.
	 *
	 * For a rotation in 2D space, use gsk_transform_rotate().
	 *
	 * Params:
	 *     angle = the rotation angle, in degrees (clockwise)
	 *     axis = The rotation axis
	 *
	 * Returns: The new matrix
	 */
	public Transform rotate3d(float angle, Vec3 axis)
	{
		auto __p = gsk_transform_rotate_3d(gskTransform, angle, (axis is null) ? null : axis.getVec3Struct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Transform)(cast(GskTransform*) __p, true);
	}

	/**
	 * Scales @next in 2-dimensional space by the given factors.
	 * Use gsk_transform_scale_3d() to scale in all 3 dimensions.
	 *
	 * Params:
	 *     factorX = scaling factor on the X axis
	 *     factorY = scaling factor on the Y axis
	 *
	 * Returns: The new matrix
	 */
	public Transform scale(float factorX, float factorY)
	{
		auto __p = gsk_transform_scale(gskTransform, factorX, factorY);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Transform)(cast(GskTransform*) __p, true);
	}

	/**
	 * Scales @next by the given factors.
	 *
	 * Params:
	 *     factorX = scaling factor on the X axis
	 *     factorY = scaling factor on the Y axis
	 *     factorZ = scaling factor on the Z axis
	 *
	 * Returns: The new matrix
	 */
	public Transform scale3d(float factorX, float factorY, float factorZ)
	{
		auto __p = gsk_transform_scale_3d(gskTransform, factorX, factorY, factorZ);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Transform)(cast(GskTransform*) __p, true);
	}

	/**
	 * Converts a #GskTransform to a 2D transformation
	 * matrix.
	 * @self must be a 2D transformation. If you are not
	 * sure, use gsk_transform_get_category() >=
	 * %GSK_TRANSFORM_CATEGORY_2D to check.
	 *
	 * The returned values have the following layout:
	 *
	 * |[<!-- language="plain" -->
	 * | xx yx |   |  a  b  0 |
	 * | xy yy | = |  c  d  0 |
	 * | dx dy |   | tx ty  1 |
	 * ]|
	 *
	 * This function can be used to convert between a #GskTransform
	 * and a matrix type from other 2D drawing libraries, in particular
	 * Cairo.
	 *
	 * Params:
	 *     outXx = return location for the xx member
	 *     outYx = return location for the yx member
	 *     outXy = return location for the xy member
	 *     outYy = return location for the yy member
	 *     outDx = return location for the x0 member
	 *     outDy = return location for the y0 member
	 */
	public void to2d(out float outXx, out float outYx, out float outXy, out float outYy, out float outDx, out float outDy)
	{
		gsk_transform_to_2d(gskTransform, &outXx, &outYx, &outXy, &outYy, &outDx, &outDy);
	}

	/**
	 * Converts a #GskTransform to 2D affine transformation
	 * factors.
	 * @self must be a 2D transformation. If you are not
	 * sure, use gsk_transform_get_category() >=
	 * %GSK_TRANSFORM_CATEGORY_2D_AFFINE to check.
	 *
	 * Params:
	 *     outScaleX = return location for the scale
	 *         factor in the x direction
	 *     outScaleY = return location for the scale
	 *         factor in the y direction
	 *     outDx = return location for the translation
	 *         in the x direction
	 *     outDy = return location for the translation
	 *         in the y direction
	 */
	public void toAffine(out float outScaleX, out float outScaleY, out float outDx, out float outDy)
	{
		gsk_transform_to_affine(gskTransform, &outScaleX, &outScaleY, &outDx, &outDy);
	}

	/**
	 * Computes the actual value of @self and stores it in @out_matrix.
	 * The previous value of @out_matrix will be ignored.
	 *
	 * Params:
	 *     outMatrix = The matrix to set
	 */
	public void toMatrix(out Matrix outMatrix)
	{
		graphene_matrix_t* outoutMatrix = sliceNew!graphene_matrix_t();

		gsk_transform_to_matrix(gskTransform, outoutMatrix);

		outMatrix = ObjectG.getDObject!(Matrix)(outoutMatrix, true);
	}

	/**
	 * Converts a matrix into a string that is suitable for
	 * printing and can later be parsed with gsk_transform_parse().
	 *
	 * This is a wrapper around gsk_transform_print(), see that function
	 * for details.
	 *
	 * Returns: A new string for @self
	 */
	public override string toString()
	{
		auto retStr = gsk_transform_to_string(gskTransform);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Converts a #GskTransform to a translation operation.
	 * @self must be a 2D transformation. If you are not
	 * sure, use gsk_transform_get_category() >=
	 * %GSK_TRANSFORM_CATEGORY_2D_TRANSLATE to check.
	 *
	 * Params:
	 *     outDx = return location for the translation
	 *         in the x direction
	 *     outDy = return location for the translation
	 *         in the y direction
	 */
	public void toTranslate(out float outDx, out float outDy)
	{
		gsk_transform_to_translate(gskTransform, &outDx, &outDy);
	}

	/**
	 * Applies all the operations from @other to @next.
	 *
	 * Params:
	 *     other = Transform to apply
	 *
	 * Returns: The new matrix
	 */
	public Transform transform(Transform other)
	{
		auto __p = gsk_transform_transform(gskTransform, (other is null) ? null : other.getTransformStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Transform)(cast(GskTransform*) __p, true);
	}

	/**
	 * Transforms a #graphene_rect_t using the given transform @self.
	 * The result is the bounding box containing the coplanar quad.
	 *
	 * Params:
	 *     rect = a #graphene_rect_t
	 *     outRect = return location for the bounds
	 *         of the transformed rectangle
	 */
	public void transformBounds(Rect rect, out Rect outRect)
	{
		graphene_rect_t* outoutRect = sliceNew!graphene_rect_t();

		gsk_transform_transform_bounds(gskTransform, (rect is null) ? null : rect.getRectStruct(), outoutRect);

		outRect = ObjectG.getDObject!(Rect)(outoutRect, true);
	}

	/**
	 * Translates @next in 2dimensional space by @point.
	 *
	 * Params:
	 *     point = the point to translate the matrix by
	 *
	 * Returns: The new matrix
	 */
	public Transform translate(Point point)
	{
		auto __p = gsk_transform_translate(gskTransform, (point is null) ? null : point.getPointStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Transform)(cast(GskTransform*) __p, true);
	}

	/**
	 * Translates @next by @point.
	 *
	 * Params:
	 *     point = the point to translate the matrix by
	 *
	 * Returns: The new matrix
	 */
	public Transform translate3d(Point3D point)
	{
		auto __p = gsk_transform_translate_3d(gskTransform, (point is null) ? null : point.getPoint3DStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Transform)(cast(GskTransform*) __p, true);
	}

	/**
	 * Releases a reference on the given #GskTransform.
	 *
	 * If the reference was the last, the resources associated to the @self are
	 * freed.
	 */
	public void unref()
	{
		gsk_transform_unref(gskTransform);
	}

	/**
	 * Gets the child node that is getting transformed by the given @node.
	 *
	 * Params:
	 *     node = a transform @GskRenderNode
	 *
	 * Returns: The child that is getting transformed
	 */
	public static RenderNode nodeGetChild(RenderNode node)
	{
		auto __p = gsk_transform_node_get_child((node is null) ? null : node.getRenderNodeStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(RenderNode)(cast(GskRenderNode*) __p);
	}

	/** */
	public static Transform nodeGetTransform(RenderNode node)
	{
		auto __p = gsk_transform_node_get_transform((node is null) ? null : node.getRenderNodeStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Transform)(cast(GskTransform*) __p, true);
	}

	/**
	 * Creates a #GskRenderNode that will transform the given @child
	 * with the given @transform.
	 *
	 * Params:
	 *     child = The node to transform
	 *     transform = The transform to apply
	 *
	 * Returns: A new #GskRenderNode
	 */
	public static RenderNode nodeNew(RenderNode child, Transform transform)
	{
		auto __p = gsk_transform_node_new((child is null) ? null : child.getRenderNodeStruct(), (transform is null) ? null : transform.getTransformStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(RenderNode)(cast(GskRenderNode*) __p, true);
	}

	/**
	 * Parses the given @string into a transform and puts it in
	 * @out_transform. Strings printed via gsk_transform_to_string()
	 * can be read in again successfully using this function.
	 *
	 * If @string does not describe a valid transform, %FALSE is
	 * returned and %NULL is put in @out_transform.
	 *
	 * Params:
	 *     string_ = the string to parse
	 *     outTransform = The location to put the transform in
	 *
	 * Returns: %TRUE if @string described a valid transform.
	 */
	public static bool parse(string string_, out Transform outTransform)
	{
		GskTransform* outoutTransform = null;

		auto __p = gsk_transform_parse(Str.toStringz(string_), &outoutTransform) != 0;

		outTransform = ObjectG.getDObject!(Transform)(outoutTransform);

		return __p;
	}
}
