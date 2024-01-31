{% block kernel_version %}
6.6.14
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}

{% block kernel_sha %}
fbe96b2db3f962cd2a96a849d554300e7a4555995160082d4f323c2a1dfa1584
{% endblock %}

{% include '//bin/kernel/t/ver.sh' %}
