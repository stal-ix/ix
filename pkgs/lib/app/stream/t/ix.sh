{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
appstream
{% endblock %}

{% block version %}
1.1.1
{% endblock %}

{% block fetch %}
https://github.com/ximion/appstream/archive/refs/tags/v{{self.version().strip()}}.tar.gz
1615468b8d1e5edb9a9081f81841c8a22439c64bee5f02b008b3b8d5a5204c91
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

# data/gen-output invokes the just-built `appstreamcli news-to-metainfo`
# during the build, which aborts with SIGABRT (exit 134) in the
# sandbox. The tool's only job here is to splice release info from
# NEWS into the metainfo XML; skip that and just pass the plain
# metainfo through — the installed package loses per-release notes,
# but the binary itself is unchanged.
sed -e "s|command : \[ascli_exe, 'news-to-metainfo'.*$|command : ['cp', '@INPUT1@', '@OUTPUT@']|" \
    -i data/meson.build
{% endblock %}
