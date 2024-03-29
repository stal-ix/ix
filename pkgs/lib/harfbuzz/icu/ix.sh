{% extends '//lib/harfbuzz/unwrap/ix.sh' %}

{% block lib_deps %}
lib/icu
{{super()}}
{% endblock %}

{% block meson_flags %}
icu=enabled
{{super()}}
icu=enabled
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
