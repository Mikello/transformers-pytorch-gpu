docker stop transformers-ex
docker rm transformers-ex
docker run -d --gpus=all --ipc=host \
    --name=transformers-ex \
    --restart=unless-stopped \
    -u $(id -u ${USER}):$(id -g ${USER}) \
    -p 42000:8888 \
    -v /home/z/work/huawei_nlp/NBME:/home/NBME \
    beomi/transformers-pytorch-gpu:1.7.0-nvcr \
    zsh -c '
    export SHELL=zsh;
    jupyter notebook \
    --no-browser \
    --ip=0.0.0.0 \
    --allow-root \
    --NotebookApp.token= \
    --notebook-dir=/home'
