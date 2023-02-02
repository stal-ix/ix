{% extends '//die/c/make.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux/util
{% endblock %}

{% block make_flags %}
-f Bootstrap.mak
{% endblock %}

{% block make_target %}
{% if linux %}
linux
{% else %}
osx
{% endif %}
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp bin/release/premake5 ${out}/bin/
{% endblock %}

{% block cpp_missing %}
unistd.h
{% endblock %}
