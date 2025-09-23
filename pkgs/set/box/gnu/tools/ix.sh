{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sed
bin/grep
bin/file
bin/gawk
bin/patch
bin/diffutils
bin/findutils
{% endblock %}
