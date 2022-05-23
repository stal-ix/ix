{% extends '//die/c_std.sh' %}

{% block fetch %}
https://waf.io/waf-2.0.24.tar.bz2
sha:6b78a3594540b232a154f64c4eb7e21f28e4e073c7e1605e4b9977519a6cb89e
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
