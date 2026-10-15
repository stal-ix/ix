{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
appstream
{% endblock %}

{% block version %}
1.2.1
{% endblock %}

{% block fetch %}
https://github.com/ximion/appstream/archive/refs/tags/v{{self.version().strip()}}.tar.gz
2bc53d1d63ae28e7409a15747d4ae23a557409249461aab87a7947640402d1bd
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
apidocs=false
install-docs=false
display-detection=none
bash-completion=false
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

# fy_node_set_style was added in libfyaml 0.9.4, not 0.9.0.
sed -e 's|AS_FYAML_CHECK_VERSION(0, 9, 0)|AS_FYAML_CHECK_VERSION(0, 9, 4)|' \
    -i src/as-reviews-client.c

# data/gen-output invokes the just-built `appstreamcli news-to-metainfo`
# during the build, which aborts with SIGABRT (exit 134) in the
# sandbox. The tool's only job here is to splice release info from
# NEWS into the metainfo XML; skip that and just pass the plain
# metainfo through — the installed package loses per-release notes,
# but the binary itself is unchanged.
sed -e "s|command : \[ascli_exe, 'news-to-metainfo'.*$|command : ['cp', '@INPUT1@', '@OUTPUT@']|" \
    -i data/meson.build
{% endblock %}
