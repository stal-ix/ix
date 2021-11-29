{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
http://www.ijg.org/files/jpegsrc.v9d.tar.gz
ad7e40dedc268f97c44e7ee3cd54548a
{% endblock %}

{% block bld_tool %}
dev/build/autoconf/2/69/mix.sh
dev/build/automake/1.16.3/mix.sh
{% endblock %}
