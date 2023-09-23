{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
#https://fossies.org/linux/misc/psensor-1.2.1.tar.gz
#sha:084f785d169f533d3010e50c5933436ed427afc70d41740b762f1db5034833ab
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
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/glib
{% endblock %}

{% block setup %}
export GLIB_COMPILE_SCHEMAS=glib-compile-schemas
{% endblock %}

{% block patch %}
sed -e 's|if X11|if GTK|'  \
    -e 's|if XEXT|if GTK|' \
    -i src/Makefile.am
{% endblock %}
