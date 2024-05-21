{% extends '//lib/ffi/unix/ix.sh' %}

{% block c_compiler %}
bin/gcc(for_target={{host.gnu.three}})
bin/gcc(for_target={{target.gnu.three}})
#bin/binutils(for_target={{target.gnu.three}},bin_prefix={{target.gnu.three}}-)
{% endblock %}
