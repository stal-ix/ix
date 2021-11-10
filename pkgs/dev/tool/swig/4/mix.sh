{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/swig/swig/swig-4.0.2/swig-4.0.2.tar.gz
7c3e46cb5af2b469722cafa0d91e127b
{% endblock %}

{% block bld_deps %}
lib/c++/mix.sh
lib/pcre/mix.sh
dev/lang/bison/3.7.6/mix.sh
{{super()}}
{% endblock %}

{% block coflags %}
--with-boost=no
{% endblock %}
