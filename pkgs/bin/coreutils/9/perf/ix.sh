{% extends '//bin/coreutils/9/0/ix.sh' %}

{% block shell %}
bin/gosh/posix
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
