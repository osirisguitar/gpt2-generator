# gpt2-generator

A container-based node.js wrapper for gpt-2-simple https://github.com/minimaxir/gpt-2-simple using a pre-trained run.

Once the container is running, you can get a generated text in your browser from http://localhost:8866/generate?text=initialtext&length=300&temperature=0.7

## Setup

1. Clone the repo
2. `mkdir checkpoint`
3. Fine-tune gpt2 (for instance in Google Colab) and save your run from there. There are no features for finetuning in this repo, it has to be done externally.
4. Download the checkpoint file to your computer (it will be named checkpoint_run_1 by default)
5. Untar the checkpoint file.
6. Copy the contents of checkpoint from the tar file to ./checkpoint
7. `docker build .`
8. ``docker run -it -v `pwd`/checkpoint/:/app/checkpoint -e checkpoint=viking3_124_1000 -p 8866:8866 <docker-image-id>``
9. Access http://localhost:8866/generate?text=test. It will take somewhere between 10 and 30 seconds for a text to generate.

## Local install

I have no idea why you would ever want to do that (other than maybe use a GPU). To make this work versions of dependencies are really important. You need to install Tensorflow 1.14 or 1.15, which means you have to have Python version 3.3 - 3.8.