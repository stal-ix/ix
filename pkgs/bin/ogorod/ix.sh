{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/ogorod/archive/2050400fac77c7674b632ccf800624ba6b3185bf.tar.gz
{% endblock %}

{% block go_sha %}
e7b6a317db96686b18b9178416c8ab7350c61ca6d9466a480bd335ee98c88076
{% endblock %}

{% block go_bins %}
ogorod
{% endblock %}
