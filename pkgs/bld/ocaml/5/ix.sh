{% extends '//die/c/configure.sh' %}

{% block fetch %}
https://github.com/ocaml/ocaml/releases/download/5.4.0/ocaml-5.4.0.tar.gz
6fcf1b192e389e54c4f5cb51306ab2baee2a54a25b1770366de5a8b42695996e
{% endblock %}

{% block bld_tool %}
bin/gas
bld/bash
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}

{% block make_target %}
world
{% endblock %}

{% block build_flags %}
wrap_cc
no_werror
{% endblock %}

{% block configure_flags %}
--disable-debug-runtime
--disable-ocamldebug
--disable-debugger
--disable-dependency-generation
--disable-systhreads
--disable-str-lib
--disable-unix-lib
--disable-ocamldoc
--disable-ocamlobjinfo
--disable-ocamltest
{% endblock %}

{% block c_flags %}
-Wno-unknown-warning-option
-Wno-incompatible-function-pointer-types
-Wno-ignored-optimization-argument
{% endblock %}

{% block postinstall %}
:
{% endblock %}
