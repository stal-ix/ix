{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://download.gnome.org/sources/evince/46/evince-46.3.tar.xz
sha:bc0d1d41b9d7ffc762e99d2abfafacbf745182f0b31d86db5eec8c67f5f3006b
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
lib/djvulibre
lib/poppler/next
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
