{% extends 't/ix.sh' %}

{% block install %}
{% if mingw32 %}
# see Makefile for details
touch bzip2 bzip2recover
{% endif %}{{super()}}{% endblock %}
