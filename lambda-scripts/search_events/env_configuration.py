class Development:
    def __init__(self):
        pass

    ES_HOST = 'search-challenge-tzmrlhv2uxu3u27atrvo5mxf2u.us-east-1.es.amazonaws.com'
    ES_PORT = 80
    ES_TIMEOUT = 10


class Test:
    def __init__(self):
        pass

    ES_HOST = 'test_env'
    ES_PORT = 0
    ES_TIMEOUT = 10


class Production:
    def __init__(self):
        pass

    ES_HOST = 'prod_env'
    ES_PORT = 0
    ES_TIMEOUT = 10
