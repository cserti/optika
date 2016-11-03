FROM andrewosh/binder-base
USER root

RUN conda install -c conda-forge ipywidgets
#RUN /home/main/anaconda2/envs/python3/bin/pip install ipywidgets
#RUN /home/main/anaconda2/envs/python3/bin/jupyter nbextension install --py --sys-prefix widgetsnbextension
#RUN /home/main/anaconda2/envs/python3/bin/jupyter nbextension enable --py --sys-prefix widgetsnbextension

#RUN /home/main/anaconda2/bin/pip install ipywidgets
#RUN /home/main/anaconda2/bin/jupyter nbextension install --py --sys-prefix widgetsnbextension
#RUN /home/main/anaconda2/bin/jupyter nbextension enable --py --sys-prefix widgetsnbextension

USER main

RUN git clone https://github.com/jakevdp/JSAnimation.git /tmp/JSAnimation
WORKDIR /tmp/JSAnimation
RUN /home/main/anaconda2/envs/python3/bin/python3 setup.py install
RUN /home/main/anaconda2/bin/python setup.py install

WORKDIR $HOME/notebooks
