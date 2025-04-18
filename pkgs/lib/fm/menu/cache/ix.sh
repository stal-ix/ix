{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
menu-cache
{% endblock %}

{% block version %}
1.1.1
{% endblock %}

{% block fetch %}
https://github.com/lxde/menu-cache/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:e8af90467df271c3c8700c840ca470ca2915699c6f213c502a87d74608748f08
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block bld_libs %}
lib/fm/extra
{% endblock %}

{% block bld_tool %}
bld/gtkdoc
bld/intltool
{% endblock %}

{% block configure_flags %}
--disable-gtk-doc
{% endblock %}

{% block setup_target_flags %}
export CFLAGS="-fcommon ${CFLAGS}"
{% endblock %}
