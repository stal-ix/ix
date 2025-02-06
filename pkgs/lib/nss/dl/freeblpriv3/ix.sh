{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/nss
{% endblock %}

{% block export_libs %}
libfreeblpriv.a
{% endblock %}

{% block export_lib %}
freeblpriv3
{% endblock %}
