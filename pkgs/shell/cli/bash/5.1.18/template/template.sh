{% extends '//shell/cli/bash/template/template.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/bash/bash-5.1.8.tar.gz
23eee6195b47318b9fd878e590ccb38c
{% endblock %}

{% block bld_libs %}lib/c/mix.sh{% endblock %}
