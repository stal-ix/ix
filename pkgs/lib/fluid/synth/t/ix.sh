{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fluidsynth
{% endblock %}

{% block version %}
2.6.2
{% endblock %}

{% block git_repo %}
https://github.com/FluidSynth/fluidsynth
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
f0b0614345aa2a4aefbd8926a12f69df2eedf3f20966e64b1631a1f117cd0347
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
