{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/inkscape/unwrap(libcplpl_ver=15)
bin/xdg/er(wrap=inkscape)
{% endblock %}
