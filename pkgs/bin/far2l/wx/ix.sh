{% extends '//bin/far2l/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/wx/widgets
{% endblock %}

{% block cmake_flags %}
{{super()}}
USEWX=ON
{% endblock %}
