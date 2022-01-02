{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
gnu/sed
gnu/gawk
gnu/grep
gnu/patch
lib/magic
gnu/diffutils
gnu/findutils
gnu/coreutils/8/32(opt=fast)
{% endblock %}
