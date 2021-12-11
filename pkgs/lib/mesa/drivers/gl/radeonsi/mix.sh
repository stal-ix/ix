{% extends '//mix/template/dlstubs.sh' %}

{% block lib_deps %}
lib/mesa/drivers/full/mix.sh
{% endblock %}

{% block export_symbols %}
__driDriverGetExtensions_radeonsi
{% endblock %}

{% block export_lib %}
radeon_dri
{% endblock %}
