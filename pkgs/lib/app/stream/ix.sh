{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/ximion/appstream/archive/refs/tags/v0.16.3.tar.gz
sha:4470a27474dc3cc4938552fbf0394b6a65d8a2055d4f4418df086d65d8f2ba29
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/yaml
lib/curl
lib/xml/b
lib/xml/2
{% endblock %}

{% block meson_flags %}
stemming=false
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
