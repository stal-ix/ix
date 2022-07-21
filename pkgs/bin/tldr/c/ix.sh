{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/tldr-pages/tldr-c-client/archive/refs/tags/v1.5.0.tar.gz
sha:8e3f0c3f471896f8cfadbf9000aa8f2eff61fc3d76e25203ddc7640331c2a2af
{% endblock %}

{% block bld_libs %}
lib/c
lib/fts
lib/zip
lib/curl
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}
