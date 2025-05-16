{% extends '//die/fonts.sh' %}

{% block pkg_name %}
nerd-fonts
{% endblock %}

{% block version %}
3.4.0
{% endblock %}

{% block fetch %}
https://github.com/ryanoasis/nerd-fonts/releases/download/v{{self.version().strip()}}/NerdFontsSymbolsOnly.zip
sha:8e617904b980fe3648a4b116808788fe50c99d2d495376cb7c0badbd8a564c47
{% endblock %}

{% block skip_dirs %}0{% endblock %}
