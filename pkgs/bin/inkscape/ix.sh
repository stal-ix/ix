{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/inkscape/unwrap
bin/xdg/er(wrap=inkscape)
{% endblock %}
