{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/lyonel/lshw/archive/refs/tags/B.02.20.tar.gz
sha:6b8346a89fb0f0f1798e66f6a707a881d38b9b3a67256b30fc4628dac09f291a
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/kernel
lib/shim/gnu
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/fakegit
bld/fake(tool_name=docbook2man)
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|sysconf(_SC_LONG_BIT)|LONG_BIT|' -i ${l}
done
{% endblock %}

{% block make_flags %}
SBINDIR=${out}/bin
{% endblock %}

{% block setup_target_flags %}
export CXXFLAGS="-Wno-register ${CXXFLAGS}"
{% endblock %}
