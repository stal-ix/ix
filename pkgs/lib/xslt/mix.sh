{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
http://xmlsoft.org/sources/libxslt-1.1.34.tar.gz
db8765c8d076f1b6caafd9f2542a304a
{% endblock %}

{% block bld_tool %}
dev/build/autoconf/2/69/mix.sh
dev/build/automake/1.16.3/mix.sh
{% endblock %}

{% block lib_deps %}
lib/xml2/mix.sh
{% endblock %}

{% block coflags %}
--with-python=no
--without-python
{% endblock %}
