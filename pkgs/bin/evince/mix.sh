{% extends '//mix/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/evince/41/evince-41.3.tar.xz
sha:3346b01f9bdc8f2d5ffea92f110a090c64a3624942b5b543aad4592a9de33bb0
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
introspection=false
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block patch %}
sed -e 's|+multipage||' -i meson.build

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

{% block build %}
{{super()}}

cd ${tmp}/obj

for x in pdf comics djvu tiff; do
    cat << EOF | dl_stubs_2 ${x}document >> stub.cpp
register_evince_backend register_evince_backend_${x}
EOF
done

cc -c stub.cpp

rm cut-n-paste/synctex/libsynctex.a
rm cut-n-paste/unarr/libunarr.a
rm libmisc/libevmisc.a

cc -o qw \
    -Wl,--whole-archive           \
    $(find . -type f -name '*.a') \
    -Wl,--no-whole-archive        \
    stub.o shell/evince.p/main.c.o
{% endblock %}

{% block postinstall %}
: skip it
{% endblock %}

{% import '//mix/hooks.sh' as hooks %}

{% block install %}
{{hooks.install_glib_schemas()}}
{{super()}}
cp ${tmp}/obj/qw ${out}/bin/evince
{{hooks.wrap_xdg_binary('evince')}}
{% endblock %}
