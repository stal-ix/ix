{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
appstream
{% endblock %}

{% block version %}
1.1.0
{% endblock %}

{% block fetch %}
https://github.com/ximion/appstream/archive/refs/tags/v{{self.version().strip()}}.tar.gz
4dd509614470b7e82695f46c8072bee603fbe6a260c2b74794af03204e4dfb8f
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/yaml
lib/curl
lib/fyaml
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
