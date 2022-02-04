{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/gsl/gsl-2.7.1.tar.gz
sha:dcb0fbd43048832b757ff9942691a8dd70026d5da0ff85601e52687f6deeb34b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
