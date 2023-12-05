{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sed
bin/patch
bin/diffutils
bin/findutils
bin/gawk/lite
bin/file/host
bin/grep/patched
bin/grep/scripts
bin/coreutils/lite
{% endblock %}
