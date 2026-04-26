{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gofra
{% endblock %}

{% block version %}
a23f584bb05c83c51df5942cd15114b47095b7dc
{% endblock %}

{% block go_url %}
https://github.com/pg83/gofra/archive/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
f379bccaefc889ff0559b19d84eb8909cacfbac44124cdb26ae672dfba625925
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gofra ${out}/bin
{% endblock %}
