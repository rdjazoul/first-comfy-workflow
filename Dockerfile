# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui
# (no custom nodes specified in the workflow)

# download models into comfyui
RUN comfy model download --url https://huggingface.co/stable-diffusion-v1-5/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.safetensors --relative-path models/checkpoints --filename v1-5-pruned-emaonly.safetensors
ARG CIVITAI_TOKEN
RUN comfy model download --url "https://civitai.com/api/download/models/287544?type=Model&format=SafeTensor" --relative-path models/loras --filename ton_lora.safetensors --civitai-token ${CIVITAI_TOKEN}

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
