{% extends '//mix/dlstubs.sh' %}

{% block lib_deps %}
lib/c
lib/mesa/drivers/full
{% endblock %}

{% block export_symbols %}
__driDriverGetExtensions_radeonsi
{% endblock %}

{% block export_lib %}
radeon_dri
{% endblock %}
