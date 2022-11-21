{% extends '//bin/gnuplot/ix.sh' %}

{% block bld_libs %}
lib/cairo
lib/wx/widgets
{{super()}}
{% endblock %}
