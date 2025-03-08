{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/snapshot/kmod-34.1.tar.gz
sha:0f3f7b7884fa546538ed1b30d6ca088a5b05fc3675c8220115e3e4155e2dd190
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
