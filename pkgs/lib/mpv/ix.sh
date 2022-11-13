{% extends 't/ix.sh' %}

{% block build_flags %}
{{super()}}
wrap_cc
{% endblock %}

{% block waf_flags %}
{{super()}}
--enable-libmpv-shared
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
cp libmpv.so libmpv.a
{% endblock %}
