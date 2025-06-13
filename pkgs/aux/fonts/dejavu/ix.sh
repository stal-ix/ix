{% extends '//die/fonts.sh' %}

{% block pkg_name %}
dejavu
{% endblock %}

{% block version %}
2.37
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/dejavu/dejavu/{{self.version().strip()}}/dejavu-fonts-ttf-{{self.version().strip()}}.tar.bz2
fa9ca4d13871dd122f61258a80d01751d603b4d3ee14095d65453b4e846e17d7
{% endblock %}
