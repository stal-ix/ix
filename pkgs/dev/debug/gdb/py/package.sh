{% extends '//util/python/lib.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/gdb/gdb-11.1.tar.xz
# md5 257cb0f67927f79acf636d8c01e19990
{% endblock %}

{% block deps %}
# lib dev/lang/python/3/10/lib
# bld pypi/pygments
{% endblock %}

{% block cflags %}
export PYTHONPATH="${PWD}/gdb/python/lib:${PYTHONPATH}"
{% endblock %}

{% block more_modules %}
cd gdb/python/lib && find . | grep '\.py$' | sed -e 's|./||' -e 's|\.py||' -e 's|/|.|g'
{% endblock %}
