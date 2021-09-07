{% extends '//shell/bash/template/template.sh' %}

{% block deps %}
# dep dev/lang/byacc dev/build/make env/std
{% endblock %}

{% block conf %}
--disable-nls --disable-readline
{% endblock %}
