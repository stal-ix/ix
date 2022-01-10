{% extends '//lib/harfbuzz/mix.sh' %}

{% block lib_deps %}
lib/icu
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
find . -type f | grep -v icu | xargs rm
{% endblock %}
