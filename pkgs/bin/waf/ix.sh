{% extends '//die/c_std.sh' %}

{% block fetch %}
https://waf.io/waf-2.0.24.tar.bz2
sha:
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
