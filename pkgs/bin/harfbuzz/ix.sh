{% extends '//lib/harfbuzz/t/ix.sh' %}

{% block bld_libs %}
lib/cairo
lib/chafa
{{super()}}
{% endblock %}

{% block meson_flags %}
{{super()}}
cairo=enabled
chafa=enabled
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|assert (b);|(void)b;|' -i util/hb-info.cc
{% endblock %}
