{% extends '//mix/autorehell.sh' %}

{% block fetch %}
http://xmlsoft.org/sources/libxslt-1.1.34.tar.gz
db8765c8d076f1b6caafd9f2542a304a
{% endblock %}

{% block lib_deps %}
lib/c
lib/xml2
{% endblock %}

{% block configure_flags %}
--with-python=no
--without-python
{% endblock %}
