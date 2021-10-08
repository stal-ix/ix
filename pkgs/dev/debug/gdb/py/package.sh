{% extends '//utils/template.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/gdb/gdb-11.1.tar.xz
# md5 257cb0f67927f79acf636d8c01e19990
{% endblock %}

{% block deps %}
# bld dev/lang/python/3/10 dev/lang/python/libs
# bld dev/build/make env/std
{% endblock %}
