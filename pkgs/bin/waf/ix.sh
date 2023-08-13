{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://waf.io/waf-2.0.26.tar.bz2
sha:c33d19c1bdfae1b078edaef2fab19b1bc734294edd4cc005d4881e9d53ed219c
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
