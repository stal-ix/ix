{% extends '//mix/template/dlstubs.sh' %}

{% block lib_deps %}
lib/c/mix.sh
lib/mesa/drivers/full/mix.sh
{% endblock %}

{% block export_symbols %}
__driDriverGetExtensions_zink
{% endblock %}

{% block export_lib %}
zink_dri
{% endblock %}
