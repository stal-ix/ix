{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
gnu/file/mix.sh
gnu/findutils/mix.sh
gnu/sed/mix.sh
gnu/gawk/mix.sh
gnu/grep/mix.sh
gnu/patch/mix.sh
gnu/diffutils/mix.sh
gnu/coreutils/8.32/mix.sh
shell/cli/dash/minimal/mix.sh
{% endblock %}
