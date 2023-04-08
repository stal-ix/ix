{% extends '//die/hub.sh' %}

{% block run_deps %}
{#
 # ambiguity here
 # cd /ix/store/iQl55bZ6VKCmU8jm-lib-c-plus-plus-16/include/
 # cat vector | grep formatter.h
 # include <__format/formatter.h>
#}
bin/ananicy/cpp(libcplpl_ver=15)
{% endblock %}

{% block run_data %}
bin/ananicy/good
{% endblock %}
