{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
waf
{% endblock %}

{% block version %}
2.1.5
{% endblock %}

{% block fetch %}
https://waf.io/waf-{{self.version().strip()}}.tar.bz2
sha:ca23407fe8169c9ca8c439fcc8ac143230da056678df279220ebf0c10091678a
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
