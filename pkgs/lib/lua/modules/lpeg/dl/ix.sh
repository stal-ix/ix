{% extends '//die/dl/fix.sh' %}

{% block export_symbols %}
luaopen_lpeg
{% endblock %}

{% block export_lib %}
lpeg
{% endblock %}
