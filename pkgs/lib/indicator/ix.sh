{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://launchpad.net/libindicator/12.10/12.10.1/+download/libindicator-12.10.1.tar.gz
sha:b2d2e44c10313d5c9cd60db455d520f80b36dc39562df079a3f29495e8f9447f
{% endblock %}

{% block lib_deps %}
lib/c
lib/gtk/3
{% endblock %}

{% block bld_tool %}
bld/python
bld/glib
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|bindir=.*||' -i ${out}/lib/pkgconfig/indicator3-0.4.pc
{% endblock %}
