{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/crab2313/evince/-/archive/4c91df66ca83f8f1d057f0aa9069675b8bf5b6d6/evince-4c91df66ca83f8f1d057f0aa9069675b8bf5b6d6.tar.bz2
sha:9e5a33675cfd312d92bcc78e72e48d8ecaadf2391057e610e4535a154de45627
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/t1
lib/gtk
lib/intl
lib/dbus
lib/glib
lib/xml/2
lib/secret
lib/archive
lib/poppler
lib/adwaita
lib/djvulibre
lib/drivers/3d
lib/gdk/pixbuf/svg
lib/gsettings/desktop/schemas
{% endblock %}

{% block bld_tool %}
bld/dlfcn
bld/gettext
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
set -xue
for x in pdf comics djvu tiff; do
    echo "${x}document ${func} ${func}_${x}"

    for l in obj/backend/lib${x}document.a.p/*.o; do
        llvm-objcopy --preserve-dates --redefine-sym "${func}=${func}_${x}" ${l}
    done
done | dl_stubs > stub.c

#llvm-objcopy --preserve-dates --redefine-sym "ev_get_resource=ev_lview_get_resource" ./obj/libview/libevview3.a.p/meson-generated_.._ev-resources.c.o
llvm-objcopy --preserve-dates --redefine-sym "ev_get_resource=ev_shell_get_resource" ./obj/shell/evince.p/meson-generated_.._ev-resources.c.o
#llvm-objcopy --preserve-dates --redefine-sym "ev_get_resources=ev_lview_get_resources" ./obj/libview/libevview3.a.p/meson-generated_.._ev-resources.c.o

cc -o evince stub.c $(find -type f -name '*.o' | grep -v 'evinced.p' | grep -v 'test-')
{% endblock %}

{% block install %}
{{super()}}
rm -r ${out}/bin/bin_*
cp ${tmp}/evince ${out}/bin/evince
{% endblock %}
