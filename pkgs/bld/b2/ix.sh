{% extends '//bin/b2/t/ix.sh' %}

{% block build %}
sh bootstrap.sh
{% endblock %}

{% block install %}
./b2 install --prefix=${out}
{% endblock %}
