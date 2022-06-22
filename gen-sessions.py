import random
import sys
from datetime import datetime

def main():
    """
    Generates random series
    """
    if len(sys.argv) == 1:
        sys.stderr.write("you need to specify the number of samples: {} <num_samples>\n".format(sys.argv[0]))
        sys.exit(-1)
    num_samples = int(sys.argv[1])
    random.seed(2022)
    print("nif,last_session,duration")
    for _ in range(num_samples):
        nif = str(random.randint(100, 1099))
        last_session_secs = random.randint(1300000000, 1655898860)
        last_session = datetime.fromtimestamp(last_session_secs)
        duration = random.randint(1, 200)
        print("{},{},{}".format(nif, last_session, duration))




if __name__ == "__main__":

    main()
