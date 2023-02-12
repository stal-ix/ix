{% extends '//lib/harfbuzz/t/ix.sh' %}

{% block lib_deps %}
lib/cairo
lib/freetype
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|bool b = hb_font_get|hb_font_get|' \
    -e 's|assert (b);||' \
    -i util/hb-info.cc
{% endblock %}

{% block install %}
{{super()}}

# TODO(pg83): what about hb-features.h
cd ${out}
find . -type f | grep -v cairo | xargs rm
{% endblock %}
