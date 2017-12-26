
# globals

DM_IMAGE="dev-master"
DM_TAG="0.0.2"

# functions

dm_run()
{
    sudo docker run \
        -it \
        --volume=${HOME}/.dotfiles:/home/dev/.dotfiles \
        ${DM_IMAGE}:${DM_TAG}
}

dm_run
