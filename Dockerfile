# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# Could not resolve unknown registry custom node: UnetLoaderGGUF (no aux_id provided)
# Could not resolve unknown registry custom node: ReferenceLatent (no aux_id provided)
# Could not resolve unknown registry custom node: ReferenceLatent (no aux_id provided)
# Could not resolve unknown registry custom node: EmptyQwenImageLayeredLatentImage (no aux_id provided)
# Could not resolve unknown registry custom node: ModelSamplingAuraFlow (no aux_id provided)
# Could not resolve unknown registry custom node: LatentCutToBatch (no aux_id provided)

# download models into comfyui
RUN comfy model download --url https://huggingface.co/unsloth/Qwen-Image-Layered-GGUF/resolve/main/qwen-image-layered-Q4_K_M.gguf --relative-path models/diffusion_models --filename qwen-image-layered-Q4_K_M.gguf
RUN comfy model download --url https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors --relative-path models/clip --filename qwen_2.5_vl_7b_fp8_scaled.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Qwen-Image-Layered_ComfyUI/resolve/main/split_files/vae/qwen_image_layered_vae.safetensors --relative-path models/vae --filename qwen_image_layered_vae.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
