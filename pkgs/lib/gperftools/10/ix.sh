{% extends '//lib/gperftools/t/ix.sh' %}

{% block pkg_name %}
gperftools
{% endblock %}

{% block version %}
2.10
{% endblock %}

{% block fetch %}
https://github.com/gperftools/gperftools/archive/refs/tags/gperftools-{{self.version().strip()}}.tar.gz
sha:b0dcfe3aca1a8355955f4b415ede43530e3bb91953b6ffdd75c45891070fe0f1
{% endblock %}
