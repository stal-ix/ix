{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
most
{% endblock %}

{% block version %}
5.2.0
{% endblock %}

{% block fetch %}
https://www.jedsoft.org/releases/most/most-{{self.version().strip()}}.tar.gz
9455aeb8f826fa8385c850dc22bf0f22cf9069b3c3423fba4bf2c6f6226d9903
{% endblock %}

{% block bld_libs %}
lib/c
lib/slang
lib/shim/fake(lib_name=termcap)
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|/bin/cp|cp|' -e 's|/bin/rm|rm|' -i ${l}
done
{% endblock %}
