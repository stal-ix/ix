{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
waf
{% endblock %}

{% block version %}
2.1.3
{% endblock %}

{% block fetch %}
https://waf.io/waf-{{self.version().strip()}}.tar.bz2
sha:d580873e9461c55fb91fa03d21eb9872c3acbdec6793448ab50746958d3d7757
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
