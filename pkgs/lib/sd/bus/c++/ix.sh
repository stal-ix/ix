{% extends 't/ix.sh' %}

{% block install %}
{{super()}}
sed -e 's|PkgConfig::Systemd;||' \
    -e 's|Threads::Threads||' \
    -i ${out}/lib/cmake/sdbus-c++/sdbus-c++-targets.cmake
{% endblock %}
