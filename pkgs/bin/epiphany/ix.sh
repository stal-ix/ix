{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/shepherd
bin/epiphany/gui
bin/xdg/er/webkit(wrap=epiphany,prefix=shepherd)
{% endblock %}
