{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/inkscape/unwrap(cplpl_std=15)
bin/xdg/er(wrap=inkscape)
{% endblock %}
