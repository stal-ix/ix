{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
waf
{% endblock %}

{% block version %}
2.1.9
{% endblock %}

{% block fetch %}
https://waf.io/waf-{{self.version().strip()}}.tar.bz2
4a47a431b86d5c42fa23b8474aaf752384dcaed65fe9e6aa1f518c103d38a7d1
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
