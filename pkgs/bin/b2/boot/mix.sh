{% extends '//bin/b2/t/mix.sh' %}

{% block build %}
sh bootstrap.sh
{% endblock %}

{% block install %}
./b2 install --prefix=${out}
{% endblock %}
