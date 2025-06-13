{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
waf
{% endblock %}

{% block version %}
2.1.6
{% endblock %}

{% block fetch %}
https://waf.io/waf-{{self.version().strip()}}.tar.bz2
sha:f9f1a8495ab7470844a05dd2e838017bcff969d92a9aeede7811d6ad74e04707
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
