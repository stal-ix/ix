{% extends '//bin/coreutils/9/1/ix.sh' %}

{% block box %}
bin/sed
bin/grep
bin/file
bin/patch
bin/gawk
bin/bsdutils
{% endblock %}

{% block configure %}
date
{{super()}}
date
exit 1
{% endblock %}
