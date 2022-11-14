{% extends '//bin/vcpkg/stock/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/shim/ix
{% endblock %}

{% block setup %}
{{super()}}
export CPPFLAGS="-include ix.h ${CPPFLAGS}"
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|temp_folder_path = .*|temp_folder_path = ix_temp_dir();|' \
    -i src/vcpkg/base/files.cpp
{% endblock %}
