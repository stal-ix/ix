{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
http://www.ivarch.com/programs/sources/pv-1.6.6.tar.bz2
ff3564fddcc2b9bd4a9c1d143aba4b4c
{% endblock %}

{% block bld_tool %}
{% if target.os == 'darwin' %}
dev/lang/cctools/mix.sh
{% endif %}
{% endblock %}

{% block std_box %}
box/boot/mix.sh
{% endblock %}

{% block make_flags %}
{% if target.os == 'linux' %}
LD=ld.lld
{% endif %}
{% endblock %}

{% block setup %}
{% if target.os == 'darwin' %}
export CPPFLAGS="-Dstat64=stat -Dfstat64=fstat -Dlstat64=lstat ${CPPFLAGS}"
{% endif %}
{% endblock %}

{% block bld_libs %}
lib/c/mix.sh
{% endblock %}
