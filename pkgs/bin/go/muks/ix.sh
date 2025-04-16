{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gomuks
{% endblock %}

{% block version %}
0.3.1
{% endblock %}

{% block go_url %}
https://github.com/tulir/gomuks/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
4574987269769d1d6cb6a2c66ae7e66ff43263b8817bea4841fb7762c932508c
{% endblock %}

{% block bld_libs %}
lib/olm
lib/shim/fake(lib_name=stdc++)
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gomuks ${out}/bin/
{% endblock %}
