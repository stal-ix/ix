{% extends '//lib/freetype/hb/ix.sh' %}

{% block patch %}
{{super()}}
sed -e 's|.*define FT_CONFIG_OPTION_SUBPIXEL_RENDERING.*|#define FT_CONFIG_OPTION_SUBPIXEL_RENDERING|' -i include/freetype/config/ftoption.h
{% endblock %}
