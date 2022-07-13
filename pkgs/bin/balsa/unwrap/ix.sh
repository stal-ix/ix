{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://pawsa.fedorapeople.org/balsa/balsa-2.6.3.tar.xz
sha:d4d04576c9a5026064f7d480b34531faf59543f2e4d57c48a6fa5c76661e1dd4
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/ical
lib/xml2
lib/gmime
lib/gpgme
lib/gspell
lib/gnutls
lib/secret
lib/notify
lib/fribidi
lib/sqlite3
lib/enchant
lib/gtk/deps
lib/web/kit/gtk
lib/web/kit/deps
lib/{{allocator}}/trim(delay=5,bytes=10000000)
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/intltool
bld/glib/codegen
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|webkit2gtk-4.0|webkit2gtk-4.1|g' -i ${l}
done
{% endblock %}

{% block setup %}
export CPPFLAGS="-include fcntl.h ${CPPFLAGS}"
{% endblock %}

{% block install %}
{{super()}}
{% call hooks.wrap_xdg_binary('balsa') %}
export WEBKIT_EXEC_PATH="\$(dirname \$(which WebKitWebProcess))"
{% endcall %}
{% endblock %}

{% block configure_flags %}
--with-sqlite
--with-rubrica
--with-html-widget=webkit2
--with-spell-checker=gspell
{% endblock %}
