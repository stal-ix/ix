{% extends '//lib/placebo/t/ix.sh' %}

{% block fetch %}
https://github.com/haasn/libplacebo/archive/refs/tags/v5.264.1.tar.gz
sha:1e8be260e104c0be061305e3c0f2099c79776528889d426c497da153e85f8b5c
{% endblock %}

{% block bld_libs %}
pip/glad2
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|.*PYTHONPATH.*||' -i meson.build
{% endblock %}
