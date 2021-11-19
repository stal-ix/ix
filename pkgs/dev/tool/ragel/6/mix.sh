{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
http://www.colm.net/files/ragel/ragel-6.10.tar.gz
748cae8b50cffe9efcaa5acebc6abf0d
{% endblock %}

{% block bld_libs %}
lib/c++/mix.sh
{% endblock %}
