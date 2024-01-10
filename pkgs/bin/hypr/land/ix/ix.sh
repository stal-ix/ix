{% extends '//bin/hypr/land/stock/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/udis86
lib/shim/ix
{% endblock %}

{% block cpp_missing %}
{{super()}}
ix.h
{% endblock %}

{% block patch %}
{{super()}}
find . -type f | while read l; do
    sed -e 's|"/tmp/hypr/"|(std::string(ix_temp_session_dir()) + "/")|g' \
        -e 's|"/tmp/hypr"|ix_temp_session_dir()|g' \
        -i ${l}
done
sed -e 's|.*udis.*||' -i meson.build
sed -e 's|.*udis.*||' -i src/meson.build
{% endblock %}
