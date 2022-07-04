{% extends '//bin/quake/1/vk/unwrap/ix.sh' %}

{% block cpp_defines %}
{{super()}}
USE_CRT_MALLOC=1
{% endblock %}

{% block fetch %}
https://github.com/pg83/vkQuake/archive/b33a88a3f2565157d82b411f9068f63be4399fea.zip
sha:bd876a0fefe9d3bdf97bf44f7f6987c379b19fcbb0b21c834f35dd10d8fc8a3c
{% endblock %}
