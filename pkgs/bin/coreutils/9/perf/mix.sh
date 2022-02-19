{% extends '//bin/coreutils/9/0/mix.sh' %}

{% block bld_tool %}
bin/busybox
{{super()}}
{% endblock %}

{% block configure %}
# cp --help
# exit 1
# perf test
date
{{super()}}
date
exit 1
{% endblock %}
