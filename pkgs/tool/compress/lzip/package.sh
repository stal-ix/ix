{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://download.savannah.gnu.org/releases/lzip/lzip-1.22.tar.gz
# md5 f062faf68595d594a28fade73a43c001
{% endblock %}

{% block deps %}
# bld lib/cxx dev/build/make env/std
{% endblock %}
