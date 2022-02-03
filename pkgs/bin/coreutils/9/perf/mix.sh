{% extends '//bin/coreutils/9/0/mix.sh' %}

{% block configure %}
# perf test
date
{{super()}}
date
exit 1
{% endblock %}
