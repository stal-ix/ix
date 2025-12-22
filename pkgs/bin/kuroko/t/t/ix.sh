{% extends '//bin/kuroko/t/ix.sh' %}

{% block pkg_name %}
kuroko
{% endblock %}

{% block version %}
1.4.0
{% endblock %}

{% block fetch %}
https://github.com/kuroko-lang/kuroko/archive/refs/tags/v{{self.version().strip()}}.tar.gz
55c143761da9b3ed0f523b9f7828dc04fc8e02280783274376dbbd335866c95d
{% endblock %}

{% block build_flags %}
{{super()}}
wrap_cc
wrap_rdynamic
{% endblock %}

{% block modules %}
wcwidth
socket
math
random
timeit
{% endblock %}

{% block patch %}
{{super()}}
find . -type f | while read l; do
    sed -e 's|lib/kuroko|share|' -i ${l}
done
{% endblock %}
