{% extends '//die/c/ix.sh' %}

{% block bld_libs %}
lib/c/dl
lib/z/dl
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/make
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block setup %}
export CFLAGS="-fcommon ${CFLAGS}"
{% endblock %}

{% block patch %}
sed -e 's|test:|testxxx:|' -i contrib/asdf-module.mk
echo 'test:' >> contrib/asdf-module.mk
{% endblock %}

{% block build %}
ulimit -s 60000

sh make.sh sbcl \
    --prefix=${out} \
    --xc-host='{{self.boot_lisp().strip()}}' \
    --with-sb-ldb \
    --with-sb-thread \
    --with-sb-core-compression \
    --with-os-provides-dlopen
{% endblock %}

{% block install %}
sh install.sh
{% endblock %}

{% block postinstall %}
echo 'TODO(pg): move sbcl.core to proper place'
{% endblock %}
