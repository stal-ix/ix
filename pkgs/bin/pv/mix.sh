{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
http://www.ivarch.com/programs/sources/pv-1.6.6.tar.bz2
ff3564fddcc2b9bd4a9c1d143aba4b4c
{% endblock %}

{% block bld_tool %}
{% if target.os == 'darwin' %}
dev/lang/cctools
{% endif %}
{% endblock %}

{% block std_box %}
bin/bootbox
{% endblock %}

{% block make_flags %}
{% if target.os == 'linux' %}
LD=ld.lld
{% endif %}
{% endblock %}

{% block cpp_defines %}
{% if target.os == 'darwin' %}
stat64=stat
fstat64=fstat
lstat64=lstat
{% endif %}
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
