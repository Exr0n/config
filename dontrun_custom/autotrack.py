from datetime import datetime as dt, timedelta
from subprocess import run
from threading import Timer
from os import getenv

def daylio_ping():
    # INTERVAL = 20*60
    # INTERVAL = 10
    DATA_PATH = getenv('XDG_DATA_HOME') + 'autotrack/daylio_response_time.csv'

    send = dt.now()
    got = run(['alerter',
        '-message', 'Use Daylio',
        '-timeout', str(20*60),
        '-appIcon', 'https://i.imgur.com/nOsmCE3.png',
        '-actions', 'Done',
        '-closeLabel', 'Skip'],
        capture_output=True).stdout.decode('UTF-8')
    # Timer(INTERVAL, ping_alerter).start()
    recv = dt.now()
    with open(DATA_PATH, 'a') as wf:
        wf.write(f'{send},{recv},{recv-send},{int(got=="Done")}\n')
    print('daylio', send, recv, recv-send, got)

def get_heart_rate():
    EXPORT_PATH = getenv('XDG_DATA_HOME') + 'autotrack/heartrate.csv'
    got = run(['alerter',
        '-message', "What's your morning heart rate?",
        '-appIcon', 'https://i.imgur.com/MYMuHdp.png',
        '-reply',   '80'],
        capture_output=True).stdout.decode('UTF-8')
    if got != '@CLOSED':
        with open(EXPORT_PATH, 'a') as wf:
            wf.write(f'{dt.now().timestamp()},{got}\n')


