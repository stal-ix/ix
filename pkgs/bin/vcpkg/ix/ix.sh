{% extends '//bin/vcpkg/stock/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/shim/ix
{% endblock %}

{% block cpp_missing %}
{{super()}}
ix.h
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|temp_folder_path = .*|temp_folder_path = ix_temp_dir();|' \
    -i src/vcpkg/base/files.cpp
{% endblock %}
