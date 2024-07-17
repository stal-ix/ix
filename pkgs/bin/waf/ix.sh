{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://waf.io/waf-2.1.2.tar.bz2
sha:170cd93799843da4d058f4918592266244e477441ec5044e97b3df71839fa7b9
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block patch %}
rm waf
{% endblock %}

{% block build %}
python3 ./waf-light configure build --zip-type=gz --prefix=${out}
{% endblock %}

{% block install %}
mkdir ${out}/bin/
cp waf ${out}/bin/
{% endblock %}
