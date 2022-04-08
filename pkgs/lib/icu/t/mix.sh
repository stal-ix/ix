{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://github.com/unicode-org/icu/archive/refs/tags/release-71-1.tar.gz
sha:d88a4ea7a4a28b445bb073a6cfeb2a296bf49a4a2fe5f1b49f87ecb4fc55c51d
{% endblock %}

{% block unpack %}
{{super()}}
cd icu4c/source
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block configure_flags %}
--with-data-packaging=archive
{% endblock %}
