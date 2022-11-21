{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/gnuplot/wx/unwrap
bin/xdg/wrapper(name=gnuplot)
{% endblock %}
