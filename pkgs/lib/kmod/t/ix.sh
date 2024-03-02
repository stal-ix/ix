{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/snapshot/kmod-31.tar.gz
sha:16c40aaa50fc953035b4811b29ce3182f220e95f3c9e5eacb4b07b1abf85f003
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/zstd
lib/openssl
lib/shim/gnu/basename
{% endblock %}

{% block bld_libs %}
lib/shim/gnu/basename/overlay
{% endblock %}

{% block bld_tool %}
bld/fake/er(tool_name=xsltproc)
{% endblock %}

{% block configure_flags %}
--with-xz
--with-zlib
--with-zstd
--with-openssl
{% endblock %}

{% block patch %}
sed -e 's|.*is not supported by.*||' -i configure.ac
touch libkmod/docs/gtk-doc.make
rm autogen.sh
{% endblock %}

{% block build %}
{{super()}}
touch libkmod.so
touch man/modules.dep.bin.5
{% endblock %}
