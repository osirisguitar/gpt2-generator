import gpt_2_simple as gpt2
import os
import requests
import sys
from datetime import datetime

sess = gpt2.start_tf_sess()
gpt2.load_gpt2(sess, run_name=sys.argv[1])
gpt2.generate(sess,
              length=int(sys.argv[3]),
              temperature=float(sys.argv[4]),
              prefix=sys.argv[2],
              nsamples=1,
              batch_size=1,
              run_name=sys.argv[1]
              )
