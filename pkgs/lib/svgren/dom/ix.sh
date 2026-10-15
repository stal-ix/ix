{% extends '//lib/svgren/t/ix.sh' %}

{% block pkg_name %}
svgdom
{% endblock %}

{% block version %}
0.4.35
{% endblock %}

{% block fetch %}
https://github.com/cppfw/svgdom/archive/refs/tags/{{self.version().strip()}}.tar.gz
38fcbd075dd527f911a211da6f3aa1e0e7a7c0166171136cd557bd908c9faab8
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/svgren/r4
lib/svgren/cssom
lib/svgren/mikroxml
lib/svgren/fsif
{% endblock %}
