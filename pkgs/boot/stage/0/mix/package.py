def package(mix):
    md5 = {
        'darwin-x86_64': '163fdaabab2c293d495fe61e617f4909',
        'darwin-arm64': '9dc885670475ad994afdccdad56d4637',
        'linux-x86_64': '76e3beaf0fa242210b93c8164f256922',
    }

    link = {
        'linux-x86_64': 'bootstrap-linux-x86_64-clang-13.0.0.tar.gz',
        'darwin-arm64': 'cache/6495d8eb5fce7b9e7f72dc271ff37fb5',
    }

    key = '{{mix.platform.target.os}}-{{mix.platform.target.arch}}'
    default = f'bootstrap-{key}.tar.gz'

    return {
        'build': {
            'script': mix.files.build_py,
            'fetch': [
                {
                    'url': 'https://storage.yandexcloud.net/mix-cache/' + link.get(key, default),
                    'md5': md5[key],
                },
            ],
        },
        'runtime': {
            'depends': [
                'env/lld/{{mix.platform.target.os}}/package.py',
                'env/clang/package.py',
            ],
        },
    }
