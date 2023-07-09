{% extends '//lib/harfbuzz/t/ix.sh' %}

{% block lib_deps %}
lib/cairo
lib/freetype
{{super()}}
{% endblock %}

{% block meson_flags %}
{{super()}}
utilities=disabled
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
find . -type f | grep -v cairo | xargs rm
{% endblock %}

{% block env %}
{# actually, part of include/harfbuzz/hb-features.h #}
export CPPFLAGS="-DHB_HAS_CAIRO=1 \${CPPFLAGS}"
{% endblock %}
