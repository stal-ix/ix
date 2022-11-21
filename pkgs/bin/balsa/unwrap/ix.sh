{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://pawsa.fedorapeople.org/balsa/balsa-2.6.4.tar.xz
sha:befa5984511db33d41f2b1ecbfc99e22a15d45d08efe5d737b5174a1a6ac8fc1
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/ical
lib/xml/2
lib/gmime
lib/gpgme
lib/gspell
lib/gnutls
lib/secret
lib/notify
lib/fribidi
lib/enchant
lib/sqlite/3
lib/gtk/deps
lib/web/kit/gtk
lib/web/kit/deps
lib/{{allocator}}/trim(delay=5,bytes=10000000)
{% endblock %}

{% block conf_ver %}
2/71
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

{% block cpp_missing %}
fcntl.h
{% endblock %}

{% block configure_flags %}
--with-sqlite
--with-rubrica
--with-html-widget=webkit2
--with-spell-checker=gspell
{% endblock %}
