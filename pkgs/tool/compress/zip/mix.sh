{% extends '//mix/template/template.sh' %}

{% block fetch %}
https://src.fedoraproject.org/repo/pkgs/zip/zip30.tar.gz/7b74551e63f8ee6aab6fbc86676c0d37/zip30.tar.gz
7b74551e63f8ee6aab6fbc86676c0d37
{% endblock %}

{% block bld_deps %}
env/std/0/mix.sh
{% endblock %}

{% block build %}
make -j ${make_thrs} -f unix/Makefile CC="gcc" CPP="gcc -E" CFLAGS="-I. -DUNIX" zips
{% endblock %}

{% block install %}
make -f unix/Makefile BINDIR="${out}/bin" MANDIR="${out}/man" install
{% endblock %}
