{% extends '//lib/c++/16/ix.sh' %}

{% block c_compiler %}
bin/gcc(for_target={{target.gnu.three}})
{% endblock %}
