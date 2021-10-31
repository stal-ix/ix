{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://downloads.sourceforge.net/project/swig/swig/swig-4.0.2/swig-4.0.2.tar.gz
# md5 7c3e46cb5af2b469722cafa0d91e127b
{% endblock %}

{% block deps %}
# bld lib/cxx/package.sh
# bld lib/pcre/package.sh
# bld dev/build/make/package.sh
# bld dev/lang/bison/3.7.6/package.sh
# bld env/std/package.sh
{% endblock %}

{% block coflags %}
--with-boost=no
{% endblock %}
