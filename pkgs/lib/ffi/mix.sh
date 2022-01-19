{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/libffi/libffi/archive/refs/tags/v3.4.2.tar.gz
f2e272ec793571f28d52006ad14534c4
{% endblock %}

{% block bld_libs %}
{% if target.os == 'linux' %}
lib/linux
{% endif %}
{% endblock %}

{% block bld_tool %}
lib/magic
bin/sed
dev/build/auto/conf/2/69
dev/build/auto/make/1/16
bin/texinfo
{% endblock %}

{% block std_box %}
bin/bootbox
{% endblock %}

{% block autoreconf %}
sh autogen.sh
{% endblock %}

{% block env %}
export COFLAGS="--with-system-ffi=yes --with-libffi-prefix=${out} \${COFLAGS}"
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
