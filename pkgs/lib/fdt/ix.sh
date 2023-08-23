{% extends '//die/c/make.sh' %}

{% block fetch %}
https://www.kernel.org/pub/software/utils/dtc/dtc-1.7.0.tar.xz
sha:29edce3d302a15563d8663198bbc398c5a0554765c83830d0d4c0409d21a16c4
{% endblock %}

{% block lib_deps %}
lib/c
lib/yaml
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/pkg/config
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
