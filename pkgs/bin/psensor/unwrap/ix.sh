{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.com/jeanfi/psensor/-/archive/1.2.1/psensor-1.2.1.tar.bz2
sha:95086ace5ef9bfbea5642ca436d3b84695d5e5d26324a39a13664da47d89248b
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gtop
lib/gtk/3
lib/json/c
lib/notify
#lib/micro/httpd
lib/app/indicator
lib/gdk/pixbuf/svg
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gettext
bld/help2man
bin/muslstack
{% endblock %}

{% block setup_target_flags %}
export GLIB_COMPILE_SCHEMAS=glib-compile-schemas
{% endblock %}

{% block make_no_thrs %}
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block patch %}
sed -e 's|if X11|if GTK|'  \
    -e 's|if XEXT|if GTK|' \
    -i src/Makefile.am
{% endblock %}

{% block install %}
{{super()}}
{# glibtop_open_s call overflow #}
muslstack -s 8388608 ${out}/bin/psensor
{% endblock %}
