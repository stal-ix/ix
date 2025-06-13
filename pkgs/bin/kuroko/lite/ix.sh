{% extends '//bin/kuroko/t/ix.sh' %}

{% block pkg_name %}
kuroko
{% endblock %}

{% block version %}
1.3.1
{% endblock %}

{% block fetch %}
https://github.com/kuroko-lang/kuroko/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b1d1c55e72b01b08e88e0cdb9368788f2e3851abc918e29cae16fc442bee9c43
{% endblock %}

{% block make_target %}
kuroko
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp kuroko ${out}/bin/
{% endblock %}
