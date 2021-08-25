# The base image, which will be the starting point for the Docker image.
# The python:3.8 is Ubuntu with Python installed.
FROM python:3.8

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# This section is needed for GPUs to work.
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
LABEL com.nvidia.volumes.needed="nvidia_driver"

# This is the directory that files will be copied into.
# It's also the directory that you'll start in if you connect to the image.
WORKDIR /stage/

# Copy the `requirements.txt` to `/stage/requirements.txt/` and then install them.
# We do this first because it's slow and each of these commands are cached in sequence.
COPY requirements.txt .
RUN pip install -r requirements.txt -f https://download.pytorch.org/whl/torch_st
able.html

# Copy the file `main.py` to `/stage/main.py`
# You might need multiple of these statements to copy all the files you need for your experiment.
COPY main.py .
