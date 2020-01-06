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


module gsk.Renderer;

private import cairo.Region;
private import gdk.Surface;
private import gdk.Texture;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;
private import graphene.Rect;
private import gsk.RenderNode;
private import gsk.c.functions;
public  import gsk.c.types;


/** */
public class Renderer : ObjectG
{
	/** the main Gtk struct */
	protected GskRenderer* gskRenderer;

	/** Get the main Gtk struct */
	public GskRenderer* getRendererStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gskRenderer;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gskRenderer;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GskRenderer* gskRenderer, bool ownedRef = false)
	{
		this.gskRenderer = gskRenderer;
		super(cast(GObject*)gskRenderer, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gsk_renderer_get_type();
	}

	/**
	 * Creates an appropriate #GskRenderer instance for the given @surface.
	 *
	 * The renderer will be realized when it is returned.
	 *
	 * Params:
	 *     surface = a #GdkSurface
	 *
	 * Returns: a #GskRenderer
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Surface surface)
	{
		auto __p = gsk_renderer_new_for_surface((surface is null) ? null : surface.getSurfaceStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_for_surface");
		}

		this(cast(GskRenderer*) __p, true);
	}

	/**
	 * Retrieves the #GdkSurface set using gsk_renderer_realize(). If the renderer
	 * has not been realized yet, %NULL will be returned.
	 *
	 * Returns: a #GdkSurface
	 */
	public Surface getSurface()
	{
		auto __p = gsk_renderer_get_surface(gskRenderer);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Surface)(cast(GdkSurface*) __p);
	}

	/**
	 * Checks whether the @renderer is realized or not.
	 *
	 * Returns: %TRUE if the #GskRenderer was realized, and %FALSE otherwise
	 */
	public bool isRealized()
	{
		return gsk_renderer_is_realized(gskRenderer) != 0;
	}

	/**
	 * Creates the resources needed by the @renderer to render the scene
	 * graph.
	 *
	 * Params:
	 *     surface = the #GdkSurface renderer will be used on
	 *
	 * Throws: GException on failure.
	 */
	public bool realize(Surface surface)
	{
		GError* err = null;

		auto __p = gsk_renderer_realize(gskRenderer, (surface is null) ? null : surface.getSurfaceStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return __p;
	}

	/**
	 * Renders the scene graph, described by a tree of #GskRenderNode instances,
	 * ensuring that the given @region gets redrawn.
	 *
	 * Renderers must ensure that changes of the contents given by the @root
	 * node as well as the area given by @region are redrawn. They are however
	 * free to not redraw any pixel outside of @region if they can guarantee that
	 * it didn't change.
	 *
	 * The @renderer will acquire a reference on the #GskRenderNode tree while
	 * the rendering is in progress.
	 *
	 * Params:
	 *     root = a #GskRenderNode
	 *     region = the #cairo_region_t that must be redrawn or %NULL
	 *         for the whole window
	 */
	public void render(RenderNode root, Region region)
	{
		gsk_renderer_render(gskRenderer, (root is null) ? null : root.getRenderNodeStruct(), (region is null) ? null : region.getRegionStruct());
	}

	/**
	 * Renders the scene graph, described by a tree of #GskRenderNode instances,
	 * to a #GdkTexture.
	 *
	 * The @renderer will acquire a reference on the #GskRenderNode tree while
	 * the rendering is in progress.
	 *
	 * If you want to apply any transformations to @root, you should put it into a
	 * transform node and pass that node instead.
	 *
	 * Params:
	 *     root = a #GskRenderNode
	 *     viewport = the section to draw or %NULL to use @root's bounds
	 *
	 * Returns: a #GdkTexture with the rendered contents of @root.
	 */
	public Texture renderTexture(RenderNode root, Rect viewport)
	{
		auto __p = gsk_renderer_render_texture(gskRenderer, (root is null) ? null : root.getRenderNodeStruct(), (viewport is null) ? null : viewport.getRectStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Texture)(cast(GdkTexture*) __p, true);
	}

	/**
	 * Releases all the resources created by gsk_renderer_realize().
	 */
	public void unrealize()
	{
		gsk_renderer_unrealize(gskRenderer);
	}
}
