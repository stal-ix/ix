{% extends 't/ix.sh' %}

{% include '//bin/kernel/6/12/ver.sh' %}

{% block fetch %}
{{self.kernel_url().strip()}}
{{self.kernel_sha().strip()}}
{% endblock %}

{% block host_libs %}
lib/musl/pure(std_env={{std_env}},std_box={{std_box}},boot={{boot}})
{% endblock %}
