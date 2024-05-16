{% extends '//die/c/make.sh' %}

{% block fetch %}
https://src.fedoraproject.org/repo/pkgs/zip/zip30.tar.gz/7b74551e63f8ee6aab6fbc86676c0d37/zip30.tar.gz
sha:f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block make_flags %}
-f unix/Makefile
BINDIR="${out}/bin"
MANDIR="${out}/man"
{% endblock %}

{% block cpp_defines %}
UNIX
{% endblock %}

{% block cpp_includes %}
${PWD}
{% endblock %}

{% block make_target %}
zips
{% endblock %}
