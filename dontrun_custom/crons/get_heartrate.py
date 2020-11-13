from datetime import datetime as dt, timedelta
from subprocess import run
from threading import Timer
from os import getenv

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

get_heart_rate()

