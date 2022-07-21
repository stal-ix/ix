{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtk-doc/-/archive/GTK_DOC_1_32/gtk-doc-GTK_DOC_1_32.tar.bz2
sha:b248b0bbd7ddb1e15c52ffbbd4ce539fef318cac6c2cdac9a8b5788f855d0a55
{% endblock %}

{% block bld_libs %}
lib/python
pip/pygments
{% endblock %}

{% block bld_tool %}
bin/xsltproc
{% endblock %}

{% block meson_flags %}
yelp_manual=false
tests=false
{% endblock %}

{% block postinstall %}
:
{% endblock %}
