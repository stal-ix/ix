{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
waf
{% endblock %}

{% block version %}
2.1.7
{% endblock %}

{% block fetch %}
https://waf.io/waf-{{self.version().strip()}}.tar.bz2
d65141aaa59c52c65c3b9fb2ae0f280c0ddec585ff9948fe22ede1d857aeee75
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
