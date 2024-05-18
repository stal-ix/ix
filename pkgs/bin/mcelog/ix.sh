{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/andikleen/mcelog/archive/refs/tags/v199.tar.gz
sha:65149c510f1463ee624b6e42943812c16ce25eeb5a42ce1e18fa41953529c819
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/sbin ${out}/bin
{% endblock %}

{% block make_flags %}
etcprefix=${out}
{% endblock %}
