{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://www.jedsoft.org/releases/most/most-5.1.0.tar.gz
0dc19e6045f689686e8579b2835cfdc6
{% endblock %}

{% block bld_libs %}
lib/c
lib/slang
{% endblock %}

{% block patch %}
sed -e 's|-ltermcap||g' -i configure
{% endblock %}

{% block setup %}
export CPPFLAGS="-iquote ${PWD}/src ${CPPFLAGS}"
{% endblock %}
