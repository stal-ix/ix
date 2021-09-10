def package(mix):
    return {
        'build': {
            'script': mix.files.build_py,
            'fetch': [
                {
                    'url': 'https://www.crufty.net/ftp/pub/sjg/bmake.tar.gz',
                    'md5': 'e3059851715a7747f9813f37eaaf4c1d',
                },
            ],
            'depends': [
                'boot/stage/1/env',
            ],
        },
    }
