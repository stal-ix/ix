{% extends '//lib/c++/14/ix.sh' %}

{% block install %}
{{super()}}
sed -e 's|__wrap_iter<pointer>|pointer|' \
    -e 's|__wrap_iter<const_pointer>|const_pointer|' \
    -i ${out}/include/vector
{% endblock %}
