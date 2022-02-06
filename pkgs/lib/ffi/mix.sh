{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://github.com/libffi/libffi/archive/refs/tags/v3.4.2.tar.gz
f2e272ec793571f28d52006ad14534c4
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
{% if target.os == 'linux' %}
lib/linux
{% endif %}
{% endblock %}

{% block bld_tool %}
bin/sed
bin/texinfo
bin/auto/conf/2/69
bin/auto/make/1/16
{% endblock %}

{% block std_box %}
bld/bootbox
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-system-ffi=yes --with-libffi-prefix=${out} \${COFLAGS}"
{% endblock %}
