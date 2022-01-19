{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://src.fedoraproject.org/repo/pkgs/zip/zip30.tar.gz/7b74551e63f8ee6aab6fbc86676c0d37/zip30.tar.gz
7b74551e63f8ee6aab6fbc86676c0d37
{% endblock %}

{% block std_box %}
bld/bootbox
{% endblock %}

{% block make_flags %}
-f unix/Makefile
BINDIR="${out}/bin"
MANDIR="${out}/man"
{% endblock %}

{% block cpp_defines %}
UNIX
{% endblock %}

{% block setup %}
export CPPFLAGS="-I. ${CPPFLAGS}"
{% endblock %}

{% block make_target %}
zips
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
