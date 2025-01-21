{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/inkscape/unwrap(libcplpl_ver=18)
bin/xdg/er(wrap=inkscape)
{% endblock %}
