{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/snapshot/kmod-30.tar.gz
sha:1fa3974abd80b992d61324bcc04fa65ea96cfe2e9e1150f48394833030c4b583
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/zstd
lib/openssl
{% endblock %}

{% block configure_all_flags %}
--with-xz
--with-zlib
--with-zstd
--with-openssl
--prefix=${out}
{% endblock %}

{% block patch %}
touch libkmod/docs/gtk-doc.make
rm autogen.sh
cat << EOF > man/Makefile.am
all:
install:
EOF
{% endblock %}

{% block build %}
{{super()}}
llvm-ar qL \
    libkmod/.libs/libkmod.so.2.4.0 \
    shared/.libs/libshared.a \
    libkmod/.libs/libkmod-internal.a
{% endblock %}
