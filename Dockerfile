FROM andrewosh/binder-base
USER main

RUN git clone https://github.com/jakevdp/JSAnimation.git /tmp/JSAnimation
WORKDIR /tmp/JSAnimation
RUN /home/main/anaconda2/envs/python3/bin/python3 setup.py install
RUN /home/main/anaconda2/bin/python setup.py install
USER root
RUN mkdir /home/main/notebooks
RUN chown main:main /home/main/notebooks
WORKDIR /home/main/notebooks

COPY . /home/main/notebooks/
RUN chown -R main:main $HOME/notebooks
USER main
RUN find $HOME/notebooks -name '*.ipynb' -exec jupyter trust {} \;

WORKDIR $HOME/notebooks
