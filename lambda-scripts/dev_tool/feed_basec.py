import datetime
import json
import helper.sqs_helper as sqs_helper
from bson import json_util


def send_data():
    data = {
        "cpf": "953.554.050-53",
        "datetime": datetime.datetime.now(),
        "movimentacaoFinanceira": "movimentacaoFinanceira",
        "ultimaCompra": "ultimaCompra"
    }
    json_data = json.dumps(data, default=json_util.default)
    sqs_helper.send_sqs_data('feed-basec-queue', json_data)


if __name__ == '__main__':
    send_data()
