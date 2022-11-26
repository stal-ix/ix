{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sed
bin/grep
bin/file
bin/patch
bin/diffutils
bin/findutils
bin/gawk/lite
bin/coreutils/lite
{% endblock %}
