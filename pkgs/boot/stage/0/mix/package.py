def package(mix):
    md5 = {
        'darwin-x86_64': '163fdaabab2c293d495fe61e617f4909',
        'darwin-arm64': 'be4aee859a72b5c43c038e6ab30ea06b',
        'linux-x86_64': '1451ac6a045d43e9f74d4179bd1dd26b',
    }

    return {
        'build': {
            'script': mix.files.build_py,
            'fetch': [
                {
                    'url': 'https://storage.yandexcloud.net/mix-cache/bootstrap-{{mix.platform.target.os}}-{{mix.platform.target.arch}}.tar.gz',
                    'md5': md5['{{mix.platform.target.os}}-{{mix.platform.target.arch}}'],
                },
            ],
        },
        'runtime': {
            'depends': [
                'env/lld/{{mix.platform.target.os}}',
                'env/clang',
            ],
        },
    }
