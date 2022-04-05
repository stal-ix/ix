{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/sed
bin/gawk
bin/grep
bin/file
bin/patch
bin/diffutils
bin/findutils
bin/coreutils/lite
{% endblock %}
