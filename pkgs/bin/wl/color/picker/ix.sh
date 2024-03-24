{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/bash
bin/grim
bin/slurp
bin/zenity
bin/convert
bin/wl/clipboard
bin/wl/color/picker/unwrap
{% endblock %}
