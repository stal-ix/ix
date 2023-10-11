{% extends '//lib/python/3/11/ix.sh' %}

{% block bld_tool %}
bin/python/11
{{super()}}
{% endblock %}

{% block configure_flags %}
--disable-ipv6
--with-build-python=python3
{{super()}}
{% endblock %}

{% block configure %}
export READELF=llvm-readelf
export ac_cv_file__dev_ptmx=yes
export ac_cv_file__dev_ptc=no
{{super()}}
{% endblock %}
