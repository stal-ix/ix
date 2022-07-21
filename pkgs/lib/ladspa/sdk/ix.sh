{% extends '//die/c/make.sh' %}

{% block fetch %}
http://www.ladspa.org/download/ladspa_sdk_1.17.tgz
sha:27d24f279e4b81bd17ecbdcc38e4c42991bb388826c0b200067ce0eb59d3da5b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/sndfile
{% endblock %}

{% block unpack %}
{{super()}}
cd src
{% endblock %}

{% block make_flags %}
CC=clang
CPP=clang++
INSTALL_PLUGINS_DIR="${out}/bin"
INSTALL_INCLUDE_DIR="${out}/include/"
INSTALL_BINARY_DIR="${out}/bin/"
{% endblock %}

{% block make_target %}
targets
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
