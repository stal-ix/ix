{% extends '//mix/autohell.sh' %}

{% block fetch %}
http://potrace.sourceforge.net/download/1.16/potrace-1.16.tar.gz
sha:be8248a17dedd6ccbaab2fcc45835bb0502d062e40fbded3bc56028ce5eb7acc
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
{% endblock %}

{% block configure_flags %}
--with-libpotrace
{% endblock %}
