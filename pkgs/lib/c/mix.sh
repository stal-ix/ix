{% extends '//mix/hub.sh' %}

{% block lib_deps %}
{% if purec %}
lib/{{purec}}
{% else %}
lib/dlfcn
#lib/nsss
lib/c/bare
{% endif %}
{% endblock %}
