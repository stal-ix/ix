{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://downloads.sourceforge.net/project/swig/swig/swig-4.0.2/swig-4.0.2.tar.gz
# md5 7c3e46cb5af2b469722cafa0d91e127b
{% endblock %}

{% block deps %}
# bld lib/cxx lib/pcre
# bld dev/build/make dev/lang/bison/3.7.6 env/std
{% endblock %}

{% block coflags %}
--with-boost=no
{% endblock %}
