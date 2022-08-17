{% extends '//lib/python/3/8/ix.sh' %}

{% block install %}
# TODO(pg): fix base template instead
mkdir ${out}/bin
>${out}/bin/qw.o
{{super()}}
{% endblock %}

{% block postinstall %}
: nothing to do
{% endblock %}
