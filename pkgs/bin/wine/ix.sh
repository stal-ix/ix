{% extends 't/ix.sh' %}

{# Second pass: only the loader is linked again, into one standalone static
   program: the unixlib archives of bin/wine/modules with their dlopen
   registrations, the wineserver (run when called as wineserver) and the PE
   dlls and data of bin/wine/payload. Nothing is read from next to it.

   It sits at 0x68000000, the start of the range Wine leaves to the system
   in the 32-bit address space (no preloader reserves it here), so that EXEs
   at 0x400000 and the low 1.6 GB stay free; non-PIC code cannot go above
   2 GB. The payload has its own segment way up, see embed.ld. #}

{% block bld_libs %}
{{super()}}
lib/zstd
bin/wine/modules
bin/wine/modules/dl
bin/wine/payload
lib/freetype/dl
lib/fontconfig/dl
lib/gnutls/dl
{% endblock %}

{% block build %}
make -j ${make_thrs} loader/wine \
    LDFLAGS="-Wl,--image-base=0x68000000 -Wl,-u,wineserver_main ${WINE_EMBED}"
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp loader/wine ${out}/bin/wine
ln -s wine ${out}/bin/wineserver
{% endblock %}
