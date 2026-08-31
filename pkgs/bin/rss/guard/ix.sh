{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
rssguard
{% endblock %}

{% block version %}
5.2.5
{% endblock %}

{% block git_repo %}
https://github.com/martinrotter/rssguard
{% endblock %}

{% block git_branch %}
{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
f49a90cba4cac5425198981ae9030c4727be7667f37d38f400420386f0d7527c
{% endblock %}

{% block git_args %}
{{super()}}
refine_tools={{'bin/go/lang/25' | b64e}}
{% endblock %}

{% block git_refine %}
export GOSUMDB=off
export GOWORK=off
export GOCACHE=${tmp}/cgo
export GOMODCACHE=${tmp}/gmc
export GOPROXY=https://proxy.golang.org,direct
(
    cd resources/scripts/standalone/article-extractor
    go mod vendor
)
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/qt/6/base
lib/qt/6/deps
lib/qt/6/multimedia
lib/qt/6/declarative
lib/qt/6/declarative/deps
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
bld/qt/6/tools/qml
bin/go/lang/25
{% endblock %}

{% block cmake_flags %}
WEB_ARTICLE_VIEWER_WEBENGINE=OFF
FORCE_BUNDLE_ICONS=ON
ENABLE_MEDIAPLAYER_LIBMPV=OFF
{% endblock %}

{% block build %}
export CGO_ENABLED=0
export GO_EXTLINK_ENABLED=0
{{super()}}
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
