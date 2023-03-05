{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sed
bin/file
bin/patch
bin/diffutils
bin/findutils
bin/gawk/lite
bin/grep/patched
bin/coreutils/lite
{% endblock %}
