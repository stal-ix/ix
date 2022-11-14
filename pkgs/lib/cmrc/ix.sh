{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://github.com/vector-of-bool/cmrc/archive/refs/tags/2.0.1.tar.gz
sha:edad5faaa0bea1df124b5e8cb00bf0adbd2faeccecd3b5c146796cbcb8b5b71b
{% endblock %}

{% block install %}
mkdir -p ${out}/lib/cmake/CMakeRC
cp CMakeRC.cmake ${out}/lib/cmake/CMakeRC/cmakerc-config.cmake
{% endblock %}
