{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://waf.io/waf-2.0.25.tar.bz2
sha:66cff7beed0e77db874e9232cc08874abb3e866c7f0f1f34ba2f959fde44fdd4
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
