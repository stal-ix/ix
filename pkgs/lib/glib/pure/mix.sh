{% extends '//lib/glib/t/mix.sh' %}

{% block lib_deps %}
lib/intl/stub
{{super()}}
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/glib/codegen
{% endblock %}

{% block install %}
{{super()}}
find ${out}/ -type f -name '*.pc' | while read i; do
    sed -e 's|.*bindir.*||' -i ${i}
done
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I${out}/include/glib-2.0 -I${out}/lib/glib-2.0/include \${CPPFLAGS}"
{% endblock %}
