{% extends '//lib/glib/t/mix.sh' %}

{% block lib_deps %}
lib/intl
{{super()}}
{% endblock %}

{% block bld_tool %}
bin/glib/codegen
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
find ${out}/ -type f -name '*.pc' | while read i; do
    sed -e 's|.*bindir.*||' -i ${i}
done
{% endblock %}

{% block patch %}
patch -p1 << EOF
{% include '00.diff' %}
EOF
{% endblock %}
