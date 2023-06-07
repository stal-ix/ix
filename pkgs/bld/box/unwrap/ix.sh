{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sed
bin/file
bin/patch
bin/diffutils
bin/findutils
bin/gawk/lite
bin/grep/patched
bin/grep/scripts
bin/coreutils/lite
{% endblock %}
