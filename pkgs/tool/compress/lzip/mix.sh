{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://download.savannah.gnu.org/releases/lzip/lzip-1.22.tar.gz
# md5 f062faf68595d594a28fade73a43c001
{% endblock %}

{% block bld_deps %}
lib/cxx/mix.sh
env/autohell/mix.sh
{% endblock %}
