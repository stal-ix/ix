{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
evince
{% endblock %}

{% block version %}
48.1
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/evince/48/evince-{{self.version().strip()}}.tar.xz
7d8b9a6fa3a05d3f5b9048859027688c73a788ff6e923bc3945126884943fa10
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
lib/spectre
lib/archive
lib/poppler
lib/djvulibre
lib/gsettings/desktop/schemas
{% endblock %}

{% block meson_flags %}
ps=enabled
gtk_doc=false
user_doc=false
nautilus=false
previewer=false
thumbnailer=false
introspection=false
{% endblock %}

{% block bld_tool %}
bld/dlfcn
{% endblock %}

{% block build_flags %}
{{super()}}
shut_up
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

for x in ps pdf comics djvu tiff; do
    echo "${x}document ${func} ${func}_${x}"

    for l in obj/backend/lib${x}document.*.p/*.o; do
        llvm-objcopy --preserve-dates --redefine-sym "${func}=${func}_${x}" ${l}
    done
done | dl_stubs > stub.c

find .

clang -o evincexxx stub.c $(find -type f -name '*.o' | grep -v 'gnome_' | grep -v 'evinced.p' | grep -v 'test-')
{% endblock %}

{% block install %}
{{super()}}
cp -R ${out}/share/evince/icons ${out}/share/
rm -rf ${out}/share/evince/icons
rm -r ${out}/bin/bin_*
cp ${tmp}/evincexxx ${out}/bin/evince
{% endblock %}
