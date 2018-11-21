# Build as jupyterhub/singleuser
# Run with the DockerSpawner in JupyterHub

FROM jupyter/scipy-notebook

MAINTAINER Project Jupyter <jupyter@googlegroups.com>

USER root

RUN apt-get update && \
    apt-get install -y libgeos-dev libproj-dev proj-data proj-bin

USER jovyan

# Install packages in default Python 3 environment
RUN pip install \
  netCDF4==1.2.9 \
  gsw==3.1.1

RUN pip install https://github.com/matplotlib/basemap/archive/v1.1.0.tar.gz
RUN pip install shapely cartopy==0.13.1 --no-binary shapely --no-binary cartopy

# Install packages in Python 2 environment
RUN $CONDA_DIR/envs/python2/bin/pip install \
  netCDF4==1.2.9 \
  gsw==3.0.6

RUN $CONDA_DIR/envs/python2/bin/pip install https://github.com/matplotlib/basemap/archive/v1.1.0.tar.gz
RUN $CONDA_DIR/envs/python2/bin/pip install shapely cartopy==0.13.1 --no-binary shapely --no-binary cartopy

# smoke test that it's importable at least
#RUN sh /usr/local/bin/start-singleuser.sh -h
CMD ["start-singleuser.sh"]
