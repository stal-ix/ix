{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
kmod
{% endblock %}

{% block version %}
34.3
{% endblock %}

{% block fetch %}
https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/snapshot/kmod-{{self.version().strip()}}.tar.gz
26e7ef068cd935d0f882b2e3b11f4452a1ed239aa24d68bfcaa047475e254e1f
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
--disable-manpages
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
