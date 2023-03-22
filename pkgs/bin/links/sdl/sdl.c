/*sdl.c
    -- SDL graphic driver for Links (version 0.1.2)

    Copyright (C) 2004    Samuel Behan <sam(at)frida(dot)fri(dot)utc(dot)sk>

    This driver is free software; you can redistribute it and/or
    modify it under the terms of the GNU General Public License
    as published by the Free Software Foundation; either version 2
    of the License, or (at your option) any later version.

    This driver is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    General Public License for more details.

    ---
    I've wrote this driver just as a proof of concept for using SDL library. I wanted
    to use something easy, so i've decided for the world's best web browser :)

    TODO & BUGS:
    - keyboard input system doesn't handles all characters, because sdl ignores any
        system mappings and provides something like `raw keyboard access'
    - *_strip functions are possibly bad implemented, actualy i don't understand what
        they should do, or better i'm too lazy to find it out :)
    - video initialization is static only, nor parametrized !!!
    - BUGBUG: aa-lib nor caca lib, dont display nicely - they actualy display nothing ;(
            This needs to be fixed, becase links over aa-lib as that what i've been
            dreaming of [ try set env SDL_VIDEODRIVER="aalib" ]
    * resize does not works (fixed)
    ? sdl_set_title should possibly convert passed strings
    ...and many more, not found yet :)
*/


#include "cfg.h"

#ifdef GRDRV_SDL

#ifdef TEXT
#undef TEXT
#endif

#include "links.h"
#include <signal.h>

#include <SDL.h>
#include <SDL_gfxPrimitives.h>

#define S_ASSERT(code)
#define S_ON_DEBUG(code)
#define S_ON_DEBUG_TRACE(str)

/* internal types */
typedef unsigned char         u_char_t;
typedef unsigned short int    u_short_t;
struct graphics_driver sdl_driver;

/* keysyms */
#include "sdl_data.inc"

static struct t_sdl_driver_data {
    u_char_t    *video_drv;        /* used video driver name */
    SDL_VideoInfo    *video_info;        /* video informations */
    SDL_Cursor    *cursor;        /* cursor */
    int        event_timer;        /* event timer id */
    struct {
        long  int    flags;        /* video flags */
        short int    width;
        short int    height;
        short int    depth;
    } video;
} sdl_data = {
    NULL,
    NULL,
    NULL,
    0,
    { 0, 0, 0, 0 },
};
#define sdl_VIDEO_WIDTH        sdl_DATA.video.width
#define sdl_VIDEO_HEIGHT    sdl_DATA.video.height
#define sdl_VIDEO_DEPTH        sdl_DATA.video.depth
#define sdl_VIDEO_FLAGS        sdl_DATA.video.flags

/* DRIVER DATA HELPERS */
#define sdl_DATA        sdl_data
#define sdl_DATA_FREE()        if(sdl_DATA.video_drv != NULL)    mem_free(sdl_DATA.video_drv);    \
                if(sdl_DATA.video_info != NULL)    mem_free(sdl_DATA.video_info);
struct t_sdl_device_data {
    SDL_Surface         *p_surf;        /* primary surface    */
    struct graphics_device    *g_dev;            /* draphic device    */
/*    SDL_Rect        u_rect;    */        /* update rectangle    */
    short            u_pending;        /* update pending    */
};
#define sdl_SURFACE(ptr)    (ptr)->p_surf
#define sdl_GD(ptr)        (ptr)->g_dev
#define sdl_URECT(ptr)        (ptr)->u_rect
#define sdl_UPENDING(ptr)    (ptr)->u_pending

/* HELPER FUNCTIONS */
#define sdl_COLOR(col)            (((col) << 2) | 0x00)

#define sdl_SETUP_TIMER(dev)        \
        sdl_DATA.event_timer    = install_timer(20, sdl_catch_event, (dev))
#define sdl_KILL_TIMER()        \
        kill_timer(sdl_DATA.event_timer)

/* event catch helpers */
#define sdl_CATCH_EVENTS_NUM    3
#define sdl_MOUSE_STATE(var_in, var_out, def)    \
        if(var_in == SDL_BUTTON(SDL_BUTTON_LEFT))            \
            var_out    |= B_LEFT;                    \
        else if(var_in == SDL_BUTTON(SDL_BUTTON_RIGHT))            \
            var_out    |= B_RIGHT;                    \
        else if(var_in == SDL_BUTTON(SDL_BUTTON_MIDDLE))        \
            var_out    |= B_MIDDLE;                    \
        else if(var_in == SDL_BUTTON(SDL_BUTTON_WHEELUP))        \
            var_out    |= B_WHEELUP;                    \
        else if(var_in == SDL_BUTTON(SDL_BUTTON_WHEELDOWN))        \
            var_out    |= B_WHEELDOWN;                    \
        else    var_out    = (def);



/* tha event handler */
static void sdl_catch_event(void *data)
{
    register int i = 0, ev_num    = 0;
    register struct t_sdl_device_data *dev    = NULL;
    SDL_Event events[sdl_CATCH_EVENTS_NUM];
    u_short_t    fl    = 0;
    /* speedup (BUGGY, not thread safe !?!) */
    static u_short_t o_x = 0, o_y = 0, o_fl = 0;


    SDL_PumpEvents();
    ev_num    = SDL_PeepEvents(events, sdl_CATCH_EVENTS_NUM, SDL_GETEVENT, SDL_ALLEVENTS);
/*
    S_ON_DEBUG(fprintf(stderr, "event: received %d\n", ev_num); );
*/
    S_ASSERT(ev_num != -1);
    /* get dev data */
    dev        = (struct t_sdl_device_data *) data;
    for(i = 0; i < ev_num; i++)
    {
#define event events[i]
    switch (event.type)
    {
/*        case SDL_ACTIVEEVENT:    */
        /* mouse motion */
            case SDL_MOUSEMOTION:
        /* mose btn state */
            S_ON_DEBUG_TRACE("event: mouse motion");
        fl    = B_DRAG;
        sdl_MOUSE_STATE(event.motion.state, fl, B_MOVE);
        /* save som calls (SDL generates many similar events)    */
        if(event.motion.x == o_x && event.motion.y == o_y && fl == o_fl)
            break;
        /* call handler */
        sdl_GD(dev)->mouse_handler(sdl_GD(dev), event.motion.x, event.motion.y, fl);
        o_x    = event.motion.x;
        o_y    = event.motion.y;
        o_fl    = fl;
                break;
        /* mouse click */
        case SDL_MOUSEBUTTONUP:
            case SDL_MOUSEBUTTONDOWN:
        if(event.type == SDL_MOUSEBUTTONDOWN)
            fl    = B_DOWN;
        else
            fl    = B_UP;
            S_ON_DEBUG_TRACE("event: mouse click");
/*        sdl_MOUSE_STATE(event.button.state, fl, fl);    */
        sdl_GD(dev)->mouse_handler(sdl_GD(dev), event.button.x, event.button.y, fl);
        break;
        /* keyboard */
        case SDL_KEYUP:
            S_ON_DEBUG_TRACE("event: key up");
        break;
            case SDL_KEYDOWN:
           {    /*translate */
            int        k    = 0;
            int        key    = 0;
/*
*            //////////////////////////
*            //FIXME: needs rework !!!
*            //    -- sdl works at low-level ignoring any system keymappings
*            //    i've no idea how to do it (easily):(
*            //////////////////////////
*/
            S_ON_DEBUG_TRACE("event: key down");
            while(sdl_keysyms[k].sym != event.key.keysym.sym && sdl_keysyms[k].sym != SDLK_LAST)
                k++;
            S_ASSERT(sdl_keysyms[k].sym != SDLK_LAST);
            /* FIXME: hope nobody changes enumeration values in SDL libs */
            if(sdl_keysyms[k].sym >= SDLK_NUMLOCK && sdl_keysyms[k].sym <= SDLK_COMPOSE)
                break;    /* aka ignore modifiers */
            /* find modifiers */
            fl    = 0;
            if(event.key.keysym.mod & KMOD_SHIFT)
                fl    |=    KBD_SHIFT;
            if(event.key.keysym.mod & KMOD_ALT)
                fl    |=    KBD_ALT;
            if(event.key.keysym.mod & KMOD_CTRL)
                fl    |=    KBD_CTRL;
            /* key re-map */
            key    = sdl_keysyms[k].key;
            /* upper letters fix (not handled directly by SDL) */
            if(key >= 97 && key <= 122 && fl & KBD_SHIFT)
            {    key    -= 32;
                fl    &= ~KBD_SHIFT;    }
            /* find modifiers */
            fl    = 0;
            if(event.key.keysym.mod & KMOD_SHIFT)
                fl    |=    KBD_SHIFT;
            if(event.key.keysym.mod & KMOD_ALT)
                fl    |=    KBD_ALT;
            if(event.key.keysym.mod & KMOD_CTRL)
                fl    |=    KBD_CTRL;
            /* send keyb */
            S_ON_DEBUG(fprintf(stderr, "KEY(%d) = %c&%d\n", k, key, fl););
            if(fl & KBD_CTRL && sdl_keysyms[k].sym == SDLK_c)
                sdl_GD(dev)->keyboard_handler(sdl_GD(dev), KBD_CTRL_C, 0);
            else
                sdl_GD(dev)->keyboard_handler(sdl_GD(dev), key, fl);
                }break;
        case SDL_VIDEORESIZE:
        /* new dims */
        sdl_GD(dev)->size.x2    = event.resize.w;
        sdl_GD(dev)->size.y2    = event.resize.h;
        sdl_driver.x        = event.resize.w;
        sdl_driver.y        = event.resize.h;
        /* resize */
        /*
        S_ON_DEBUG(fprintf(stderr, "RESIZE(%dx%d)\n", event.resize.w, event.resize.h));
        */
        /* info resize */
        sdl_GD(dev)->resize_handler(sdl_GD(dev));
        break;
/*
        case SDL_VIDEOEXPOSE:
*/
            case SDL_QUIT:
                sdl_GD(dev)->keyboard_handler(sdl_GD(dev), KBD_CLOSE, 0);
                break;
        default:
        /* printf("Unhandled event: %d !\n", event.type); */
        break;
    }
   }
#undef event
   sdl_SETUP_TIMER((void *)dev);
   return;
}

static inline void sdl_update_sc(void *data)
{
    struct t_sdl_device_data    *dev    = NULL;

    S_ON_DEBUG_TRACE("in");
    /* assing struct */
    if(data == NULL)
        return;
    dev    = (struct t_sdl_device_data *)data;

    /* check if update neccesary */
    if(dev == NULL || sdl_SURFACE(dev) == NULL)
        return;
    if(!sdl_UPENDING(dev))
        return;

    /* do update screen */
/*    SDL_UpdateRect(sdl_SURFACE(dev), sdl_URECT(dev).x, sdl_URECT(dev).y, sdl_URECT(dev).w, sdl_URECT(dev).h);
*/
    SDL_UpdateRect(sdl_SURFACE(dev), 0, 0, 0, 0);
    /* remove pending flag */
    sdl_UPENDING(dev)    = 0;
    S_ON_DEBUG_TRACE("out");
    return;
}


/* quite stuppit function */
#define sdl_NORM_UPDATE    0
#define sdl_FULL_UPDATE 1
static inline void sdl_register_update(struct t_sdl_device_data *dev, int x, int y, int w, int h, int opt)
{
    S_ON_DEBUG_TRACE("in");
    sdl_UPENDING(dev)    = 1;
    register_bottom_half(sdl_update_sc, dev);
    S_ON_DEBUG_TRACE("out");
    return;
}

/* partialy stolen from documentation :)
   XXX: we can quite easily add here alpha blending :))) */
static inline void sdl_putpixel(SDL_Surface *s, int x, int y, unsigned long pixel)
{
     Uint8 *p;

     /* check our clip rect */
     if(!((s->clip_rect.x < x && (s->clip_rect.x + s->clip_rect.w) > x)
            && (s->clip_rect.y < y && (s->clip_rect.y + s->clip_rect.h) > y)))
    return;
     /* our sanity (fight int overflow :) */
     pixel &= (1<<(s->format->BytesPerPixel)) - 1;
     /* our point */
     p = (Uint8 *)s->pixels + y * s->pitch + x * s->format->BytesPerPixel;
     switch(s->format->BytesPerPixel) {
     case 1:
         *p = pixel;
         break;
     case 2:
         *(Uint16 *)p = pixel;
         break;

     case 3:
         if(SDL_BYTEORDER == SDL_BIG_ENDIAN) {
             p[0] = (pixel >> 16) & 0xff;
             p[1] = (pixel >> 8) & 0xff;
             p[2] = pixel & 0xff;
         } else {
             p[0] = pixel & 0xff;
             p[1] = (pixel >> 8) & 0xff;
             p[2] = (pixel >> 16) & 0xff;
         }
         break;
     case 4:
         *(Uint32 *)p = pixel;
         break;
     }
     return;
}


/* DRIVER FUNCTIONS */

u_char_t *sdl_init_driver(u_char_t *param, u_char_t *display)
{
    S_ON_DEBUG_TRACE("in");
    /* init sdl video */
    if(SDL_Init(SDL_INIT_VIDEO) != 0)
        return (u_char_t *)stracpy((u_char_t *)SDL_GetError());

    /* fetch current video hw informations */
    sdl_DATA.video_info        = (SDL_VideoInfo *) mem_alloc(sizeof(SDL_VideoInfo));
    S_ASSERT(sdl_DATA.video_info != NULL);
    memcpy(sdl_DATA.video_info, SDL_GetVideoInfo(), (sizeof(SDL_VideoInfo)));
    /* fetch driver name */
    sdl_DATA.video_drv        = (u_char_t *)mem_alloc(sizeof(u_char_t) * 11);
    S_ASSERT(sdl_DATA.video_drv != NULL);
    SDL_VideoDriverName((char *)sdl_DATA.video_drv, 11);

    /*TODO: SDL_VideoModeOk() */

    /* setup mode */
    sdl_VIDEO_FLAGS        |= SDL_HWSURFACE | SDL_HWPALETTE | SDL_RLEACCEL | SDL_RESIZABLE;
    sdl_VIDEO_WIDTH        = 1000;
    sdl_VIDEO_HEIGHT    = 710;
    sdl_VIDEO_DEPTH        = sdl_DATA.video_info->vfmt->BitsPerPixel;

    /* set driv config */
    sdl_driver.x        = sdl_VIDEO_WIDTH;
    sdl_driver.y        = sdl_VIDEO_HEIGHT;
    sdl_driver.depth    = ((sdl_DATA.video_info->vfmt->BytesPerPixel & 0x7) |
                           ((sdl_DATA.video_info->vfmt->BitsPerPixel & 0x1F) << 3));

    if (sdl_driver.depth == 4) sdl_driver.depth = 196;

    /* create cursor :) (need nice one) */
#ifdef sdl_HAVE_CURSOR
    if(sdl_DATA.cursor == NULL)
    {
        /* sdl_DATA.cursor    = SDL_CreateCursor((void *)arrow, (void *)arrow, 32, 32, 0, 0);
        */
        S_ASSERT(sdl_DATA.cursor != NULL);
    }
#endif
    /* key repeat */
    SDL_EnableUNICODE(1);
    SDL_EnableKeyRepeat(SDL_DEFAULT_REPEAT_DELAY, SDL_DEFAULT_REPEAT_INTERVAL);

    S_ON_DEBUG(fprintf(stderr, "VIDEO(%s): %dx%dx%d [%d]\n", sdl_DATA.video_drv,
                        sdl_VIDEO_WIDTH, sdl_VIDEO_HEIGHT, sdl_VIDEO_DEPTH, sdl_driver.depth));
    return NULL;
}

void sdl_shutdown_driver()
{
    S_ON_DEBUG_TRACE("in");
    sdl_KILL_TIMER();
    sdl_DATA_FREE();
    SDL_Quit();
    return;
}

struct graphics_device *sdl_init_device()
{
    struct graphics_device *dev    = NULL;
    struct t_sdl_device_data *data    = NULL;

    S_ON_DEBUG_TRACE("in");

    /* device data */
    data            = (struct t_sdl_device_data *) mem_alloc(sizeof(struct t_sdl_device_data));
    S_ASSERT(data != NULL);
    memset(data, 0, sizeof(struct t_sdl_device_data));

    /* init video mode */
    sdl_SURFACE(data)    = SDL_SetVideoMode(sdl_VIDEO_WIDTH, sdl_VIDEO_HEIGHT, sdl_VIDEO_DEPTH,
                            sdl_VIDEO_FLAGS);
    if(sdl_SURFACE(data) == NULL)
        return NULL;
    SDL_SetAlpha(sdl_SURFACE(data), SDL_SRCALPHA, 0xff);

    /* FIXME: here we shoulde re-update video info by calling SDL_VideoInfo() again */

    /* alloc gd */
    dev    = (struct graphics_device *) mem_alloc(sizeof(struct graphics_device));
    S_ASSERT(dev != NULL);

    /* setup gdS */
    dev->size.x1        = 0;
    dev->size.y1        = 0;
    dev->size.x2        = sdl_VIDEO_WIDTH;
    dev->size.y2        = sdl_VIDEO_HEIGHT;
    dev->clip        = dev->size;

    /*driver */
    sdl_driver.flags    |= GD_NEED_CODEPAGE;
    sdl_GD(data)        = dev;

    /*driver */
    dev->driver_data    = (void *) data;
    dev->user_data        = NULL;

    /*set my cursor */
    if(sdl_DATA.cursor != NULL)
        SDL_SetCursor(sdl_DATA.cursor);

    /*init timer */
    if(sdl_DATA.event_timer == 0)
        sdl_SETUP_TIMER((void *)data);
    S_ON_DEBUG_TRACE("out");
    return dev;
}

/* destroy device */
void sdl_shutdown_device(struct graphics_device *drv)
{
    struct t_sdl_device_data *dev    = NULL;

    S_ON_DEBUG_TRACE("in");
    dev            = (struct t_sdl_device_data *) drv->driver_data;
    S_ASSERT(dev != NULL);

    /* unregister bh */
    unregister_bottom_half(sdl_update_sc, dev);

    /* deinit video */
    SDL_FreeSurface(sdl_SURFACE(dev));
    sdl_SURFACE(dev)    = NULL;
    mem_free(dev);
    drv->driver_data    = NULL;
    mem_free(drv);
    S_ON_DEBUG_TRACE("out");
    return;
}

/* get driver parameters
   XXX: what is this fx() for ??? */
u_char_t *sdl_get_driver_param()
{
    S_ON_DEBUG_TRACE("in");
    S_ASSERT(0);
    return NULL;
}

/* GRAPHICS */

/* create empty bitmap */
int sdl_get_empty_bitmap(struct bitmap *bmp)
{
    SDL_Surface    *s    = NULL;

    S_ON_DEBUG_TRACE("in");

    /* null */
    bmp->data    = bmp->flags    /*= bmp->user*/    = NULL;
    bmp->skip    = 0;

    /* alloc surface */
    /* FIXED: ignoring byteorder here (taking from video info) */
    s        = (SDL_Surface *)SDL_CreateRGBSurface(sdl_VIDEO_FLAGS, bmp->x, bmp->y, sdl_VIDEO_DEPTH,
                    sdl_DATA.video_info->vfmt->Rmask, sdl_DATA.video_info->vfmt->Gmask,
                    sdl_DATA.video_info->vfmt->Bmask, sdl_DATA.video_info->vfmt->Amask);
    S_ASSERT(s != NULL);

    /* copy data */
    bmp->data    = (void *)s->pixels;
    bmp->skip    = s->pitch;
    bmp->flags    = (void *)s;

    /* lock if required */
    if(SDL_MUSTLOCK(s))
        SDL_LockSurface(s);
    S_ON_DEBUG_TRACE("out");
    return 0;
}

void sdl_register_bitmap(struct bitmap *bmp)
{
    SDL_Surface    *s    = NULL;

    S_ON_DEBUG_TRACE("in");

    /* unlock surface */
    s    = (SDL_Surface *)bmp->flags;
    if(SDL_MUSTLOCK(s))
        SDL_UnlockSurface(s);
    /* hide pixel mem */
    bmp->data    = NULL;
    S_ON_DEBUG_TRACE("out");
    return;
}

void *sdl_prepare_strip(struct bitmap *bmp, int top, int lines)
{
    SDL_Surface    *s    = NULL;

    S_ON_DEBUG_TRACE("in");

    /* unlock surface */
    s    = (SDL_Surface *)bmp->flags;
    if(SDL_MUSTLOCK(s))
        SDL_LockSurface(s);
    S_ON_DEBUG_TRACE("out");
    return (void *)(s->pixels + (top * s->pitch));
}

void sdl_commit_strip(struct bitmap *bmp, int top, int lines)
{
    SDL_Surface    *s    = NULL;

    S_ON_DEBUG_TRACE("in");

    /* unlock surface */
    s    = (SDL_Surface *)bmp->flags;
    if(SDL_MUSTLOCK(s))
        SDL_UnlockSurface(s);
    return;
}

/* unregister bitmap */
void sdl_unregister_bitmap(struct bitmap *bmp)
{
    SDL_Surface    *s    = NULL;

    S_ON_DEBUG_TRACE("in");

    s        = (SDL_Surface *)bmp->flags;
    S_ASSERT(s != 0);
    /* delete data */
    SDL_FreeSurface(s);
    /* null data */
    bmp->data    = NULL;
    bmp->flags    = NULL;
    S_ON_DEBUG_TRACE("out");
    return;
}

/* draw bmp */
void sdl_draw_bitmap(struct graphics_device *drv, struct bitmap *bmp, int x, int y)
{
    SDL_Surface         *s    = NULL;
    struct t_sdl_device_data *dev    = NULL;
    SDL_Rect    rect;

    S_ON_DEBUG_TRACE("in");
    dev    = (struct t_sdl_device_data *) drv->driver_data;
    s    = (SDL_Surface *)bmp->flags;
    memset(&rect, 0, sizeof(SDL_Rect));

    /* blit :) */
    rect.x    = x;
    rect.y    = y;
    SDL_BlitSurface(s, NULL, sdl_SURFACE(dev), &rect);
    sdl_register_update(dev, rect.x, rect.y, rect.w, rect.h, 0);
    S_ON_DEBUG_TRACE("out");
    return;
}

/* draw more bmps */
void sdl_draw_bitmaps(struct graphics_device *drv, struct bitmap **bmps, int n, int x, int y)
{
    int    i = 0;
    struct t_sdl_device_data *dev    = NULL;
    SDL_Rect rect;

    S_ON_DEBUG_TRACE("in");
    /* check */
    if(n < 1)
        return;
    dev    = (struct t_sdl_device_data *) drv->driver_data;
    memset(&rect, 0, sizeof(SDL_Rect));

    /* blit */
    rect.x    = x;
    rect.y    = y;
    for(i = 0; i < n; i++)
    {    SDL_BlitSurface((SDL_Surface *)bmps[i]->flags, NULL, sdl_SURFACE(dev), &rect);
        rect.x    +=    bmps[i]->x;    }
    /* FIXME: this should care about updating area, and possibly not update everythink */
    sdl_register_update(dev, 0, 0, 0, 0, sdl_FULL_UPDATE);
    return;
}

/* get color */
long sdl_get_color(int rgb)
{
    /*FIXME: not sure this is ok :) */
    return SDL_MapRGB(sdl_DATA.video_info->vfmt, ((rgb >> 16) & 0xff), ((rgb >> 8) & 0xff), ((rgb) & 0xff));
}

/* fill some area */
void sdl_fill_area(struct graphics_device *drv, int x1, int y1, int x2, int y2, long color)
{
    struct t_sdl_device_data *dev = NULL;
    SDL_Rect rect;

    S_ON_DEBUG_TRACE("in");
    dev    = (struct t_sdl_device_data *) drv->driver_data;


    rect.x    = x1;
    rect.y    = y1;
    rect.w    = x2 - x1;
    rect.h    = y2 - y1;
    if(SDL_MUSTLOCK(sdl_SURFACE(dev)))
        SDL_LockSurface(sdl_SURFACE(dev));
    SDL_FillRect(sdl_SURFACE(dev), &rect, color);
    if(SDL_MUSTLOCK(sdl_SURFACE(dev)))
        SDL_UnlockSurface(sdl_SURFACE(dev));
    sdl_register_update(dev, rect.x, rect.y, rect.w, rect.h, 0);
/*    sdl_register_update(dev, x1, y1, x2, y2, 0);
*/
    S_ON_DEBUG_TRACE("out");
    return;
}

/* draw horizontal line */
void sdl_draw_hline(struct graphics_device *drv, int left, int y, int right, long color)
{
    register int    i    = 0;
    struct t_sdl_device_data *dev = NULL;

    S_ON_DEBUG_TRACE("in");
    dev    = (struct t_sdl_device_data *) drv->driver_data;
    if(SDL_MUSTLOCK(sdl_SURFACE(dev)))
        SDL_LockSurface(sdl_SURFACE(dev));
    for(i = left; i < right; i++)
        sdl_putpixel(sdl_SURFACE(dev), i, y, color);
    if(SDL_MUSTLOCK(sdl_SURFACE(dev)))
        SDL_UnlockSurface(sdl_SURFACE(dev));
    sdl_register_update(dev,  left, y, 1, right - left, 0);
    S_ON_DEBUG_TRACE("out");
    return;
}

/* draw vertical line */
void sdl_draw_vline(struct graphics_device *drv, int x, int top, int bottom, long color)
{
    register int i = 0;
    struct t_sdl_device_data *dev = NULL;

    S_ON_DEBUG_TRACE("in");
    /* get ptr */
    dev    = (struct t_sdl_device_data *) drv->driver_data;
    if(SDL_MUSTLOCK(sdl_SURFACE(dev)))
        SDL_LockSurface(sdl_SURFACE(dev));
    for(i = top; i < bottom; i++)
        sdl_putpixel(sdl_SURFACE(dev), x, i, color);
    if(SDL_MUSTLOCK(sdl_SURFACE(dev)))
        SDL_UnlockSurface(sdl_SURFACE(dev));
    sdl_register_update(dev, x, top, bottom - top, 1, 0);
    S_ON_DEBUG_TRACE("out");
    return;
}

/* horizontal scroll */
int sdl_hscroll(struct graphics_device *drv, struct rect_set **set, int sc)
{
    struct t_sdl_device_data *dev = NULL;
    SDL_Rect rect1, rect2;

    S_ON_DEBUG_TRACE("in");
    dev    = (struct t_sdl_device_data *) drv->driver_data;

    /* rect1 */
    rect1.x = drv->clip.x1;
    rect1.y = drv->clip.y1;
    rect1.w = drv->clip.x2 - rect1.x;
    rect1.h = drv->clip.y2 - rect1.y;

    /* rect2 */
    rect2.x = drv->clip.x1 + sc;
    rect2.y = drv->clip.y1;
    rect2.w = drv->clip.x2 - rect1.x;
    rect2.h = drv->clip.y2 - rect1.y;

    SDL_BlitSurface(sdl_SURFACE(dev), &rect1, sdl_SURFACE(dev), &rect2);
    sdl_register_update(dev, rect1.x, rect1.y, rect1.w, rect1.h, 0);
    S_ON_DEBUG_TRACE("out");
    return 1;
}

/* vertical scroll */
int sdl_vscroll(struct graphics_device *drv, struct rect_set **set, int sc)
{
    struct t_sdl_device_data *dev = NULL;
    SDL_Rect rect1, rect2;

    S_ON_DEBUG_TRACE("in");
    /* get ptr */
    dev    = (struct t_sdl_device_data *) drv->driver_data;

    /* rect1 */
    rect1.x = drv->clip.x1;
    rect1.y = drv->clip.y1;
    rect1.w = drv->clip.x2 - rect1.x;
    rect1.h = drv->clip.y2 - rect1.y;

    /* rect2 */
    rect2.x = drv->clip.x1;
    rect2.y = drv->clip.y1 + sc;
    rect2.w = drv->clip.x2 - rect1.x;
    rect2.h = drv->clip.y2 - rect1.y;

    SDL_BlitSurface(sdl_SURFACE(dev), &rect1, sdl_SURFACE(dev), &rect2);
    sdl_register_update(dev, rect1.x, rect1.y, rect1.w, rect1.h, 0);
    S_ON_DEBUG_TRACE("out");
    return 1;
}

int sdl_scroll(struct graphics_device *drv, struct rect_set **set, int scx, int scy) {
    return sdl_hscroll(drv, set, scx) || sdl_vscroll(drv, set, scy);
}

/* set cliping area */
void sdl_set_clip_area(struct graphics_device *drv)
{
    struct t_sdl_device_data *dev = NULL;
    struct rect* r = NULL;
    SDL_Rect rect;

    S_ON_DEBUG_TRACE("in");
    /* get ptr */
    dev    = (struct t_sdl_device_data *) drv->driver_data;
    /* set rect */
    r = &drv->clip;
    rect.x    = r->x1;
    rect.y    = r->y1;
    rect.w    = r->x2 - r->x1;
    rect.h    = r->y2 - r->y1;
    /* dev clipp */
    drv->clip    = *r;
    /* clipp */
    SDL_SetClipRect(sdl_SURFACE(dev), &rect);
    S_ON_DEBUG_TRACE("out");
    return;
}

/* set window title (tittle utf-8 encoded !!!!) */
void sdl_set_title(struct graphics_device *drv, u_char_t *title)
{
    S_ON_DEBUG_TRACE("in");
    SDL_WM_SetCaption((const char *)title, NULL);
    return;
}

/* driver definition data */
struct graphics_driver sdl_driver={
    "sdl",
    sdl_init_driver,
    sdl_init_device,
    sdl_shutdown_device,
    sdl_shutdown_driver,
    NULL,
    NULL,
    sdl_get_driver_param,
    NULL,
    NULL,
    NULL,
    sdl_get_empty_bitmap,
    sdl_register_bitmap,
    sdl_prepare_strip,
    sdl_commit_strip,
    sdl_unregister_bitmap,
    sdl_draw_bitmap,
    sdl_get_color,
    sdl_fill_area,
    sdl_draw_hline,
    sdl_draw_vline,
    sdl_scroll,
    sdl_set_clip_area,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    sdl_set_title,
    NULL, /* exec */
    NULL,
    NULL,
    0,                /* depth (filled in sdl_init_driver function) */
    0, 0,                /* size (in X is empty) */
    0,                /* flags */
    NULL,
};

#endif /* GRDRV_SDL */
