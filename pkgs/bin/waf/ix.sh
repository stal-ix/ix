{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://waf.io/waf-2.0.27.tar.bz2
sha:0c15f1b20de823c4fd5a224e5b0158446ef0b30f8a2f2185ac2218eb67c94519
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
