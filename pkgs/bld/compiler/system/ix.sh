{% extends '//bld/system/ix.sh' %}

{% block ind_deps %}
bin/clang/lib
{% endblock %}

{% block env %}
{{super()}}
export CPPFLAGS="-isystem $(clang -print-resource-dir)/include ${CPPFLAGS}"
{% if system_cppflags %}
export CPPFLAGS="{{system_cppflags}} ${CPPFLAGS}"
{% endif %}
{% if system_cflags %}
export CFLAGS="{{system_cflags}} ${CFLAGS}"
{% endif %}
{% if system_cxxflags %}
export CXXFLAGS="{{system_cxxflags}} ${CXXFLAGS}"
{% endif %}
{% if system_ldflags %}
export LDFLAGS="{{system_ldflags}} ${LDFLAGS}"
{% endif %}
{% endblock %}
