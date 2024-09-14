
from pathlib import Path
import pickle, gzip, math, os
from urllib.request import urlretrieve

MNIST_URL='https://github.com/mnielsen/neural-networks-and-deep-learning/blob/master/data/mnist.pkl.gz?raw=true'


def load_data(path):
    path.mkdir(exist_ok=True)
    path_gz = path/'mnist.pkl.gz'
    if not path_gz.exists():
        print('Downloading MNIST data...')
        urlretrieve(MNIST_URL, path_gz)
    with gzip.open(path_gz, 'rb') as f:
     ((x_train, y_train), (x_valid, y_valid), _) = pickle.load(f, encoding='latin-1')
    return x_train, y_train, x_valid, y_valid
 