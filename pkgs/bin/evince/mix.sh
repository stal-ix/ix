{% extends '//mix/meson.sh' %}

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
lib/rsvg/reg
lib/djvulibre
lib/gsettings/desktop/schemas
{% endblock %}

{% block run_data %}
aux/adwaita/icons
{% endblock %}

{% block bld_tool %}
lib/gtk/3
bin/gettext
bin/glib/codegen
lib/dlfcn/scripts
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

cd backend

for d in $(ls -d */); do (
    d=$(echo ${d} | tr -d '/'); cd ${d}

    find . -type f -name '*.c' | while read f; do
        cat - ${f} << EOF > _
#define register_evince_backend register_evince_backend_${d}
EOF

        mv _ ${f}
    done
) done
{% endblock %}

{% block build1 %}
{{super()}}

cd ${tmp}/obj

for x in pdf comics djvu tiff; do
    cat << EOF | dl_stubs_2 ${x}document >> stub.cpp
register_evince_backend register_evince_backend_${x}
EOF
done

cc -c stub.cpp

rm cut-n-paste/synctex/libsynctex.a
#rm cut-n-paste/unarr/libunarr.a
rm libmisc/libevmisc.a
rm backend/comics/libcomicsdocument.a
rm backend/djvu/libdjvudocument.a
rm backend/pdf/libpdfdocument.a
rm backend/tiff/libtiffdocument.a
rm libview/libevview3.a

cc -o real_evince \
    -Wl,--whole-archive           \
    $(find . -type f -name '*.a') \
    -Wl,--no-whole-archive        \
    stub.o shell/evince.p/main.c.o
{% endblock %}

{% import '//mix/hooks.sh' as hooks %}

{% block install %}
{{hooks.install_glib_schemas()}}
{{super()}}
rm -r ${out}/bin/bin_*
#cp ${tmp}/obj/real_evince ${out}/bin/evince
{{hooks.wrap_xdg_binary('evince')}}
{% endblock %}
