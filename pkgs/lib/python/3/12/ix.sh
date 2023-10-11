{% extends 't/ix.sh' %}

{% block bld_tool %}
bld/python/12
{{super()}}
{% endblock %}

{% block configure_flags %}
--disable-ipv6
--with-build-python=${NATIVE_PYTHON}
{{super()}}
{% endblock %}

{% block configure %}
export READELF=llvm-readelf
export ac_cv_file__dev_ptmx=yes
export ac_cv_file__dev_ptc=no
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cp Modules/_hacl/libH*.a ${out}/lib/
{% endblock %}
