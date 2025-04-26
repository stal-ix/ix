{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
appstream
{% endblock %}

{% block version %}
1.0.5
{% endblock %}

{% block fetch %}
https://github.com/ximion/appstream/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:dd33b1375ba4221ffee060e2778c478e8150d7b1108c6309148f5fb1ca6e90c0
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/yaml
lib/curl
lib/xml/b
lib/xml/2
lib/stemmer
{% endblock %}

{% block meson_flags %}
systemd=false
gir=false
svg-support=false
apidocs=false
install-docs=false
{% endblock %}

{% block bld_tool %}
bld/glib
bin/gperf
bld/gettext
bld/fake/er(tool_name=itstool)
bld/fake/er(tool_name=xsltproc)
{% endblock %}

{% block patch %}
sed -e 's|/usr/include||' -i meson.build
{% endblock %}
