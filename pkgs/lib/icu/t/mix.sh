{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://github.com/unicode-org/icu/archive/refs/tags/release-70-1.tar.gz
sha:f30d670bdc03ba999638a2d2511952ab94adf204d0e14898666f2e0cacb7fef1
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
