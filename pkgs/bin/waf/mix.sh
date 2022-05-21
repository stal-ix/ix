{% extends '//die/c_std.sh' %}

{% block fetch %}
https://waf.io/waf-2.0.23.tar.bz2
sha:28a96115a5b5be47cf65e62c5416d988159d03f062f978e6462024ca93111503
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
