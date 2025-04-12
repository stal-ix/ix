{% extends '//die/c/make.sh' %}

{% block version %}
1.10
{% endblock %}

{% block fetch %}
https://gitlab.com/craigbarnes/dte/-/archive/v{{self.version().strip()}}/dte-v{{self.version().strip()}}.tar.bz2
sha:10eb58a8639a56ad9305d6a39ac104bb4c4239ba17c850d4399bcffb50e96c14
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
{% endblock %}
