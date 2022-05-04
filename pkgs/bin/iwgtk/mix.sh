{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/J-Lentz/iwgtk/archive/8db48d3dd114a8c12229bc8bfae920330fec2670.zip
sha:f4c9560f524a40dd62c28c68a1f9db61dfb7bd7aba5266510cf96b6dfdda5832
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/gtk/3
{% endblock %}

{% block bld_tool %}
bin/gzip
bld/pkg/config
{% endblock %}
