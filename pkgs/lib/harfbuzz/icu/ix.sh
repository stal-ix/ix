{% extends '//lib/harfbuzz/ft/ix.sh' %}

{% block lib_deps %}
lib/icu
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
find . -type f | grep -v icu | xargs rm
{% endblock %}

{% block env %}
{# actually, part of include/harfbuzz/hb-features.h #}
export CPPFLAGS="-DHB_HAS_ICU=1 \${CPPFLAGS}"
{% endblock %}
