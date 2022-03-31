{% extends '//mix/gnome.sh' %}

{% block fetch %}
https://download.gnome.org/sources/evince/42/evince-42.1.tar.xz
sha:b24767bb3d5103b4e35b0e15cf033dbe2488f88700cdd882d22a43adeec2e80a
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/t1
lib/intl
lib/dbus
lib/glib
lib/xml2
lib/gtk/3
lib/handy
lib/secret
lib/archive
lib/poppler
lib/rsvg/dl
lib/djvulibre
lib/gsettings/desktop/schemas
{% endblock %}

{% block run_data %}
aux/adwaita/icons
{% endblock %}

{% block bld_tool %}
bin/gettext
bld/scripts/dlfcn
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
{% endblock %}

{% block patch %}
sed -e 's|+multipage||' \
    -e 's|ev_libdir, ev_backends_subdir|ev_datadir, ev_backends_subdir|' \
    -i meson.build
{% endblock %}

{% block build %}
{{super()}}

cd ${tmp}

for x in pdf comics djvu tiff; do
    echo "${x}document register_evince_backend register_evince_backend_${x}"

    for l in obj/backend/${x}/lib${x}document.a.p/*.o; do
        llvm-objcopy --preserve-dates --redefine-sym \
            "register_evince_backend=register_evince_backend_${x}" ${l}
    done
done | dl_stubs_3 > stub.cpp

cc -o evince stub.cpp $(find -type f -name '*.o' | grep -v 'evinced.p' | grep -v 'test-')
{% endblock %}

{% block install %}
{{super()}}
rm -r ${out}/bin/bin_*
cp ${tmp}/evince ${out}/bin/evince
{{hooks.wrap_xdg_binary('evince')}}
{% endblock %}
