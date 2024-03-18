{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://download.gnome.org/sources/evince/46/evince-46.0.tar.xz
sha:aff6af69392c04956bfad976dec5d1583b41d5a334e937995f7c3ca0740de221
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/t1
lib/intl
lib/dbus
lib/glib
lib/xml/2
lib/gtk/3
lib/handy
lib/secret
lib/archive
lib/poppler
lib/djvulibre
lib/gdk/pixbuf/svg
lib/gsettings/desktop/schemas
{% endblock %}

{% block bld_tool %}
bld/wrapcc/link/new
bld/gettext
bld/dlfcn
{% endblock %}

{% block meson_flags %}
gtk_doc=false
user_doc=false
nautilus=false
previewer=false
thumbnailer=false
introspection=false
{% endblock %}

{% block build_flags %}
shut_up
wrap_cc
{% endblock %}

{% block patch %}
find . -type f -name meson.build | while read l; do
    sed -e 's|.*adwaita_icon.*||' -i ${l}
done

sed -e 's|+multipage||' \
    -e 's|ev_libdir, ev_backends_subdir|ev_datadir, ev_backends_subdir|' \
    -i meson.build
{% endblock %}

{% block build %}
{{super()}}

cd ${tmp}

func=register_evince_backend

for x in pdf comics djvu tiff; do
    echo "${x}document ${func} ${func}_${x}"

    for l in obj/backend/lib${x}document.*.p/*.o; do
        llvm-objcopy --preserve-dates --redefine-sym "${func}=${func}_${x}" ${l}
    done
done | dl_stubs > stub.c

find .

clang -o evincexxx stub.c $(find -type f -name '*.o' | grep -v 'evinced.p' | grep -v 'test-')
{% endblock %}

{% block install %}
{{super()}}
rm -r ${out}/bin/bin_*
cp ${tmp}/evincexxx ${out}/bin/evince
{% endblock %}
