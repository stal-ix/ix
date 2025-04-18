{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
sdbus-cpp
{% endblock %}

{% block fetch %}
https://github.com/Kistler-Group/sdbus-cpp/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/basu
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|PkgConfig::Systemd;||' \
    -e 's|Threads::Threads||' \
    -i ${out}/lib/cmake/sdbus-c++/sdbus-c++-targets.cmake
{% endblock %}
