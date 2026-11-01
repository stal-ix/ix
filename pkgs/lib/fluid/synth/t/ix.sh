{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fluidsynth
{% endblock %}

{% block version %}
2.6.1
{% endblock %}

{% block git_repo %}
https://github.com/FluidSynth/fluidsynth
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
8cad339694c37233ad3140cd3b0e449ac8d18c58a987a0a152c4dc2dbb037905
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
{% endblock %}

{% block bld_libs %}
lib/signalsmith/dsp
lib/signalsmith/linear
lib/signalsmith/hilbert
{% endblock %}

{% block patch %}
sed -e 's|FetchContent_MakeAvailable(\(.*\))|add_library(\1 INTERFACE)|' \
    -i signalsmith-audio-basics/CMakeLists.txt
{% endblock %}
