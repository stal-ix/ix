{% extends '//bin/gnuplot/ix.sh' %}

{% block bld_libs %}
lib/cairo
lib/wx/widgets
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
{{hooks.wrap_xdg_binary('gnuplot')}}
{% endblock %}
