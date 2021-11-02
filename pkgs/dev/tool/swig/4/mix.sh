{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://downloads.sourceforge.net/project/swig/swig/swig-4.0.2/swig-4.0.2.tar.gz
# md5 7c3e46cb5af2b469722cafa0d91e127b
{% endblock %}

{% block bld_deps %}
lib/cxx/mix.sh
lib/pcre/mix.sh
dev/lang/bison/3.7.6/mix.sh
env/autohell/mix.sh
{% endblock %}

{% block make_target %}
{% endblock %}

{% block coflags %}
--with-boost=no
{% endblock %}
