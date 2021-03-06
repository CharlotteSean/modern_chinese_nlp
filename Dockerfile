FROM ceshine/cuda-pytorch:0.4.1

MAINTAINER CeShine Lee <ceshine@ceshine.net>

RUN conda install -y  matplotlib seaborn && \
  conda clean -i -l -t -y
RUN pip install --upgrade pip && \
  pip install -U cupy pynvrtc git+https://github.com/salesforce/pytorch-qrnn \
  jupyter h5py pandas==0.22.0 sklearn plotly watermark pytest \
  pillow-simd joblib tqdm jupyter_contrib_nbextensions spacy \
  eli5 opencc-python-reimplemented thulac jieba sentencepiece click && \
  rm -rf ~/.cache/pip

RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable collapsible_headings/main

# TODO: create a separate group for 'docker' user
COPY --chown=docker:root notebooks /home/docker/project/notebooks
COPY --chown=docker:root scripts /home/docker/project/scripts
COPY --chown=docker:root dekisugi /home/docker/project/dekisugi
COPY --chown=docker:root setup.py /home/docker/project/setup.py
COPY --chown=docker:root jupyter_notebook_config.json /home/docker/project/
COPY --chown=docker:root jupyter_notebook_config.py /home/docker/project/

RUN sudo chown docker:root /home/docker/project
RUN pip install https://github.com/ceshine/pytorch_helper_bot/archive/0.0.2.zip && \
  pip install tensorboardX && rm -rf ~/.cache/pip
RUN cd /home/docker/project && pip install -e  .

WORKDIR /home/docker/project

# Jupyter
EXPOSE 8888
CMD jupyter notebook --ip=0.0.0.0 --port=8888 --config=jupyter_notebook_config.json --no-browser
